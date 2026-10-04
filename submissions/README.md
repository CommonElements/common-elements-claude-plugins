# Directory submission packets

Prepared 2026-10-04. **Nothing here has been submitted.** Every submission is public and most accept terms on behalf of Common Elements Inc., so Harry does each one himself. Each file gives the exact field values and the click path.

| Directory | File | How | Can go before the gates below? |
|---|---|---|---|
| Official MCP Registry | [`../registry/README.md`](../registry/README.md) | `mcp-publisher` after a DNS TXT | Yes (already listed at 1.0.0; this is the 1.1.0 update) |
| mcp.so | [`mcp-so.md`](mcp-so.md) | GitHub issue, or the mcp.so/submit form | Yes |
| PulseMCP | [`pulsemcp.md`](pulsemcp.md) | Ingests the registry; its form is paused | Nothing to submit |
| Smithery | [`smithery.md`](smithery.md) | Web form with sign-in | Yes |
| Anthropic connectors directory | [`anthropic-connectors-directory.md`](anthropic-connectors-directory.md) | claude.ai/directory/manage | After gates 1 to 5 |
| Anthropic plugin directory | [`anthropic-plugin-directory.md`](anthropic-plugin-directory.md) | claude.ai/directory/manage | After the repo is public and gates 1 to 3 |
| OpenAI ChatGPT plugin directory | [`openai-chatgpt.md`](openai-chatgpt.md) | platform.openai.com/plugins | After gates 1 to 7 |

## Gates: what Common Elements must have first

Each was checked on 2026-10-04 against the live site or the code (`apps/web` in the Common Elements repo).

1. **`/.well-known/security.txt`** with a security contact. Live check: **404**. Required by the portfolio playbook before the Anthropic directories.
2. **An MCP and connected-apps section in the privacy policy.** https://commonelements.com/privacy (updated October 2026, no draft banner) does not mention the MCP server, AI assistants or connected apps except in the footer link. Add a section covering: what the server returns, that OAuth issues an API key bound to the user, what is logged per tool call (the `mcp_tool_called` event), that compliance-scan text is not stored, retention, and revocation under Settings, Connected apps. Terms (updated August 2026) have no draft banner either.
3. **Account tools on for every user.** Account tools (RFPs, forum, messages, profile) are gated by the PostHog flag `mcp_account_access_enabled`, which fails closed (`apps/web/app/api/[transport]/_lib/account-auth.ts:155`). On 2026-10-04 `list_rfp_categories` answered for Harry's own connection, which proves the flag is on for him, not for everyone. Confirm the flag's release condition is everyone before any listing that mentions RFPs.
4. **A reviewer account**, no MFA, email codes or magic links, password sign-in. Give it an active association organization with a draft RFP, a forum thread, and a Data plan of **Growth** (so building safety and hazard risk work; Builder covers the rest). Store the credentials in a password manager, never in this repo.
5. **Public documentation** of the connector. https://commonelements.com/developers/mcp exists (200). Before Anthropic review, add the plugin install commands by setting `AI_PLUGINS_REPO` in `apps/web/lib/mcp/install-links.ts` to `"CommonElements/common-elements-claude-plugins"` once the repo is public.
6. **OpenAI domain verification route** at `/.well-known/openai-apps-challenge` that returns the dashboard's token as plain text. It does not exist in the code (`apps/web/app/.well-known/` holds only `mcp-registry-auth`). The token comes from the OpenAI dashboard, so this is a small CE PR made during submission.
7. **OpenAI identity verification** (individual or business) for the OpenAI organization that submits.

Not blocking, but worth fixing:

- **Vendor search is empty.** `search_vendors` lists only verified vendors, and none are verified. The route's own note (`apps/web/app/api/v1/vendors/route.ts:16`) says 0 of 567 vendor organizations qualify. A call with no filters returned 0 rows on 2026-10-04. The copy below therefore does **not** advertise a vendor directory, and the `find-vendors` skill leads with licensing-board records. Verify real vendors, then vendor search can go back into the copy.
- **`match_association` ranking.** "Sunset Chateau Condominium", FL returned "LA CHATEAU, A CONDOMINIUM" (similarity 0.613) above the exact "SUNSET CHATEAU CONDO ASSN" (0.594). Reviewers try the obvious prompt, so avoid that one in test cases, or fix the ranking.
- **Statute search is keyword-based.** "reserve study" in FL returned 0 rows; "reserves" returned § 718.112(2)(f). Test prompts below use wording that hits.
- **No OAuth revocation endpoint** in the authorization-server metadata (`/oauth/` has authorize, register, token, metadata). Revocation works through Settings, Connected apps. The playbook asks for RFC 7009; not required by either directory.
- **Registry name drift** in the CE repo (`com.commonelements/mcp` vs the live `com.commonelements/data`), covered in `../registry/README.md`.

## Shared field values

Use these exactly. No claims beyond what the server does today. Never describe Common Elements as management or accounting software, or as a replacement for it.

