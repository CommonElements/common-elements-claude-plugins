---
name: find-vendors
description: Find and vet contractors and service providers for a community association (roofing, painting, engineering, pool service and more) with Common Elements, using state licensing-board records, license checks, an association's vendors on record, and verified Common Elements vendor profiles and reviews. Use when the user asks for contractors for an HOA or condo, wants to vet a vendor or check a license, or asks which vendors an association already uses.
---

# Find and vet vendors with Common Elements

Report only what the tools return. An empty result means "none on file in Common Elements", never "none exist".

1. **Verified Common Elements vendors.** Call `search_vendors` with `category` (a slug such as `roofing`, `painting`, `landscaping`, `pool-service`, `plumbing`, `electrical`, `hvac`, `engineering`), `state`, and optionally `query`. This lists only vendors that have completed verification on Common Elements, so it is often empty; if it is, say so in one line and move on. For any results, call `get_vendor` (profile, vendor-reported certifications and insurance, verified-credentials profile from public records) and `get_vendor_reviews` (reviews tied to completed RFPs, rating 1 to 5, reviewer identity not shown).
2. **Licensed firms from state licensing boards.** Call `search_professionals` with `state` and any of `query` (firm or trade word, for example `roofing`), `license_type`, `board` (for example `FL DBPR CILB` for Florida construction licenses) and `status`. Results carry license number, status, expiry and `is_expired`. Call `get_professional` with the `id` for the full record. Drop rows that are course providers or otherwise not contractors, and say you did.
3. **Check a specific vendor's license** the user names: `verify_license` with `state` and `license_number` or `name` (plus `license_type` if known). A "current" status can still be past its expiry date; report `is_expired`.
4. **Vendors an association already uses.** If the user names an association, resolve it with the `research-association` skill and call `list_association_vendors` with its `id` (Builder Data plan or higher).
5. **Summarize** in a short table: name, location, license and status (with expiry), source (verified Common Elements profile, licensing board, or on record for the association), and rating where one exists. Mark vendor-reported facts as such.
6. **Next step.** To get bids, hand off to the `run-an-rfp` skill; publishing an RFP notifies matching vendors. Do not contact vendors yourself.

## Notes

- `search_vendors`, `get_vendor`, `get_vendor_reviews`, `search_professionals`, `get_professional` and `verify_license` work on every plan, including free (free pages are smaller).
- No private contact data is returned for individuals. Do not add contact details from other sources.
- Do not rank or recommend on anything the tools did not return, and do not describe a vendor as endorsed by Common Elements.
