# Claude directory verification, October 9, 2026

Candidate: Common Elements plugin 1.1.1. This is a verification record, not a claim that the directory has approved or published it.

## Official requirements read

- https://claude.com/docs/plugins/pre-submission-checklist
- https://claude.com/docs/plugins/platform-support
- https://claude.com/docs/connectors/building/review-criteria
- https://claude.com/docs/connectors/building/authentication
- https://support.claude.com/en/articles/13145358-anthropic-software-directory-policy

## Verified

- Claude Code 2.1.295: marketplace and strict plugin validation pass.
- Isolated local install: version 1.1.1 loads five workflow skills, the status command and one remote MCP connector. No hooks, agents, local executables or credential headers.
- Live protected-resource metadata names https://commonelements.com/api/mcp exactly. Live authorization metadata advertises CIMD, public-client authentication, PKCE S256, authorization-code and refresh-token grants, and offline_access.
- Live security.txt provides security@commonelements.com and an unexpired expiry.
- Companion server patch: 190 tests across 17 files passed, covering tool contracts, scopes, confirmation safety, OAuth, output formatting, widget metadata and compliance routing. Three additional real local-database suites passed 29 tests for connected-app permissions and OAuth refresh.
- The scan input schema now matches the backing API. Document type selects the applicable rule set instead of always using declaration rules. Submitted scan text is excluded from usage logs.

- Companion server pull request: https://github.com/CommonElements/common-elements/pull/936. Its first Vercel previews passed for web, admin, data and academy. Dependency changes after that preview require a new build and acceptance.
- Plugin pull request: https://github.com/CommonElements/common-elements-claude-plugins/pull/1. Both GitHub validation runs passed. The PR remains open; merging is awaiting approval while live acceptance is incomplete.
- Candidate SDK upgraded to 1.31.0, with critical transitive dependency patches. The final local dependency audit reports zero critical, two high, 17 moderate and two low findings. The remaining high findings are node-forge through extension development tooling and braces through the ESLint toolchain; neither has a published patch. They are not claimed resolved. Patched Sharp and Metro successfully decoded all four mobile PNG assets, and Sharp resized each image. The SDK OAuth-client advisory explicitly excludes MCP servers, and no production SDK OAuth-client usage was found here.

- Harry reported submitting the plugin listing on October 9. This does not establish approval or publication. The submitted repository default branch was still version 1.1.0; candidate 1.1.1 remains on PR #1.
- The approved GitHub webhook is active for push events only, using JSON, a signing secret and verified TLS. Anthropic accepted the automatic GitHub ping with HTTP 200 at 2026-10-09T19:01:59Z. No secret is stored in this repository.

## Not yet verified or released

- Server patch deployment and post-deployment acceptance.
- Every tool successfully exercised through BOTH MCP Inspector and a Claude custom connector using populated sample accounts.
- Full OAuth connect/refresh/revoke and account isolation in the live Claude host.
- Plugin load and workflow tests in chat and Cowork, including MCP Apps rendering and screenshots.
- With/without evaluation: attempted five synthetic disconnected scenarios, one run per arm. All ten runs were blocked by the account's weekly usage limit before producing responses. This is unavailable evidence, not a plugin score. No evaluation report was published.

The bundled evaluation cases test ambiguity, draft-only requests, uploaded-file boundaries, unavailable connectors and observed versus effective change dates. They intentionally do not start real MCP servers and must not be represented as successful live-tool coverage.

Do not attest completion of the remaining gates or submit the standalone connector until current evidence supports those statements. Re-validate the final merged plugin commit in the existing submission; keep auto-publish off.
