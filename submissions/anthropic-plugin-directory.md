# Anthropic plugin directory (claude.ai, Cowork and Claude Code)

Lists `plugins/common-elements` from this repository. Listing metadata comes from `plugins/common-elements/.claude-plugin/plugin.json` and the plugin README; nothing is typed into the portal except data-handling answers.

Sources read 2026-10-04: https://claude.com/docs/plugins/submit, https://claude.com/docs/plugins/pre-submission-checklist, https://claude.com/docs/plugins/platform-support.

## Readiness correction (2026-10-09)

The public repository exists. Harry reported submitting the listing on October 9; approval and publication remain unverified. The listing is in the Commonelements Team workspace at https://claude.ai/directory/manage/plugins/e3141a77-c58b-490f-953e-535c257dbd6f. Version 1.1.0 passed file validation; that does not establish runtime or policy readiness. Version 1.1.1 is undergoing a new quality pass. Do not check testing or compliance attestations until current evidence supports them.

## File checklist (original check 2026-10-04)

| Requirement | Status |
|---|---|
| `.claude-plugin/plugin.json` with name, description, author, version | Done (`common-elements` 1.1.0) |
| Name: lowercase, hyphens, 64 characters or fewer, not a reserved word (`claude`, `anthropic`, `official`, `plugin`, `mcp`, `test`) | Done |
| README of 40+ words outside code blocks | Done |
| LICENSE file or `license` field | Done (MIT, both) |
| Non-image files under 256 KiB; 512 files or fewer | Done (about 20 small files) |
| Remote MCP server with `type: http` and an absolute https URL | Done |
| No secrets in the repo | Done (OAuth; no keys) |
| `claude plugin validate --strict plugins/common-elements` | Passes (run 2026-10-04) |
| Repository public on GitHub | Exists: CommonElements/common-elements-claude-plugins |
| Your GitHub account connected on claude.ai with push access to the repo | **Harry** |

Component support: skills and the remote MCP server load on claude.ai chat, Cowork and Claude Code. The `/common-elements:status` command loads as a skill in chat. There are no hooks, agents or `bin/` files.

## Click-through (Harry)

1. Use the existing public repository. Changes go through a reviewed pull request; do not create a second repository.
2. On https://claude.ai, Settings, connect GitHub if it is not connected.
3. Go to https://claude.ai/directory/manage, **Submit new**, **Plugin bundle**.
4. **Source**: repository `CommonElements/common-elements-claude-plugins`, plugin path `plugins/common-elements`, track branch `main`.
5. **Data handling**:
   - Reads or stores personal data: **Reads and stores**. The service reads authorized account data and stores requested account content, such as drafts. Lookup logs can contain search terms or addresses. Individual personal contact details are not returned.
   - Does any skill send data to a service other than declared connectors: **No**. Skills call the declared Common Elements connector. This does not mean the service has no infrastructure providers; see its privacy policy and the README's map-resource disclosures.
   - Retention: **Longer**. Usage and action logs are retained while the account is open. Submitted compliance text is discarded; its usage metadata is retained.
   - Intended for people under 18: **No**.
6. **Compliance**: contact email `hello@commonelements.com`; read and tick the four acknowledgments yourself (they bind Common Elements Inc.).
7. **Review and submit**: update trigger **Scheduled checks**; leave auto-publish **off** for the first version so each release is deliberate.

Submit the connector too ([anthropic-connectors-directory.md](anthropic-connectors-directory.md)): Anthropic asks for the server to be submitted on its own even when a plugin references it.

Limits: 10 submissions per organization per day. Ownership disputes: directory@anthropic.com.

## Behavior gates

- Run the bundled evaluation prompts with and without the plugin and retain the report. Mock or disconnected evaluations do not count as live connector tests.
- Install and exercise the bundle in chat, Cowork and Claude Code. Check organization-specific install state and reconnect instructions.
- Run every tool through MCP Inspector AND a Claude custom connector against a populated reviewer account. Use sample-only counterpart accounts for publishing, invitations and messages.
- Verify OAuth connect, refresh, revoke, read-only denial, organization isolation, preview approval and token expiry/replay.
- Capture the MCP Apps in supported hosts and verify text fallbacks.
- Re-validate the final merged commit in the portal before submitting. Keep auto-publish off.
