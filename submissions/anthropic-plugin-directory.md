# Anthropic plugin directory (claude.ai, Cowork and Claude Code)

Lists `plugins/common-elements` from this repository. Listing metadata comes from `plugins/common-elements/.claude-plugin/plugin.json` and the plugin README; nothing is typed into the portal except data-handling answers.

Sources read 2026-10-04: https://claude.com/docs/plugins/submit, https://claude.com/docs/plugins/pre-submission-checklist, https://claude.com/docs/plugins/platform-support.

## Checklist (status 2026-10-04)

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
| Repository public on GitHub | **Harry**: not created yet |
| Your GitHub account connected on claude.ai with push access to the repo | **Harry** |

Component support: skills and the remote MCP server load on claude.ai chat, Cowork and Claude Code. The `/common-elements:status` command loads as a skill in chat. There are no hooks, agents or `bin/` files.

## Click-through (Harry)

1. Create the public repo and push this directory (only when you decide to publish):
   ```bash
   cd ~/dev/common-elements-claude-plugins
   gh repo create CommonElements/common-elements-claude-plugins --public --source . --push \
     --description "Claude Code plugins from Common Elements, the information network for community associations"
   ```
2. On https://claude.ai, Settings, connect GitHub if it is not connected.
3. Go to https://claude.ai/directory/manage, **Submit new**, **Plugin bundle**.
4. **Source**: repository `CommonElements/common-elements-claude-plugins`, plugin path `plugins/common-elements`, track branch `main`.
5. **Data handling**:
   - Reads or stores personal data: **Yes, reads**. The plugin itself stores nothing. Its MCP server returns the signed-in user's own Common Elements account data (profile, organizations, RFPs, messages, notifications) within the scopes the user grants. It never returns individuals' personal contact details.
   - Sends data to other services: **Yes**, to Common Elements' own server at commonelements.com, which is the service the plugin connects. No third parties.
   - Retention: governed by https://commonelements.com/privacy. Compliance-scan text is not stored.
   - Intended for people under 18: **No**.
6. **Compliance**: contact email `hello@commonelements.com`; read and tick the four acknowledgments yourself (they bind Common Elements Inc.).
7. **Review and submit**: update trigger **GitHub push webhook**; leave auto-publish **off** for the first version so each release is deliberate.

Submit the connector too ([anthropic-connectors-directory.md](anthropic-connectors-directory.md)): Anthropic asks for the server to be submitted on its own even when a plugin references it.

Limits: 10 submissions per organization per day. Ownership disputes: directory@anthropic.com.
