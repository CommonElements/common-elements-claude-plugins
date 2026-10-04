---
name: check-a-statute
description: Find and quote the US community association statute (HOA, condo or co-op law, by state) that governs a question, with its citation, or check governing-document text (bylaws, declaration, rules) against a state's statutes. Use when the user asks what the law requires, cites a statute section, or wants a bylaw or policy reviewed for conflicts.
---

# Check a statute with Common Elements

Quote what the tools return and cite the section. Never state a requirement you did not retrieve.

1. **Find the section.**
   - For a question ("how much notice for a budget meeting in Florida"), call `search_statutes` with a short `query` and the two-letter `state`. Full-text search is keyword-based: if a phrase returns nothing, retry with one or two core words (for example `reserves` rather than `reserve study requirement`).
   - To browse, call `list_statutes_by_state` with `state` and optionally `chapter` (for example `718`) or `topic` (for example `reserves`).
2. **Read it.** Call `get_statute_section` with the section `id` (the `section_id` from step 1) for the full text and citation.
3. **Answer** with the citation, the operative sentence or two quoted, and a plain-language reading. Say which association type the chapter covers (condominium, HOA, co-op) when it is clear. If the result carries an effective, retrieved or updated date, include it, since statutes change by session.
4. **Review a governing document.** When the user pastes bylaws, a declaration, rules or a policy, call `scan_compliance` with `text`, `state` and optionally `doc_type` (`bylaws`, `declaration`, `rules`). Report each finding with the statute it cites, and mark anything the tool flags as uncertain. The scan is read-only; nothing is stored.

## Notes

- Statute search, section text and compliance scans work on every plan, including free.
- This is reference information, not legal advice. Say so once when the user is deciding something consequential, and suggest the association's attorney for a formal opinion.
- Section summaries are written by Common Elements; quote the statute text itself for anything load-bearing.
