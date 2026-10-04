---
description: Check your Common Elements connection, signed-in account and active organization
---

Call the Common Elements MCP tool `whoami` (free on every plan) and report in three short lines: the signed-in name, the active organization (or "none", which is fine for personal use), and how many organizations the user belongs to. Do not print email addresses or phone numbers.

If the tool is not connected or returns an authorization error, tell the user to run `/mcp`, choose **plugin:common-elements:common-elements** and sign in with their Common Elements account. If it says account access is not allowed, tell them to reconnect and grant account access on the consent screen. Data plans and limits are listed at https://commonelements.com/developers/mcp.
