# Common Elements plugins for Claude Code

A Claude Code plugin marketplace from [Common Elements](https://commonelements.com), the information network for community associations.

| Plugin | What it adds |
|---|---|
| [`common-elements`](plugins/common-elements) | The hosted Common Elements MCP server plus skills to research an association, find vendors, run an RFP, check a statute and track board and management changes |

## Install

In your shell:

```bash
claude plugin marketplace add CommonElements/common-elements-claude-plugins
claude plugin install common-elements@common-elements
```

Or inside Claude Code:

```
/plugin marketplace add CommonElements/common-elements-claude-plugins
/plugin install common-elements@common-elements
```

Then run `/mcp`, choose **plugin:common-elements:common-elements** and sign in with your Common Elements account (OAuth). To receive new versions automatically, open `/plugin`, then **Marketplaces**, then `common-elements`, and turn on auto-update. Otherwise run `claude plugin update common-elements@common-elements`.

Prefer the server without the skills? `claude mcp add --transport http common-elements https://commonelements.com/api/mcp`. Every other client (Claude on the web and desktop, ChatGPT, Cursor, VS Code, Codex) is covered at https://commonelements.com/developers/mcp.

Codex reads the same repository: `codex plugin marketplace add CommonElements/common-elements-claude-plugins`.

## What it does, honestly

- **Association records**: HOA, condo and co-op associations from state registries and other public records. Free access returns public-record basics; deeper sections (management, officers, change feed, building safety, hazard risk) need a paid Data plan. Coverage varies by state and county, and every response says where its data came from.
- **Statutes**: full-text search and section text for US community association statutes, plus a read-only compliance scan of governing-document text. Reference information, not legal advice.
- **Vendors and RFPs**: contractors and other licensed firms from state licensing-board records, license checks, and the RFP Hub for posting work and reviewing proposals (drafts are private; publishing needs your confirmation). The searchable list of verified Common Elements vendor profiles is small and growing; it only includes vendors that have completed verification.
- Common Elements complements the management and accounting software associations already use. It is not management or accounting software.

## Data and privacy

Personal contact details (email, phone, mailing address) for individuals, such as board members, officers and licensees, are never returned by the MCP server or shown on any Common Elements product surface. Board and officer data is names and titles from public records. Privacy policy: https://commonelements.com/privacy. Questions: hello@commonelements.com.

## Releasing (maintainers)

1. Change the plugin under `plugins/common-elements/`. Skills must use tool names that exist on the live server (`apps/web/app/api/[transport]/_lib/` in the Common Elements app); rename a tool there and update the skills in the same release.
2. Bump `version` in `plugins/common-elements/.claude-plugin/plugin.json` (and the Codex `plugin.json` beside it). The version lives only in the plugin manifests, never in `marketplace.json`. Users stay on the old copy until it changes.
3. `claude plugin validate .` and `claude plugin validate --strict plugins/common-elements` must pass. CI runs both.
4. Install from your local checkout in an isolated config and confirm the skills and the MCP server load:
   ```bash
   export CLAUDE_CONFIG_DIR=$(mktemp -d)
   claude plugin marketplace add ./
   claude plugin install common-elements@common-elements
   claude plugin details common-elements@common-elements
   ```
5. Open a PR and merge it. Optionally run `claude plugin tag --push` from the plugin directory.

Never rename a published plugin. If a rename is unavoidable, add the old name to `renames` in `marketplace.json` (`{"old-name": "new-name"}`). The map is append-only: never remove an entry, or users of the old name lose the plugin.

## License

MIT for the files in this repository. Common Elements itself is covered by its [terms](https://commonelements.com/terms).
