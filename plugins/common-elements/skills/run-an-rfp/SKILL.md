---
name: run-an-rfp
description: Draft, publish and track a request for proposals (RFP) on the Common Elements RFP Hub for a community association project such as a roof replacement, painting, landscaping or a reserve study, and review the proposals that come in. Use when the user wants bids from vendors, asks to write or post an RFP, or asks how their open RFPs are doing.
---

# Run an RFP on Common Elements

These are account tools: they act as the signed-in user, and they need the RFP access the user granted when connecting. Drafts are private. Nothing reaches vendors until `publish_rfp` is confirmed.

1. **Confirm who is posting.** Call `get_active_context`. If the active organization is not the association or management company the RFP is for, call `list_my_orgs`, ask which one, and switch with `set_active_context`. An individual with no organization cannot post an RFP; say so.
2. **Pick the category.** Call `list_rfp_categories` (optionally with `query`, for example `roof`). `primary_category_slug` must be one of the returned slugs.
3. **Gather the scope.** Ask only for what is missing: the work and where (buildings, units, common areas), rough quantities, the proposal deadline, requirements (licenses, insurance minimums, site visit), the project city, state and ZIP, visibility (`open`, `blind` or `invitation_only`), and an optional private budget ceiling.
4. **Create the draft.** Call `create_rfp` with `title`, `description` (the scope of work in plain sentences with a numbered list of deliverables), `primary_category_slug`, and any of `visibility`, `response_deadline_at` (ISO 8601 with offset), `budget_ceiling_cents` (bidders never see it), `state`, `city`, `zip`, `posting_org_id`. Show the user the draft. Use `update_rfp` with `rfp_id` for edits.
5. **Publish only on approval.** Call `publish_rfp` with `rfp_id`. The first call returns a preview and a `confirmation_token`; show the preview exactly as returned. Only after the user approves, call `publish_rfp` again with the same `rfp_id` and the token. Publishing notifies matching vendors.
6. **Track it.** `list_my_rfps` lists the user's RFPs; `get_rfp` with `rfp_id` shows one; `list_rfp_proposals` with `rfp_id` lists proposals as they arrive. Summarize price, timeline and anything missing against the scope.
7. **Award or cancel** only when the user says so, with `award_rfp` or `cancel_rfp`. Both are confirm-gated: show the preview, then confirm with the token.

## Notes

- RFP tools are free on every plan. If a tool says RFP write access is missing, ask the user to reconnect Common Elements (`/mcp`) and allow RFP access.
- For vendor suggestions before publishing, use the `find-vendors` skill. For statute-driven work (for example Florida structural integrity reserve studies), use `check-a-statute` to cite the requirement in the scope.
- Keep the RFP factual and specific. No marketing language.
