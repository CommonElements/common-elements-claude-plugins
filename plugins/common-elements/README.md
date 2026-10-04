# Common Elements for Claude Code

[Common Elements](https://commonelements.com) is the information network for community associations. This plugin brings it into Claude Code: HOA, condo and co-op association records, state statutes with citations, the vendor directory and reviews, the RFP Hub, and the change feed of board and management moves.

The plugin bundles the hosted Common Elements MCP server (`https://commonelements.com/api/mcp`, OAuth 2.1) and adds:

| Skill / command | What it does |
|---|---|
| `research-association` | Resolve an association by name, city or coordinates and brief on its record: management company, board on record, vendors, building safety, hazard risk |
| `find-vendors` | Find and vet contractors from state licensing-board records, check a license, list an association's vendors on record, and read verified Common Elements vendor profiles and reviews where they exist |
| `run-an-rfp` | Draft an RFP, publish it after you approve the preview, and review proposals as they arrive |
| `check-a-statute` | Find and quote the governing statute with its citation, or scan bylaws and rules against a state's statutes |
| `track-association-changes` | Find associations that changed board, president or management company, by state, county and date |
| `/common-elements:status` | Show the signed-in account and active organization |

## Sign in

On first use, run `/mcp`, choose **plugin:common-elements:common-elements** and sign in with your Common Elements account. The consent screen lets you choose read or write access per area (account, forum, RFPs, messages). You can revoke the connection at any time under **Settings, Connected apps** on commonelements.com.

## Plans

A free account works. Statutes, compliance scans, license checks, vendors, reviews and the RFP Hub work on every plan. Free access to association records returns public-record basics for up to 5 rows. Management, officers, vendors on record, nearby search and the change feed need a Builder Data plan or higher; building safety and hazard risk need Growth or higher. Plans: https://commonelements.com/developers/mcp.

## Data and privacy

- Common Elements never returns personal email, phone or mailing address for an individual (board members, officers, licensees, attorneys) through this server or any other product surface. Officer and board data is names and titles from public records only.
- Vendor reviews do not show reviewer identity.
- Compliance scans are read-only; the text you send is not stored.
- Account tools act as you and only within what you granted. Anything that publishes, sends or commits (publishing an RFP, sending a message, awarding) shows a preview first and needs your confirmation.
- Privacy policy: https://commonelements.com/privacy. Terms: https://commonelements.com/terms.

Common Elements complements the management and accounting software associations already use; it does not replace it.
