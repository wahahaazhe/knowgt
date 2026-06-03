# knowgt - Know GitHub Trending

Generate plain-language GitHub Trending briefings for Claude Code. Available in English and Chinese.

| Command | Language | 
|---------|----------|
| `/knowgt` | English |
| `/knowgtzh` | 中文 |

## Install

### Claude Code Plugin

```bash
/plugin marketplace add wahahaazhe/knowgt
/plugin install knowgt
```

Or manually:

```bash
# Copy skills to your global skills directory
cp skills/productivity/github-trending-briefing/knowgt/SKILL.md ~/.claude/skills/knowgt.md
cp skills/productivity/github-trending-briefing/knowgtzh/SKILL.md ~/.claude/skills/knowgtzh.md
```

## Usage

### Quick Commands

```
/knowgtzh    # 中文简报
/knowgt      # English briefing
```

### Natural Language

- English: "See what's trending on GitHub today", "Show weekly trends"
- 中文: "看看今天的 GitHub 热门项目", "生成趋势报告"

## What It Does

1. Fetches current [GitHub Trending](https://github.com/trending) (daily + weekly + monthly
2. Cross-comparison across three timeframes
3. Compares against historical reports (if available)
4. Groups repositories by theme
5. Generates two reports:
   - **Briefing** — quick overview with new/still hot/dropped out
   - **Detailed** — deep-dive on every new project with plain-language explanations

Reports are saved to `trending_reports/`.

## File Structure

```
skills/productivity/github-trending-briefing/
├── knowgt/
│   └── SKILL.md          # English skill
├── knowgtzh/
│   └── SKILL.md          # Chinese skill
├── examples/
│   └── trending_briefing_2026-05-27.md
└── README.md
```

## License

MIT
