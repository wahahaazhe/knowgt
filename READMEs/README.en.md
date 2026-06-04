# KnowGT - Know GitHub Trending

![KnowGT Banner](../assets/knowgt-banner.png)

[简体中文](README.zh-CN.md) | **English**

---

**3 minutes a day, understand GitHub Trending.**

> KnowGT = Know GitHub Trending · Plain-language insights into technical trends

Translate abstract technical projects into human-readable terms, intelligently identify recurring content, and show you the real technology trends.

---

### ✨ What can this do?

#### 1. Make the incomprehensible, instantly understandable

> "Distributed semantic engine for end-to-end vector retrieval" → What the heck?

**We translate it for you:**
> "It's like installing a search engine for your codebase - you can find the code you need using natural language"

Every project is explained in 3 sentences:
- ✅ What is this actually?
- ✅ What pain points can it help you solve?
- ✅ Who actually needs it?

#### 2. No more repetition for projects we've covered

Tired of seeing the same projects every day on GitHub?

**We intelligently identify:**
- 🔥 **New on the list** → Deep dive, full context
- ⭐ **Still hot** → One-liner, confirming real demand
- 📉 **Dropped out** → Help analyze why the heat changed

**Don't waste your time, only see what's genuinely new.**

#### 3. Not just a list, but trend insights

25 projects forgotten after reading? Don't know which way the wind is blowing?

**We help you summarize:**
> "AI coding tools are dominating today's hot list"
> "RAG-related projects exploded this week - knowledge engineering is becoming the new battleground"
> "Only 2 projects made the list 3 days in a row - this isn't short-term hype"

**Watch the hot list to see technology's future, not just gossip.**

#### 4. Auto-generates TWO reports every time

Every run creates two files in `trending_reports/`:
- 📋 **Briefing** → Quick overview: new/still hot/dropped + trend summary (5-min read)
- 📚 **Detailed** → Deep dive: full explanation of every new project in plain language

**Get exactly the depth you need, from quick scan to full analysis.**

#### 5. Hidden Gems - Beat Trending Latency

**Catch rising stars early:**
- 🚀 Take Top 5 projects by stars gained today, excluding those already on Trending
- 🎯 Add dedicated "Hidden Gems" section

**Lock in the next big thing before everyone else.**

#### 6. Optional HTML Visualization

HTML visualization is an **optional add-on feature**:
- Only generated when user explicitly asks for "HTML", "visualization", "interactive display"
- Markdown report quality is always the core priority
- Interactive charts, trend comparisons, expandable project details

---

### 🚀 Quick Start

#### Method 1: One-click Install (Recommended)

**macOS / Linux:**
```bash
curl -s https://raw.githubusercontent.com/wahahaazhe/knowgt/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
iwr https://raw.githubusercontent.com/wahahaazhe/knowgt/main/install.ps1 | iex
```

#### Method 2: Manual Install

```bash
# Clone the repo
git clone https://github.com/wahahaazhe/knowgt.git

# Copy skills to your global skills directory
cp knowgt/skills/productivity/github-trending-briefing/knowgt/SKILL.md ~/.claude/skills/knowgt.md
cp knowgt/skills/productivity/github-trending-briefing/knowgtzh/SKILL.md ~/.claude/skills/knowgtzh.md
```

#### Method 3: Install as Plugin

```bash
/plugin marketplace add wahahaazhe/knowgt
/plugin install knowgt
```

---

### Usage

After restarting Claude Code, two ways to use:

#### 🎯 Method 1: Command (Fastest)

```
/knowgtzh    # 生成中文简报 + 详细报告
/knowgt      # Generate English briefing + detailed report
```

#### 💬 Method 2: Natural Language

- "See what's trending on GitHub today"
- "Generate weekly trending report"
- "看看今天 GitHub 有什么热门项目"
- "生成今日趋势报告"

Both methods work the same, pick what you prefer.

---

### 📊 Features

| Feature | Description |
|---------|-------------|
| 📝 **Dual Report Mode** | Generates both "briefing" and "detailed" files each time |
| 🔄 **History Comparison** | Auto-compare with previous reports, identify new/dropped items |
| 🎯 **Trend Analysis** | Summarize technology winds, interpret the reasons behind |
| 🌍 **Bilingual Support** | Two independent skills for English and Chinese |
| 💬 **Plain-Language** | Not just dry lists - tells you "what this actually is" and "who needs it" |
| 💎 **Hidden Gems** | Take Top 5 by stars gained, find rising stars not on Trending |
| 📊 **Optional HTML** | Visualization add-on - only when you ask for it |

---

### 📁 Output Example

Each run generates two files in `trending_reports/`:

```
trending_reports/
├── trending_briefing_2026-06-03.md     # Briefing: New, Still Hot, Dropped, Trends
└── trending_detailed_2026-06-03.md     # Detailed: Deep dive on each new project
```

**Briefing includes:**
- 🔥 Newly trending projects
- ⭐ Projects staying hot (signaling real demand)
- 📉 Projects that dropped out (interpreting heat changes)
- 🎯 Overall technology trend analysis

**Detailed Report includes:**
- Deep technical breakdown for each project
- What pain points solved, who really needs it
- Technical highlights, analogies for explanation

---

### 👥 Who should use this?

| Person | Pain Point | This tool helps |
|--------|-----------|-----------------|
| **Tech Leads** | Too busy to scroll GitHub daily | 5 minutes to stay current with tech winds |
| **Open Source Authors** | Don't know what competitors are doing | See who's trending in your space, learn their selling points |
| **Investors/Analysts** | Looking for early trend signals | Projects trending consistently are often the next big thing |
| **Developers** | Want to learn but don't know what | Trending projects = the best learning list |
| **Product Managers** | Don't know what the tech circle is talking about | Never feel lost talking to engineering teams again |

---

### 🆚 Why use this instead of scrolling yourself?

| | Scrolling GitHub Trending Yourself | Using this Skill |
|---|-----------------------------------|------------------|
| ⏱️ Time | 25 projects, click each - 30 minutes min | 3 minutes to see the highlights |
| 🤔 Understanding | Project descriptions full of jargon, can't tell what they do | Plain-language translation, non-technical people can understand |
| 🔄 Comparison | Can't remember yesterday's list, can't see changes | Auto-compare history, spot new vs recurring |
| 📈 Trends | Forget after reading, don't see the big picture | Helps you summarize, cuts to the chase |

---

### 🛠️ Project Structure

```
knowgt/
├── skills/productivity/github-trending-briefing/
│   ├── knowgt/                   # English skill (SKILL.md)
│   ├── knowgtzh/                 # 中文 skill (SKILL.md)
│   ├── examples/                 # Output examples
│   └── README.md
├── READMEs/
│   ├── README.en.md              # English documentation
│   └── README.zh-CN.md           # Chinese documentation
├── install.sh                    # macOS/Linux one-click install
├── install.ps1                   # Windows one-click install
├── PROMO.md                      # Promo copy reference
├── README.md                     # Main README (中文)
└── 每日运行必看.md               # Chinese usage guide
```

---

### 🤝 Contributing

Issues and PRs welcome!

---

### 🔗 Community

This project is promoted on the [LINUX DO](https://linux.do) community. Thanks for their support!

---

### 📄 License

MIT License
