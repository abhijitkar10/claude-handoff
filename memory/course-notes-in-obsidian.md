---
name: course-notes-in-obsidian
description: "Course/study material goes into the Obsidian vault at ~/Documents/life/Academics, not into artifacts — written at beginner-teaching level"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: e173b281-6b9a-4c5f-878a-17bda1b23c5e
  modified: 2026-09-09T05:18:37.976Z
---

For any academic subject he is studying, write notes as a Markdown file in his Obsidian vault at `~/Documents/life/Academics/`, not as a published Artifact.

**Why:** He redirected me on 2026-09-09 — I had built a polished HTML artifact for his IoT exam material and he replied "Reading this for first time so just maintain a file in obsidian." His study workflow lives in Obsidian, where wiki-links connect subjects and he can edit and revisit notes. An artifact is a dead end for that.

**How to apply:**
- Vault layout: `~/Documents/life/Academics/<Subject>.md` as a hub, with `~/Documents/life/Academics/<Subject>/` holding per-lecture notes when a subject grows large. Other vaults exist (`~/job`, `~/Documents/Abhijit`) — academics always goes in `life`.
- House style, matching the Graph Theory notes: YAML frontmatter (`tags: [academics, <subject>, ...]`, `date`), `[[wiki-links]]` to related notes, teaching prose rather than bullet dumps.
- **Write at beginner level.** His Graph Theory hub states it explicitly: go slowly, one step at a time; use concrete tiny examples with real numbers, not abstract symbols; define every symbol before using it; explain *why* each step is allowed; never skip steps. This applies to every subject, not just graph theory — especially when he says he is reading something for the first time.
- Anticipate the confusions: when two terms sit close together (sensitivity vs resolution, centralized vs distributed), give them a table and say plainly which is which.

Related: [[defensible-projects-only]]
