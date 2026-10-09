# Common Elements for Claude

[Common Elements](https://commonelements.com) is the information network for community associations. This plugin brings it into Claude chat, Cowork and Claude Code: HOA, condo and co-op association records, state statutes with citations, the vendor directory and reviews, the RFP Hub, and the change feed of board and management moves.

The plugin bundles the hosted Common Elements MCP server (`https://commonelements.com/api/mcp`, OAuth 2.1) and adds:

| Skill / command | What it does |
|---|---|
| `research-association` | Resolve an association by name, city or coordinates and brief on its record: management company, board on record, vendors, building safety, hazard risk |
| `find-vendors` | Find and vet contractors from state licensing-board records, check a license, list an association's vendors on record, and read verified Common Elements vendor profiles and reviews where they exist |
| `run-an-rfp` | Draft an RFP, publish it after you approve the preview, and review proposals as they arrive |
| `check-a-statute` | Find and quote the governing statute with its citation, or scan bylaws and rules against a state's statutes |
| `track-association-changes` | Find associations that changed board, president or management company, by state, county and date |
| `/common-elements:status` | Show the signed-in account and active organization |

## Install

In Claude chat or the desktop app, open **Customize > Plugins**, add the marketplace repository `CommonElements/common-elements-claude-plugins`, and install **Common Elements**. Open the plugin's **Connectors** tab and connect Common Elements. Installation and connection apply to the organization you are currently using.

In Claude Code:

```sh
claude plugin marketplace add CommonElements/common-elements-claude-plugins
claude plugin install common-elements@common-elements
```

The command-line installation stays on that machine; it does not install the plugin in your Claude account. Chat loads the status command as a skill; Cowork and Claude Code also support `/common-elements:status`.

## Sign in

In Claude Code, run `/mcp`, choose **plugin:common-elements:common-elements** and sign in with your Common Elements account. The consent screen lets you choose read or write access per area (account, forum, RFPs, messages). You can revoke the connection at any time under **Settings, Connected apps** on commonelements.com.

## Plans

A free account works. Statutes, compliance scans, license checks, vendors, reviews and the RFP Hub work on every plan. Free access to association records returns public-record basics for up to 5 rows. Management, officers, vendors on record, nearby search and the change feed need a Builder Data plan or higher; building safety and hazard risk need Growth or higher. Plans: https://commonelements.com/developers/mcp.

## Data and privacy

- Common Elements never returns personal email, phone or mailing address for an individual (board members, officers, licensees, attorneys) through this server. Officer and board data is names and titles from public records only.
- Vendor reviews do not show reviewer identity.
- Compliance scans analyze only text explicitly supplied for that purpose. Submitted scan text is discarded; the service retains usage metadata, including finding counts. The plugin does not retrieve Claude memory, chat history, conversation summaries or uploaded files.
- The server receives the arguments needed for each requested tool call, not the whole conversation. Account content you ask it to save, such as RFP drafts, is stored in Common Elements. Lookup logs may include search terms or addresses. Usage records and action logs are retained while your account is open; account deletion removes their link to your name or email.
- Skills call only the declared Common Elements connector. The service's infrastructure and analytics providers are disclosed in the privacy policy; tool analytics exclude tool arguments. Interactive maps load Leaflet from unpkg.com and basemap tiles from server.arcgisonline.com; those requests expose normal network information to those providers.
- Account tools act as you and only within what you granted. Anything that publishes, sends or commits (publishing an RFP, sending a message, awarding) shows a preview first and needs your confirmation.
- Privacy policy: https://commonelements.com/privacy. Terms: https://commonelements.com/terms.

Common Elements complements the management and accounting software associations already use; it does not replace it.

## Try it

- "Find SUNSET CHATEAU CONDO ASSN in Pinellas County, Florida and summarize its public record."
- "What does Florida law require for condominium reserves? Find the section and cite it."
- "Draft an RFP for replacing our clubhouse roof. Keep it private and do not publish it."
- "Which Florida condo associations had a management change observed this quarter?"

The nearby map, hazard scorecard and compliance scorecard render interactively on hosts that support MCP Apps. Other hosts receive text and structured results. County-level hazard data is not a property inspection; missing filings do not establish compliance.

## Troubleshooting and permissions

- **Not connected / expired sign-in:** reconnect from the plugin's Connectors tab in chat or Cowork, or `/mcp` in Claude Code.
- **Missing permission:** grant only the area needed for your task. Read access does not include write access. The user must be entitled to the organization and record in Common Elements; reconnecting cannot bypass those permissions.
- **Wrong organization:** ask Claude to show your current Common Elements organization before requesting a change. Changing it is an account write.
- **Plan limit or quota:** the result identifies the restriction. Narrow the request or wait for the stated reset; do not repeatedly retry or represent restricted data as an empty dataset.
- **Empty records:** coverage varies. An empty result means no matching record in this service, not that a vendor, risk or legal obligation does not exist.
- **Publishing or sending:** review the server's preview before approving. An expired confirmation needs a new preview. If a write times out, inspect the saved record before retrying to avoid duplicates.

Support: hello@commonelements.com. Security reporting: https://commonelements.com/.well-known/security.txt.
