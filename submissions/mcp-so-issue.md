**Name:** Common Elements
**Type:** Remote MCP server (Streamable HTTP)
**Remote URL:** https://commonelements.com/api/mcp
**Docs:** https://commonelements.com/developers/mcp
**Website:** https://commonelements.com

**What it does:** Common Elements is the information network for community associations. Look up HOA, condo and co-op associations by name, city or location and read their public record (type, location, units, registration status). Paid Data plans add the management company on record with every public-record source that names one, the board and officers on public record (names and titles only), vendors on record, building-safety filings such as Florida SIRS and milestone recertifications, county-level FEMA hazard risk, and a change feed of board, president and management-company changes. Also: full-text search of US community association statutes with citations, a read-only check of bylaws or rules against a state's statutes, state licensing-board records and license verification for managers, contractors and engineers, and the signed-in user's RFPs, forum threads and messages. Personal contact details for individuals are never returned. Writes that publish or send need a preview and a confirmation token.

**Tools (65):** association and data tools `match_association`, `search_associations`, `get_association`, `find_associations_near`, `get_association_officers`, `get_association_management`, `get_association_risk`, `get_association_building_safety`, `list_association_vendors`, `list_manager_associations`, `verify_license`, `search_professionals`, `get_professional`, `scan_compliance`, `search_statutes`, `get_statute_section`, `list_statutes_by_state`, `search_vendors`, `get_vendor`, `get_vendor_reviews`, `get_state_summary`, `search_changes`, `get_changes_summary`, plus `search` and `fetch`; account tools for RFPs (`create_rfp`, `publish_rfp`, `list_rfp_proposals` and more), the forum, messages, notifications, profile and organization relationships (40 in all).

**Authentication:** OAuth 2.1 (authorization code with PKCE, dynamic client registration and client ID metadata documents; RFC 9728 metadata at https://commonelements.com/.well-known/oauth-protected-resource), or a Common Elements API key as a Bearer token. A free account works; paid Data plans unlock the deeper association data.

**Config:**
```json
{"mcpServers":{"common-elements":{"type":"http","url":"https://commonelements.com/api/mcp"}}}
```

**Claude Code plugin:** https://github.com/CommonElements/common-elements-claude-plugins

**Official MCP Registry:** `com.commonelements/data`

**Logo:** https://commonelements.com/logos/icon-mark-rounded.svg
