# Anthropic Claude connectors directory

Submits the remote MCP server (`https://commonelements.com/api/mcp`) as a connector on claude.ai, Claude Desktop, mobile and Cowork. Field values not repeated here are in [README.md](README.md) ("Shared field values").

Sources read 2026-10-04: https://claude.com/docs/connectors/building/submission, https://claude.com/docs/connectors/building/review-criteria, https://claude.com/docs/connectors/building/authentication, https://claude.com/docs/directory/publish. The older Google Form route (`clau.de/mcp-directory-submission`) no longer appears in those docs; the portal replaces it.

## Before you start

- Gates 1 to 5 in [README.md](README.md) are done: security.txt live, privacy section on MCP, account tools on for everyone, reviewer account ready, docs page live.
- A paid claude.ai plan (Pro, Max, Team or Enterprise). On Team or Enterprise, an Owner or a role with Directory permission submits.
- Run every tool once through a custom connector or MCP Inspector (the form asks you to confirm it). A quick path: claude.ai, Settings, Connectors, **Add custom connector**, URL `https://commonelements.com/api/mcp`, sign in as the reviewer account, then try the prompts below.
- Nothing to allowlist: Common Elements accepts any https redirect URI at registration, and Claude registers itself through a client ID metadata document (Common Elements advertises `client_id_metadata_document_supported: true` and `none` client auth) or DCR. Claude's callback is `https://claude.ai/api/mcp/auth_callback`; Claude Code uses a loopback redirect.
- Claude reaches the OAuth endpoints from `160.79.104.0/21`. Vercel's firewall must not challenge that range (check any attack-challenge mode before submitting).

## Click-through (Harry)

1. Go to https://claude.ai/directory/manage and sign in.
2. **Submit new**, then **MCP connector**.
3. **Connection**: server URL `https://commonelements.com/api/mcp`. Leave "Users connect to different URLs" off.
4. **Tools**: the portal syncs the tools (65). Confirm none is flagged for a missing title or annotation; all 65 set a title and all four hints.
5. **Listing**:
   - Server name: `Common Elements`
   - One-liner (up to 200): `Look up HOA, condo and co-op association records, read state statutes with citations, check contractor licenses, run RFPs and follow board and management changes.`
   - Description (up to 2,000): the long description in README.md.
   - Categories (1 to 5): the closest to Real estate, Legal and compliance, Data and research, Business and productivity.
   - Documentation URL: `https://commonelements.com/developers/mcp`
   - Privacy policy URL: `https://commonelements.com/privacy`
   - Support contact: `hello@commonelements.com`
   - Icon: upload `submissions/assets/common-elements-512.png`
   - URL slug: `common-elements` (permanent once published)
6. **Use cases**:
   - Primary use cases: researching a specific association's public record; finding the governing statute and quoting it; checking contractor and manager licenses; drafting and running RFPs for association projects; following board and management changes (paid).
   - What users need before connecting: a Common Elements account (free). Paid Data plans unlock management, officers, change feed, building safety and hazard risk.
   - Reads, writes or both: **Both**. Writes act only within the access the user grants per area on the consent screen; anything that publishes, sends or commits needs a preview and a confirmation token.
7. **Company**: `Common Elements Inc.`, `https://commonelements.com`, primary contact Harry Schoeller at the email you want review updates sent to.
8. **Authentication**: **OAuth with CIMD** (DCR also works). No lazy authentication.
9. **Data handling**: API is **your own** (first-party Common Elements data and the user's own account; not a proxy). Personal health data: **No**. Sponsored content: **No**.
10. **Test and launch**:
    - Reviewer setup instructions (paste):
      > Connect `https://commonelements.com/api/mcp` and sign in with the reviewer credentials below. On the consent screen choose Read and Write for Account, Forum, RFPs and Messages, and tick Association directory. The account belongs to a sample association organization on a Growth Data plan, with one draft RFP and one forum thread. Try the example prompts below. Writes that publish or send return a preview and a confirmation token first. Docs: https://commonelements.com/developers/mcp.
    - Credentials: the reviewer account from gate 4 (password sign-in, no MFA).
    - Tick that every tool was run.
11. **Compliance**: read and tick the seven acknowledgments (directory guidelines, first-party API use, no financial transactions, no AI media generation, prompt-injection, no conversation-data collection, public documentation). Each one commits Common Elements Inc.; read them yourself.
12. **Review and submit**. Status shows in the portal. Escalation: mcp-review@anthropic.com.

## Example prompts (each checked against the live server on 2026-10-04 where marked)

1. "Find SUNSET CHATEAU CONDO ASSN in Pinellas County, Florida and summarize its public record." (`match_association` with `county`, then `get_association`; the record exists, id `9b0e5bea-0166-4410-8796-916e1463a4b4`)
2. "What does Florida law require for condominium reserves? Quote the statute." (`search_statutes` "reserves", FL returned § 718.112(2)(f), then `get_statute_section`)
3. "Look up Florida licensing records for ACME Roofing & Sheet Metal Company and tell me if the license is current." (`search_professionals` returned license ZA623, current, expires 2027-11-30)
4. "Draft an RFP for replacing our clubhouse roof, but do not publish it yet." (`get_active_context`, `list_rfp_categories` returned `roofing`, `create_rfp`)
5. "Which Florida condo associations changed management company this quarter?" (`get_changes_summary`, `search_changes`; needs the Growth reviewer plan)

## Review risks to fix or expect

- Tool descriptions contain workflow hints such as "Call list_rfp_categories first". These describe the API and are allowed; they are not instructions to ignore the user. If a reviewer flags one, reword it as a fact about the parameter.
- `search_vendors` returns nothing today (no verified vendors). It is not in the listing copy, but a reviewer may still call it. Its empty response explains that only verified vendors are listed, which is an actionable message.
- Plan-gated tools on a free account return a message naming the plan and linking pricing. The reviewer account must be on Growth so reviewers see real data.
