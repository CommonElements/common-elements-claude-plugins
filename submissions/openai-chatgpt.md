# OpenAI ChatGPT plugin directory

As of 2026 OpenAI's Apps SDK docs redirect to https://developers.openai.com/plugins/, and a directory listing is a **plugin**: a ZIP with a manifest, one MCP server and optional skills. Sources read 2026-10-04: https://developers.openai.com/plugins/deploy/submission.md, /plugins/deploy/app-review.md, /plugins/plugin-guidelines.md, /plugins/build/auth.md, /plugins/deploy/submission-errors.md, /plugins/guides/submit-claude-plugin.md.

## Before you start

- Gates 1 to 7 in [README.md](README.md). Two are OpenAI-specific:
  - **Identity verification** of the OpenAI organization (individual or business): platform.openai.com, Settings, Organization, Verification.
  - **Domain verification**: the dashboard gives a token that must be served as plain text at `https://commonelements.com/.well-known/openai-apps-challenge`. No such route exists in the Common Elements app yet. Add it as a one-file route next to `apps/web/app/.well-known/mcp-registry-auth/route.ts` once you have the token, deploy, then click Verify.
- You must be an organization owner, or hold the "Apps Management Write" permission.
- **Redirect URI**: Common Elements advertises `authorization_response_iss_parameter_supported: true`, so ChatGPT uses `https://chatgpt.com/connector_platform_oauth_redirect`. Common Elements accepts any https redirect at registration (`apps/web/app/oauth/_lib/oauth-policy.ts`), so nothing needs allowlisting.
- **Token audience**: OpenAI requires the `resource` value to be bound to the token. Common Elements binds tokens to the resource (migration `20260923140200`). Confirm with one ChatGPT developer-mode connection before submitting.
- **A demo recording** (a URL, for example an unlisted video) of the five positive test cases below, made with the reviewer account.

## The package

Built from `plugins/common-elements/`: `plugin.json` (the OpenAI-format manifest with the `com.openai` interface block), `.mcp.json`, `skills/`, and the logo. Make the ZIP:

```bash
cd ~/dev/common-elements-claude-plugins
mkdir -p dist
(cd plugins/common-elements && zip -r ../../dist/common-elements-openai.zip plugin.json .mcp.json skills assets -x '*.DS_Store')
```

`dist/` is git-ignored.

Check before uploading: `.mcp.json` uses `"type": "http"` (the Claude Code form). If the dashboard rejects it, swap in the contents of `plugins/common-elements/mcp.json` (`"type": "streamable-http"`) as `.mcp.json` inside the ZIP. Do not include `commands/`, `.claude-plugin/` or anything with secrets. OpenAI's converter guide for Claude plugins is https://developers.openai.com/plugins/guides/submit-claude-plugin.md.

Manifest fields already set in `plugins/common-elements/plugin.json` (limits checked):

| Field | Value | Limit |
|---|---|---|
| `name` | `common-elements` | 64, lowercase |
| `displayName` | `Common Elements` | 30 |
| `shortDescription` | `Association records and RFPs` (28) | 30 |
| `longDescription` | 213 characters | 4,000 |
| `developerName` | `Common Elements Inc.` | 80 |
| `category` | `Productivity` (change in the dashboard if a closer one is offered, such as Business) | dashboard list |
| `capabilities` | `Read`, `Write` | 20 entries |
| `defaultPrompt` | 2 prompts, both under 128 characters | 3 |
| `websiteURL`, `privacyPolicyURL`, `termsOfServiceURL` | `/developers/mcp`, `/privacy`, `/terms` | https |
| `brandColor` | `#0A2240` | `#RRGGBB` |

Add in the dashboard if asked: support URL `https://commonelements.com/developers/mcp` or email `hello@commonelements.com`. Logo: `assets/common-elements-512.png` (also inside the ZIP) (square PNG, 512 px; the minimum is 48 px). No screenshots: Common Elements' MCP widgets (map and scorecards) are optional, and example prompts replace screenshots.

## Click-through (Harry)

1. https://platform.openai.com/plugins, **Create**.
2. Upload `dist/common-elements-openai.zip`. Fix anything the validator flags (see https://developers.openai.com/plugins/deploy/submission-errors.md).
3. **MCPs** section: pick `common-elements`, **Connect**. Complete the domain challenge (route above), then sign in through OAuth as the reviewer account and grant Read and Write for every area plus Association directory.
4. **Scan Tools**. It imports names, descriptions, schemas, annotations and `_meta` for all 65 tools. Every tool sets `readOnlyHint`, `destructiveHint` and `openWorldHint` explicitly. If the form wants a justification per annotation, use the bundle table in the Common Elements repo's `docs/MCP_MARKETPLACE_SUBMISSION.md` and the corrected lists in [README.md](README.md).
5. **Review information**:
   - Five positive test cases:

     | # | Prompt | Tools triggered | Expected behavior |
     |---|---|---|---|
     | 1 | Find SUNSET CHATEAU CONDO ASSN in Pinellas County, Florida and summarize its public record. | `match_association`, `get_association` | Names the Pinellas association, condo, registration active since 1974, with its source |
     | 2 | What does Florida law require for condominium reserves? Quote the statute. | `search_statutes`, `get_statute_section` | Cites § 718.112(2)(f) and quotes the operative text; notes it is not legal advice |
     | 3 | Look up Florida licensing records for ACME Roofing & Sheet Metal Company. Is the license current? | `search_professionals` (or `verify_license`) | Returns license ZA623, status current, expiry 2027-11-30, not expired |
     | 4 | Draft an RFP for replacing our clubhouse roof, but do not publish it. | `get_active_context`, `list_rfp_categories`, `create_rfp` | Creates a private draft under `roofing` and shows it; does not call `publish_rfp` |
     | 5 | Which Florida condo associations changed management company this quarter? | `get_changes_summary`, `search_changes` | Gives counts, then a list grouped by county with observed dates and sources |

   - Three negative test cases (the plugin should not be used):

     | # | Prompt | Expected |
     |---|---|---|
     | 1 | What is the weather in Miami tomorrow? | No Common Elements tool is called |
     | 2 | Translate "the meeting is postponed" into Spanish. | No Common Elements tool is called |
     | 3 | Write a birthday message for my neighbor. | No Common Elements tool is called |

   - Demo recording URL.
   - Reviewer credentials in the separate secure form (password sign-in, no MFA, email codes or magic links).
   - Commerce declaration: **no** in-chat purchases (paid plans are bought on commonelements.com).
6. Read and accept the policy attestations yourself (they bind Common Elements Inc.). Audience: general, suitable for 13 to 17. Countries: leave unrestricted unless you want US only (`publication.countries`).
7. **Submit**. Feedback arrives by email. Tool changes on the live server are rescanned daily; changing the MCP URL later needs OpenAI support.

## Copy rules for this listing

OpenAI rejects "unofficial connector" or pass-through framing. Common Elements is first-party: it operates the server and the data. Use the long description from README.md. Do not mention vendor search (empty today) or call Common Elements management software.
