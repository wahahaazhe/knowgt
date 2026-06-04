---
name: knowgt
description: Generate concise, human-readable GitHub Trending briefings from WebFetch/WebSearch results, compare against prior markdown reports when available, and write daily or weekly trend summaries. Use when the user asks to analyze GitHub Trending, compare today's GitHub trends with history, explain trending repositories in plain language, or create a repeatable GitHub Trending report for Codex, Claude Code, or another coding agent.
---

# GitHub Trending Briefing

Create a plain-language briefing from GitHub Trending. Prefer WebFetch/WebSearch over local scraping scripts. The value of this skill is trend interpretation, not crawler maintenance.

## Workflow

1. Determine scope:
   - Default period: `daily`.
   - Also support `weekly` and `monthly` when requested.
   - Default output: a dated markdown briefing.

2. Fetch current data:
   - Fetch `https://github.com/trending?since=daily`, `weekly`, or `monthly`.
   - Capture repository name, URL, language, total stars, stars gained in the period, and short description.
   - If GitHub Trending is unavailable, use WebSearch to find a reliable mirror or GitHub search fallback, and state the fallback used.

3. Find history:
   - If the current project has `trending_reports/`, read the newest 2-5 markdown reports.
   - If the user gave another history directory, use that.
   - If no history exists, create a first-run briefing and say there is no comparison baseline.

4. Compare:
   - Identify new entries that did not appear in recent reports.
   - Find recent best performers: consistently hot projects + high-growth hidden gems.
   - Group the trend by theme, such as AI coding agents, developer tools, infra, UI, data, security, or education.

5. Write the briefing:
   - Use direct language. Avoid jargon such as architecture, paradigm, empowerment, enablement, leverage, and strategic moat unless the repository itself uses those words and they are necessary.
   - Explain what each project helps someone do, not its internal implementation.
   - **Key principle: a non-technical person should understand it.** If someone outside tech can't grasp what the project does after reading your explanation, it's not good enough.
   - Don't copy-paste similar vague descriptions across projects (e.g., "AI-native", "modern architecture"). Each project's explanation must capture what makes it unique.
   - Include a simple analogy only when explaining an unfamiliar project.
   - For "who needs it", name concrete people and situations, not broad labels like developer or engineer.

6. Save markdown output when working in a repo:
   - **Must generate TWO reports**:
     - **Briefing** → `trending_reports/trending_briefing_YYYY-MM-DD.md` (quick overview)
     - **Detailed** → `trending_reports/trending_detailed_YYYY-MM-DD.md` (deep-dive on each new project)
   - In the detailed report, every first-time project gets a full breakdown. Projects already covered in prior reports get a short citation.
   - Do not overwrite an existing report unless the user asks.

7. Generate HTML report and open in browser:
   - Read the template at `skills/productivity/github-trending-briefing/reference/briefing-template.html` to understand its CSS and DOM structure. The template is a **single-page, two-tab design** that merges both briefing and detailed views.
   - Generate `trending_reports/trending_briefing_YYYY-MM-DD.html` using the **exact same CSS and DOM structure** as the template. Fill every section with real data:
     - **Hero**: update title, date, since-period, source, baseline chips.
     - **Stats bar**: replace sample numbers with actual counts (total repos, new entries, recent best).
     - **Briefing tab** ("New On The List" table, "Recent Best" table, "Trend Read" paragraphs, "Full List" table). Remove empty-row placeholders once real rows exist.
     - **Detailed tab** (`.detail-list`): for each **first-time** project, render a full `.project-card` with header (rank, name+link, lang-tag, stars) and body (what-is-it, analogy in `.proj-analogy`, helps-list in `.proj-helps`, who-needs-it with `.persona` tags). For projects already covered in prior reports, render a shorter `.project-card` with lower opacity and a note referencing the earlier report instead of repeating the full breakdown.
     - **Tab-switching `<script>`**: keep the exact `switchTab()` function from the template so tabs work.
   - The HTML file must be self-contained (no external resources). All CSS stays inline in `<style>`, all JS inline in `<script>`.
   - After writing the HTML file, open it in the default browser:
     - **macOS**: run `open trending_reports/trending_briefing_YYYY-MM-DD.html`
     - **Linux**: run `xdg-open trending_reports/trending_briefing_YYYY-MM-DD.html`
     - **Windows**: run `start trending_reports/trending_briefing_YYYY-MM-DD.html` (cmd) or `Start-Process trending_reports/trending_briefing_YYYY-MM-DD.html` (PowerShell)
   - Detect the platform automatically — do not ask the user which OS they are on.

## Briefing Shape

Use this structure unless the user asks for something else:

```markdown
# GitHub Trending Briefing - YYYY-MM-DD

> Generated: YYYY-MM-DD
> Source: github.com/trending
> Baseline: <recent report dates or "none">

## New On The List

| Rank | Project | Language | Stars Gained | Plain-English Use |
|------|---------|----------|--------------|-------------------|

## Recent Best

| Project | Evidence | Why It Matters |
|---------|----------|----------------|

## Trend Read

Short paragraphs explaining the strongest pattern in normal language.

## Full List

| Rank | Project | Language | Total Stars | Stars Gained |
|------|---------|----------|-------------|--------------|
```

## Repository Explanations

When asked to explain individual repositories, use this format:

```markdown
**What is it?** 30 words or fewer.

**Simple analogy:** One everyday comparison.

**What can it help you do?**
- Help you ...
- Let you ...
- Save you from ...

**Who actually needs it?**
- Someone with a concrete job or recurring problem.
```

