# GitHub Trending Briefing Skills

A pair of Claude Code skills that turn GitHub Trending into plain-language daily briefings.

| Command | Language |
|---------|----------|
| `/gettrending` | English |
| `/gettrendingzh` | 中文 |

## Quick Install

```bash
# Clone and copy to your skills directory
cp -r skills/productivity/github-trending-briefing/gettrending ~/.claude/skills/
cp -r skills/productivity/github-trending-briefing/gettrendingzh ~/.claude/skills/
```

Restart Claude Code, then type `/gettrending` or `/gettrendingzh`.

## What You Get

Each run generates two reports in `trending_reports/`:

- **Briefing** — what's new, what's still hot, what dropped out, trend analysis
- **Detailed** — deep plain-language explanation of every new project (what it does, who needs it, simple analogy)

## Project Layout

```
.claude-plugin/plugin.json                     # Plugin manifest
skills/productivity/github-trending-briefing/
├── gettrending/SKILL.md                       # English skill
├── gettrendingzh/SKILL.md                     # Chinese skill
├── examples/                                  # Example outputs
└── README.md
trending_reports/                              # Generated reports live here
```

## License

MIT
