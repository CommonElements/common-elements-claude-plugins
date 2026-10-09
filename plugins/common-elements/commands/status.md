---
description: Check your Common Elements connection, signed-in account and active organization
---

Call the Common Elements MCP tool `whoami` (free on every plan) and report the signed-in name, the connection organization, and how many organizations the user belongs to. Resolve `connection_org_id` against the returned memberships. If it is null, say "personal connection"; if the field is absent on an older server, say "connection organization unavailable" rather than inferring it from `active_org_id`. That older field is the website preference and can differ from the connector posting identity. Do not print email addresses or phone numbers.

If the tool is not connected or returns an authorization error, tell the user to connect Common Elements from the plugin’s Connectors tab in chat or Cowork; in Claude Code, run `/mcp` and choose **plugin:common-elements:common-elements**. If it says account access is not allowed, tell them to reconnect and grant Account read access on the consent screen. Do not request write access for this status check. Data plans and limits are listed at https://commonelements.com/developers/mcp.
