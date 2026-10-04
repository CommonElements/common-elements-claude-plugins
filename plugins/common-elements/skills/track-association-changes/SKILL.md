---
name: track-association-changes
description: Find community associations that recently changed boards, presidents, management companies, self-managed status, registration or license status, using the Common Elements change feed. Use when the user asks which associations changed management or board in an area, wants a list of recent management-company moves, or wants to size the change activity in a state or county.
---

# Track association changes with Common Elements

The change feed records observed changes in public records. It needs a Builder Data plan or higher; the lookback window and row cap grow with the plan.

1. **Size it first.** Call `get_changes_summary` with `state` (an array of two-letter codes, for example `["FL"]`) and optionally `since` (`YYYY-MM-DD`). It returns event and association counts by change kind. Tell the user the counts before pulling rows.
2. **Pull the events.** Call `search_changes` with the filters the user wants:
   - `kind`: any of `board_turnover`, `board_president_changed`, `officer_added`, `officer_removed`, `officer_title_changed`, `management_company_changed`, `management_company_added`, `management_company_removed`, `self_managed_transition`, `entity_status_changed`, `entity_name_changed`, `license_added`, `license_lapsed`
   - `state` (array), `county`, `subtype` (`hoa`, `condo`, `coop`), `since` and `until` (`YYYY-MM-DD`), `min_units` and `max_units`, and `min_magnitude` (0 to 1) to keep only material changes
   - Page with `limit` and `offset`; `since` is clamped to the plan's lookback.
3. **Open the associations that matter**: `get_association` with the association `id`, and `get_association_management` for the current manager after a management change.
4. **Report** grouped by change kind, then by county: association, change, observed date, and source. Say how many rows were returned out of the total, and which filters were applied.
5. **Keep watching.** For associations the user wants to keep an eye on, offer `follow_association` (account write access) so updates reach their Common Elements feed.

## Notes

- Officer changes are counts and titles only, never a person's identity or contact details. Do not try to identify individuals from other sources.
- An observed change is the date Common Elements saw it in a public record, not necessarily the date it took effect. Say "observed".
- If the tool says the plan does not include the change feed, say so and link https://commonelements.com/developers/mcp.