| Field | Value |
|---|---|
| Name | Common Elements |
| Company | Common Elements Inc. |
| Website | https://commonelements.com |
| MCP server URL | `https://commonelements.com/api/mcp` (Streamable HTTP) |
| Documentation | https://commonelements.com/developers/mcp |
| Privacy policy | https://commonelements.com/privacy |
| Terms | https://commonelements.com/terms |
| Support contact | hello@commonelements.com |
| Logo | `assets/common-elements-512.png` (512 x 512 PNG, rasterized from the brand file `apps/web/public/logos/icon-mark-rounded.svg`), or https://commonelements.com/logos/icon-mark-rounded.svg where an SVG URL is accepted |
| Brand color | `#0A2240` |
| Registry id | `com.commonelements/data` |
| Auth | OAuth 2.1: authorization code with PKCE S256, dynamic client registration and client ID metadata documents, public clients, refresh tokens, RFC 9728 metadata at https://commonelements.com/.well-known/oauth-protected-resource. A Common Elements API key also works as a Bearer token. Unauthenticated calls get 401 with `WWW-Authenticate: Bearer ... resource_metadata=...` (verified 2026-10-04). |
| Scopes | Data: `associations`, `risk`, `compliance`, `statutes`, `licenses`, `vendors.read`, `vendors`, `professionals`. Account (chosen as none, read or write per area on the consent screen): `account:read/write`, `forum:read/write`, `rfp:read/write`, `messages:read/write`, `connections:write`. Plus `offline_access`. |
| Price | Free account works. Paid Data plans (Builder, Growth, Scale, Enterprise) unlock management, officers, change feed, building safety and hazard risk. |

**Tagline (up to 55 characters, 53):** Community association records, statutes and RFP tools

**Short description (up to 200 characters, 162):** Look up HOA, condo and co-op association records, read state statutes with citations, check contractor licenses, run RFPs and follow board and management changes.

**Subtitle (up to 30 characters, 28):** Association records and RFPs

**Long description (1,728 characters; limit 2,000):**

> Common Elements is the information network for community associations. This connector brings its records and tools into your assistant.
>
> Association records: find an HOA, condo or co-op association by name, city or location and read its public record, including type, location, units and registration status. Paid Data plans add the management company on record and every public-record source that names one, the board and officers on public record (names and titles only), vendors on record, building-safety filings such as Florida SIRS and milestone recertifications, and county-level FEMA hazard risk.
>
> Statutes: full-text search of US community association statutes with citations, the text of any section, and a read-only check of bylaws, declarations or rules against a state's statutes. Reference information, not legal advice.
>
> Licenses: search state licensing-board records for community association managers, contractors and engineers, and verify a license, including whether a current license is past its expiry date.
>
> RFPs: draft a request for proposals for your association, publish it after you approve a preview, and review the proposals that come in.
>
> Change feed (paid): associations whose board, president or management company changed, by state, county, type and date.
>
> Your account: forum threads, messages and notifications, limited to the read or write access you grant at sign-in.
>
> Personal contact details for individuals, such as board members, officers and licensees, are never returned. Anything that publishes, sends or commits shows a preview first and needs your confirmation. Common Elements complements the management and accounting software associations already use.

**Categories (pick the closest the form offers, up to 5):** Real estate; Legal and compliance; Data and research; Business and productivity.

## Tool list (65, verified in code and against the live connector, 2026-10-04)

Registered through `apps/web/app/api/[transport]/_lib/register-tools.ts` (15), `_lib/data-tools.ts` (10), `_lib/account-read-tools.ts` (17) and `_lib/account-write-tools.ts` (23). The live claude.ai connector lists the same 65 names. Every tool sets all four annotation hints explicitly (`_lib/tool-meta.ts`).

- **Connector pair, read-only (2):** `search`, `fetch`
- **Data, read-only, `openWorldHint: true` (23):** `match_association`, `search_associations`, `get_association`, `find_associations_near`, `get_association_officers`, `get_association_management`, `get_association_risk`, `get_association_building_safety`, `list_association_vendors`, `list_manager_associations`, `verify_license`, `search_professionals`, `get_professional`, `scan_compliance`, `search_statutes`, `get_statute_section`, `list_statutes_by_state`, `search_vendors`, `get_vendor`, `get_vendor_reviews`, `get_state_summary`, `search_changes`, `get_changes_summary`
- **Account, read-only, `openWorldHint: false` (17):** `whoami`, `list_my_orgs`, `get_active_context`, `get_my_profile`, `get_notification_prefs`, `list_notifications`, `list_relationships`, `list_relationship_invitations`, `list_forum_threads`, `get_forum_thread`, `list_rfp_categories`, `list_my_rfps`, `get_rfp`, `list_rfp_proposals`, `list_my_proposals`, `list_conversations`, `get_conversation`
- **Account, write, not destructive (12):** `set_active_context`, `follow_association`, `unfollow_association`, `update_notification_prefs`, `mark_notification_read`, `mark_all_notifications_read`, `create_rfp` (private draft), `update_rfp`, `create_proposal_draft`, `update_proposal`, `start_conversation`, `decline_relationship_invitation`
- **Account, write, `destructiveHint: true` and confirm-gated (11):** `publish_rfp`, `award_rfp`, `cancel_rfp`, `submit_proposal`, `withdraw_proposal`, `send_message`, `create_forum_thread`, `reply_to_forum_thread`, `invite_relationship`, `accept_relationship_invitation`, `update_my_profile`. The first call returns a preview and a `confirmation_token`; only a second call with the token acts.

Annotation justifications per bundle are in the Common Elements repo at `docs/MCP_MARKETPLACE_SUBMISSION.md` ("Annotation justifications"). That section predates the RFP draft tools and the follow tools, and calls `decline_relationship_invitation` confirm-gated; the code no longer gates it. Use the lists above.

## Record

After each submission, add a row (directory, date, link, status) to this table, then copy the table to the Common Elements repo's distribution doc.

| Directory | Date | Link | Status |
|---|---|---|---|
| Official MCP Registry | 2026-08-03 | https://registry.modelcontextprotocol.io/v0/servers?search=com.commonelements | `com.commonelements/data` 1.0.0 active; 1.1.0 prepared |
