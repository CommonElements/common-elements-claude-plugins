# Changelog

All notable changes to the Common Elements plugin. Versions follow semantic versioning; the version lives in `.claude-plugin/plugin.json` and the Codex/OpenAI `plugin.json` beside it.

## 1.1.2 (2026-11-20)

Directory review fixes. No change to the MCP server URL, tools or permissions.

- `check-a-statute` quotes statute text and cites it, keeps any explanation within the quoted words, and no longer gives a plain-language reading that could add requirements. It tells the user in every answer that this is reference information, not legal advice, and that the association's attorney should confirm how it applies. Compliance-scan findings are reported as automated pointers to sections worth reading, never as a compliance determination. The note about Common Elements-written section summaries is removed (those summaries were withdrawn).
- `run-an-rfp` quotes and cites a statute in an RFP scope and leaves its application to the association and its attorney.
- The README states the statute and compliance limits in their own section and lists the support page and security contact.
- `supportUrl` points to https://commonelements.com/contact, which lists the support and security addresses.
- Removed `assets/common-elements-512.png` from the plugin folder. Nothing in the plugin read it, and the directory flagged it as an unread asset. The directory and OpenAI submission copies stay in `submissions/assets/`.

## 1.1.1 (2026-10-09)

- Accurate data-handling disclosures in the README: what the server receives, what is stored and retained, MCP App network requests, and revocation.
- Skills: data boundaries (no memory, chat history or uploaded files), connector-failure handling, explicit consent before a compliance scan.
- `/common-elements:status` reports the connection organization separately from the website's active organization.
- Bundled disconnected evaluation cases for ambiguity, draft-only RFPs, uploaded-file boundaries, an unavailable connector and observed versus effective change dates.

## 1.1.0 (2026-10-04)

- First public release: the hosted Common Elements MCP server (`https://commonelements.com/api/mcp`, OAuth) plus the `research-association`, `find-vendors`, `run-an-rfp`, `check-a-statute` and `track-association-changes` skills and the status command.
