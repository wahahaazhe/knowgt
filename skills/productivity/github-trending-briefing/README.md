# GitHub Trending Briefing

Generate plain-language GitHub Trending briefings from Claude Code. Available in English and Chinese.

| Command | Language | 
|---------|----------|
| `/gettrending` | English |
| `/gettrendingzh` | 中文 |

## Install

### Claude Code

```bash
claude plugin install github-trending-briefing@<your-github-username>/githubvisual
```

Or manually:

```bash
# Copy skills to your global skills directory
cp -r skills/productivity/github-trending-briefing/gettrending ~/.claude/skills/
cp -r skills/productivity/github-trending-briefing/gettrendingzh ~/.claude/skills/
```

### Codex / Other Agents

Add this repo as a skill source, then reference `skills/productivity/github-trending-briefing/gettrending/SKILL.md` or `gettrendingzh/SKILL.md`.

## Usage

```
/gettrending
```

Or ask naturally: "See what's trending on GitHub today", "看看今天的 GitHub 热门项目"

## What It Does

1. Fetches current [GitHub Trending](https://github.com/trending)
2. Compares against historical reports (if available)
3. Groups repositories by theme
4. Generates two reports:
   - **Briefing** — quick overview with new/still hot/dropped out
   - **Detailed** — deep-dive on every new project with plain-language explanations

Reports are saved to `trending_reports/`.

## File Structure

```
skills/productivity/github-trending-briefing/
├── gettrending/
│   └── SKILL.md          # English skill
├── gettrendingzh/
│   └── SKILL.md          # Chinese skill
├── examples/
│   └── trending_briefing_2026-05-27.md
└── README.md
```

## License

MIT
