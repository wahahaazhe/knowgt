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
# Copy skills to your global skills directory and keep reference assets
mkdir -p ~/.claude/skills/knowgt ~/.claude/skills/knowgtzh
cp skills/productivity/github-trending-briefing/knowgt/SKILL.md ~/.claude/skills/knowgt/SKILL.md
cp -R skills/productivity/github-trending-briefing/knowgt/reference ~/.claude/skills/knowgt/reference
cp skills/productivity/github-trending-briefing/knowgtzh/SKILL.md ~/.claude/skills/knowgtzh/SKILL.md
cp -R skills/productivity/github-trending-briefing/knowgtzh/reference ~/.claude/skills/knowgtzh/reference
```

## Usage

### Quick Commands

```
/knowgtzh    # 中文简报
/knowgt      # English briefing
```

Skill commands are case-sensitive. Use `/knowgt` or `/knowgtzh`, not `/Knowgt` or `/KnowGT`.

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
│   ├── SKILL.md          # English skill
│   └── reference/
│       └── briefing-template.html
├── knowgtzh/
│   ├── SKILL.md          # Chinese skill
│   └── reference/
│       └── briefing-template.html
├── reference/
│   └── briefing-template.html
├── examples/
│   └── trending_briefing_2026-05-27.md
└── README.md
```

## License

MIT
