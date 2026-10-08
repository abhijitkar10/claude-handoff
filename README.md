# claude-handoff

Moves my Claude Code setup and every project to a new machine. **Private** —
`memory/` holds personal goals and plans.

## On the new machine

```bash
gh auth login
```

```bash
git clone https://github.com/abhijitkar10/claude-handoff.git && cd claude-handoff && ./restore.sh
```

That installs `CLAUDE.md`, `settings.json`, the 50 skills and the memory into
`~/.claude`, then clones every repo into the same layout as the Mac, so paths in
memory stay valid. Anything already present is backed up or skipped, never
overwritten.

## After restore

**Claude Code** (if not installed):

```bash
npm install -g @anthropic-ai/claude-code
```

**Plugins** — run inside `claude`, if it doesn't offer them itself on first start:

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
/plugin install mattpocock-skills@claude-plugins-official
```

**Firecrawl MCP** (OAuth, no key to copy):

```bash
claude mcp add --transport http -s user firecrawl https://mcp.firecrawl.dev/v2/mcp-oauth
```

Then `/mcp` inside `claude` to sign in.

**Start Claude from `$HOME`** — that's the directory the memory is keyed to.

## Loose ends from the Mac

- **quant-multi-factor-system**: uncommitted work (point-in-time universe
  membership, 62 tests passing) is on branch `wip/point-in-time-universe`.
  `git merge wip/point-in-time-universe` on main when happy.
- **customer-satisfaction-mlops**: the Mac had a stray `†††` typed into
  `src/data_cleaning.py` (a syntax error). Not committed — the clone is clean.
- **major-project-b3**: read `README.md` first; it is the runbook for the lab
  setup and the laptop setup. Needs x86-64. `~/Research/Tools` (DynamoRIO and a
  PMDK build without Valgrind) is not carried; README path B rebuilds it in
  minutes.
- **Not carried**: chat history (transcripts hard-code `/Users/abhijitkar`
  paths), Python venvs (rebuild per project), and DynamoRIO.

## Refreshing this repo

```bash
rm -rf memory && cp -R ~/.claude/projects/$(printf '%s' "$HOME" | tr '/' '-')/memory memory && git add -A && git commit -m "Refresh memory" && git push
```
