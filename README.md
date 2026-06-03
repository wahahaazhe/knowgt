# knowgt - Know GitHub Trending

[English](#english) | [中文](#中文)

---

## English

**3 minutes a day, understand GitHub Trending.**

> knowgt = Know GitHub Trending · Plain-language insights into technical trends

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
/knowgtzh    # 中文简报 (Chinese)
/knowgt      # English briefing
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
├── install.sh                    # macOS/Linux one-click install
├── install.ps1                   # Windows one-click install
├── PROMO.md                      # Promo copy reference
├── README.md                       # This file (bilingual)
└── 每日运行必看.md               # Chinese usage guide
```

---

### 🤝 Contributing

Issues and PRs welcome!

---

### 📄 License

MIT License

---

## 中文

**每天 3 分钟，看懂 GitHub 热榜。**

> knowgt = Know GitHub Trending · 用中文人话解读技术趋势

把抽象的技术项目翻译成人话，智能识别重复内容，告诉你真正的技术趋势。

---

### ✨ 这玩意能干嘛？

#### 1. 把看不懂的，一秒看懂

> "端到端向量检索的分布式语义引擎" → 什么鬼？

**我们给你翻译成人话：**
> "这就像是给你的代码库装了个搜索引擎，用自然语言就能搜到你要的那段代码"

每个项目都用 3 句话讲清楚：
- ✅ 这到底是什么？
- ✅ 它能帮你解决什么痛点？
- ✅ 谁真正需要它？

#### 2. 讲过的项目，不再啰嗦

每天刷 GitHub 发现翻来覆去都是那几个老面孔？

**我们智能识别：**
- 🔥 **新上榜** → 深度解读，讲透来龙去脉
- ⭐ **持续热门** → 一句话带过，告诉你"这货又上榜了，说明是真需求"
- 📉 **掉出榜单** → 帮你分析热度变化的原因

**不浪费你的时间，只看真正的新东西。**

#### 3. 不仅仅是列表，更是趋势洞察

25 个项目看完就忘？不知道风向在哪？

**我们帮你归纳：**
> "今天的热榜被 AI 编码工具霸屏了"
> "本周 RAG 相关项目集体爆发，知识工程正在成为新赛道"
> "连续 3 天上榜的只有这 2 个项目，说明这不是短期炒作"

**看热榜，不是看八卦，是看技术的未来。**

---

### 🚀 快速开始

#### 方式一：一键安装（推荐）

**macOS / Linux:**
```bash
curl -s https://raw.githubusercontent.com/wahahaazhe/knowgt/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
iwr https://raw.githubusercontent.com/wahahaazhe/knowgt/main/install.ps1 | iex
```

#### 方式二：手动安装

```bash
# 克隆仓库
git clone https://github.com/wahahaazhe/knowgt.git

# 复制 skill 到你的全局 skills 目录
cp knowgt/skills/productivity/github-trending-briefing/knowgt/SKILL.md ~/.claude/skills/knowgt.md
cp knowgt/skills/productivity/github-trending-briefing/knowgtzh/SKILL.md ~/.claude/skills/knowgtzh.md
```

#### 方式三：作为插件安装

```bash
/plugin marketplace add wahahaazhe/knowgt
/plugin install knowgt
```

---

### 使用

重启 Claude Code 后，两种方式都可以：

#### 🎯 方式一：命令式（最快）

```
/knowgtzh    # 中文简报
/knowgt      # English briefing
```

#### 💬 方式二：自然语言

- "看看今天 GitHub 有什么热门项目"
- "生成今日趋势报告"
- "See what's trending on GitHub today"
- "Generate weekly trending report"

两种方式效果一样，选你喜欢的就好。

---

### 📊 功能特性

| 特性 | 说明 |
|------|------|
| 📝 **双报告模式** | 每次生成「简报 + 详细解读」两个文件 |
| 🔄 **历史对比** | 自动对比之前的报告，识别新上榜/掉榜项目 |
| 🎯 **趋势分析** | 归纳技术风向，解读背后的原因 |
| 🌍 **双语支持** | 中英文两个独立 skill |
| 💬 **人话解读** | 不是干巴巴的列表，告诉你「这到底是什么」「谁该用」 |

---

### 📁 输出示例

每次运行会在 `trending_reports/` 目录生成两个文件：

```
trending_reports/
├── trending_briefing_2026-06-03.md     # 简报：新上榜、持续热门、掉出榜单、趋势解读
└── trending_detailed_2026-06-03.md     # 详细解读：每个项目的深度分析
```

**简报内容包括：**
- 🔥 新上榜项目列表
- ⭐ 持续霸榜的项目（说明是真需求）
- 📉 掉出榜单的项目（解读热度变化）
- 🎯 整体技术趋势分析

**详细报告内容包括：**
- 每个项目的深度技术解读
- 解决了什么痛点、谁真的需要
- 技术亮点、类比解释

---

### 👥 什么样的人应该用？

| 人群 | 痛点 | 这个工具能帮你 |
|------|------|----------------|
| **技术负责人** | 每天忙成狗，没时间刷 GitHub | 5 分钟跟上技术风向，不跟团队脱节 |
| **开源作者** | 不知道竞争对手在做什么 | 看看同赛道谁火了，学习他们的卖点 |
| **投资人/分析师** | 找早期趋势信号 | 连续上榜的项目，往往就是下一个热点 |
| **程序员** | 想学习但不知道学什么 | 热门项目就是最好的学习清单 |
| **产品经理** | 不知道技术圈在聊什么 | 跟技术团队沟通再也不会鸡同鸭讲 |

---

### 🆚 为什么用这个，而不是自己刷？

|  | 自己刷 GitHub Trending | 用这个 Skill |
|--|------------------------|--------------|
| ⏱️ 时间 | 25 个项目每个都点进去，至少 30 分钟 | 3 分钟看完重点 |
| 🤔 理解 | 项目描述全是黑话，看不懂到底干啥的 | 人话翻译，非技术也能懂 |
| 🔄 对比 | 记不住昨天有啥，看不出变化 | 自动对比历史，识别新老面孔 |
| 📈 趋势 | 看完就忘，不知道整体风向 | 帮你归纳总结，一针见血 |

---

### 🛠️ 项目结构

```
knowgt/
├── skills/productivity/github-trending-briefing/
│   ├── knowgt/                   # English skill (SKILL.md)
│   ├── knowgtzh/                 # 中文 skill (SKILL.md)
│   ├── examples/                 # 输出示例
│   └── README.md
├── install.sh                    # macOS/Linux 一键安装
├── install.ps1                   # Windows 一键安装
├── PROMO.md                      # 推广文案参考
├── README.md                     # 本文件（中英文双语）
└── 每日运行必看.md               # 中文使用指南
```

---

### 🤝 贡献

欢迎提交 Issue 和 PR！

---

### 📄 许可证

MIT License
