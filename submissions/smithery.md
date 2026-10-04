# Smithery

Lists the externally hosted server by URL. Source read 2026-10-04: https://smithery.ai/docs/build/publish. The Common Elements repo removed its old `smithery.yaml` on 2026-09-23 because it launched an npm package that was never published; the URL listing below is the right path.

## Before you start

- A Smithery account (the /new page signs in through WorkOS AuthKit; GitHub sign-in is likely offered but not verified).
- Smithery scans the server's tools. For an OAuth server you sign in during the scan; Smithery uses a client ID metadata document, which Common Elements supports. Use the reviewer or a staff account, granting read access only.
- Unauthenticated requests already get **401** (not 403), which Smithery needs. If Vercel's firewall challenges bots, allow the user agent `SmitheryBot/1.0`.

## Click-through (Harry)

1. Go to https://smithery.ai/new and sign in.
2. Choose the option to add a remote or externally hosted server, and enter `https://commonelements.com/api/mcp`.
3. Namespace and name: `@commonelements/common-elements` if Smithery lets you claim an organization namespace; otherwise your user namespace with the name `common-elements`.
4. Display name: `Common Elements`. Description: the short description from README.md. Homepage: `https://commonelements.com/developers/mcp`. Icon: `submissions/assets/common-elements-512.png`.
5. When asked to authenticate for the scan, complete the Common Elements consent screen.
6. No configuration schema is needed (OAuth; no headers or keys). If Smithery asks for one, submit an empty object schema `{"type":"object","properties":{}}`.
7. Publish.

CLI alternative (after `npm i -g @smithery/cli` and `smithery login`):

```bash
smithery mcp publish "https://commonelements.com/api/mcp" -n @commonelements/common-elements --config-schema '{"type":"object","properties":{}}'
```

If the scan fails, Smithery reads a static card at `https://commonelements.com/.well-known/mcp/server-card.json` (`serverInfo`, `authentication`, `tools`, `resources`, `prompts`). Common Elements does not serve one; add it only if the scan fails.
