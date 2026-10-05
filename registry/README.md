# Official MCP Registry packet

Status re-checked 2026-10-04 (UTC), after the 1.1.0 publish:

- **1.1.0 is published and latest.** `com.commonelements/data` 1.1.0, status `active`, `isLatest: true`, published 2026-10-04 23:56 UTC through **DNS** authentication, `repository` pointing at this public repo (`CommonElements/common-elements-claude-plugins`). Check: `curl -s 'https://registry.modelcontextprotocol.io/v0/servers?search=com.commonelements'`.
- 1.0.0 (published 2026-08-03 through the HTTP proof at `https://commonelements.com/.well-known/mcp-registry-auth`) is still listed with `isLatest: false`. Its "390,000+" description and its `repository` link to the private `CommonElements/common-elements` stay on that immutable version; directories that read the latest version get 1.1.0, which has neither.
- **The MCP TXT record exists** on commonelements.com: `dig +short TXT commonelements.com` shows `v=MCPv1; k=ed25519; p=VZW3ZX9lO06C+Sq0QC1j8sKPkK0q8QyLF/2aHBRvsHU=` alongside the Google site-verification and SPF records. The key behind it is the one `setup-namespace-key.sh` generates at `~/.config/common-elements/mcp-registry-ed25519.pem`.
- The private key behind the old HTTP proof (`p=J8IcjK1xvG+bilJFZxYKPdW2AW0A93dZohjlJwpdNo0=`) is still not on this Mac; DNS authentication replaces it for future publishes.

`server.json` here is **version 1.1.0 under the same name**, `com.commonelements/data`, rather than a second entry. Registry names are permanent, and directories that ingest the registry (PulseMCP, Glama) already key on this one. It validates against the 2025-12-11 schema (checked with ajv). The description is 94 characters; the limit is 100.

> The Common Elements app repo now uses `com.commonelements/data` in both `packages/mcp-server/server.json` and `mcpName` in `packages/mcp-server/package.json` (CE PR #880, merged), with a test pinning both. `com.commonelements/mcp` was never published. Publish the npm package only with that `mcpName`.

## Steps (Harry; each one is public or touches DNS)

Steps 1 to 5 were completed on 2026-10-04 for 1.1.0 (repo public, key generated, TXT record live, published, verified). They stay here as the record and as the runbook if the key or record ever has to be replaced; for a routine new version, see "Later versions" below.

1. **Make the plugins repo public first.** `repository.url` points at `CommonElements/common-elements-claude-plugins`. If you publish before that repo exists, delete the `repository` block from `server.json` first.
2. **Generate the key and print the TXT value.** This creates `~/.config/common-elements/mcp-registry-ed25519.pem` (mode 600). The key is never committed.
   ```bash
   cd ~/dev/common-elements-claude-plugins
   ./registry/setup-namespace-key.sh
   ```
3. **Add the TXT record** that the script prints, at the apex. Its form is exactly
   `v=MCPv1; k=ed25519; p=<base64 of the 32-byte public key>`:
   ```bash
   vercel dns add commonelements.com @ TXT "v=MCPv1; k=ed25519; p=<PUB>" --scope theschoellergroup
   dig +short TXT commonelements.com | grep MCPv1      # wait until it shows
   ```
   commonelements.com is on Vercel DNS (`ns1/ns2.vercel-dns.com`) under the team `theschoellergroup` (verified with `vercel domains inspect`).
4. **Install the publisher and publish**:
   ```bash
   brew install mcp-publisher        # or the darwin_arm64 release from github.com/modelcontextprotocol/registry
   PRIV=$(openssl pkey -in ~/.config/common-elements/mcp-registry-ed25519.pem -noout -text | grep -A3 "priv:" | tail -n +2 | tr -d ' :\n')
   mcp-publisher validate registry/server.json   # if your build has validate
   mcp-publisher login dns --domain commonelements.com --private-key "$PRIV"
   mcp-publisher publish registry/server.json
   ```
   `login` overwrites `~/.config/mcp-publisher/token.json`, which is shared with the Voydar and SourceFinch publishes. Log in again for those products when you next publish them.
5. **Verify**: `curl -s 'https://registry.modelcontextprotocol.io/v0/servers?search=com.commonelements'` should show `1.1.0`, `isLatest: true`, status `active`.
6. **Optional: keep the HTTP proof consistent.** Put the new `p=` value in `PROOF_RECORD` in `apps/web/app/.well-known/mcp-registry-auth/route.ts` (CE app), or delete that route. A stale proof with a lost key is what blocked this publish.

## Later versions

Bump `version` and run `mcp-publisher publish registry/server.json` again. A published version is immutable. For a metadata-only fix, use a prerelease suffix such as `1.1.1-1`; note that a prerelease is not marked latest over a regular version.
