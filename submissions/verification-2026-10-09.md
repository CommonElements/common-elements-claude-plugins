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
- Companion server patch: 189 tests across 16 files passed, covering tool contracts, scopes, confirmation safety, OAuth, output formatting, widget metadata and compliance routing. Three additional real local-database suites passed 29 tests for connected-app permissions and OAuth refresh.
- The scan input schema now matches the backing API. Document type selects the applicable rule set instead of always using declaration rules. Submitted scan text is excluded from usage logs.

## Not yet verified or released

- Server patch deployment and post-deployment acceptance.
- Every tool successfully exercised through BOTH MCP Inspector and a Claude custom connector using populated sample accounts.
- Full OAuth connect/refresh/revoke and account isolation in the live Claude host.
- Plugin load and workflow tests in chat and Cowork, including MCP Apps rendering and screenshots.
- With/without evaluation: attempted five synthetic disconnected scenarios, one run per arm. All ten runs were blocked by the account's weekly usage limit before producing responses. This is unavailable evidence, not a plugin score. No evaluation report was published.

The bundled evaluation cases test ambiguity, draft-only requests, uploaded-file boundaries, unavailable connectors and observed versus effective change dates. They intentionally do not start real MCP servers and must not be represented as successful live-tool coverage.

Do not attest completion of the remaining gates or submit the standalone connector until current evidence supports those statements. Re-validate the final merged plugin commit in the saved portal draft; keep auto-publish off.
