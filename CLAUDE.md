# Skill routing

Before starting a task, check the skill list and invoke the best match first. Where skills overlap, use these:

| Task | Use |
|---|---|
| Any coding | `ponytail` (always on via its hook). `lean-build` only for new feature slices |
| Bug, cause unknown | `investigate-first` → then `surgical-patch` for the fix |
| Refactor, behaviour must not change | `safe-refactor` |
| Schema / API / dependency migration | `migration` |
| "Is it done?", run the checks, prove it works | `verify-and-stop` |
| Review a diff for bugs | `code-review` |
| Review for over-engineering | `ponytail:ponytail-review` (diff) or `ponytail:ponytail-audit` (whole repo) |
| Tests first | `mattpocock-skills:tdd` |
| Read a web page, especially if WebFetch is blocked or the page is JS-heavy | `firecrawl-scrape` |
| Quick web lookup | WebSearch first; `firecrawl-search` when page content is needed |
| Research papers | `firecrawl-research-papers` |
| Make my writing (SOP, LinkedIn, emails) sound less AI | `no-ai-slop` |
| Find a skill that isn't installed | `find-skills` |

- `caveman` only when I say "caveman" or "be brief".
- Caveman Cloud skills (`caveman-setup`, `-discover`, `-manage`, `-optimize`, `-evidence-review`, `-learn`) only if I mention Caveman Cloud.
- Study and course notes go in Obsidian (`~/Documents/life`), not artifacts.
