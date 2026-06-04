# KnowGT - Know GitHub Trending

![KnowGT Banner](../assets/knowgt-banner.png)

**简体中文** | [English](README.en.md)

---

**每天 3 分钟，看懂 GitHub 热榜。**

> KnowGT = Know GitHub Trending · 用中文人话解读技术趋势

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

**不浪费你的时间，只看真正的新东西。**

#### 3. 不仅仅是列表，更是趋势洞察

25 个项目看完就忘？不知道风向在哪？

**我们帮你归纳：**
> "今天的热榜被 AI 编码工具霸屏了"
> "本周 RAG 相关项目集体爆发，知识工程正在成为新赛道"
> "连续 3 天上榜的只有这 2 个项目，说明这不是短期炒作"

**看热榜，不是看八卦，是看技术的未来。**

#### 4. 每次自动生成两份报告

每次运行自动在 `trending_reports/` 目录生成两个文件：
- 📋 **简报** → 快速概览：新上榜/持续热门 + 趋势总结（5 分钟读完）
- 📚 **详细报告** → 深度解读：每个新项目的人话版完整解释

**想快速扫一眼还是深入研究，都能满足你。**

#### 5. 近期最佳 - 突破 Trending 滞后性

**提前发现潜力项目：**
- 🚀 按今日新增 stars 降序取 Top 5，排除已在 Trending 的项目
- 🎯 单独列出「近期最佳」板块

**帮你在别人发现前锁定下一个爆款。**

#### 6. 可选 HTML 可视化展示

HTML 可视化是**可选附加功能**：
- 仅当用户明确要求"生成HTML"、"可视化展示"时才生成
- Markdown 讲解质量永远是核心优先级
- 包含交互式图表、趋势对比、可展开的项目详情等增强效果

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
/knowgtzh    # 生成中文简报 + 详细报告
/knowgt      # Generate English briefing + detailed report
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
| 💎 **近期最佳挖掘** | 按新增 stars 降序取 Top 5，发现 Trending 之外的潜力项目 |
| 📊 **可选可视化** | HTML 可视化展示 — 需要时才生成 |

---

### 📁 输出示例

每次运行会在 `trending_reports/` 目录生成两个文件：

```
trending_reports/
├── trending_briefing_2026-06-03.md     # 简报：新上榜、持续热门、趋势解读
└── trending_detailed_2026-06-03.md     # 详细解读：每个项目的深度分析
```

**简报内容包括：**
- 🔥 新上榜项目列表
- ⭐ 持续霸榜的项目（说明是真需求）
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
├── READMEs/
│   ├── README.en.md              # 英文文档
│   └── README.zh-CN.md           # 中文文档（当前文件）
├── install.sh                    # macOS/Linux 一键安装
├── install.ps1                   # Windows 一键安装
├── PROMO.md                      # 推广文案参考
├── README.md                     # 主 README（中文）
└── 每日运行必看.md               # 中文使用指南
```

---

### 🤝 贡献

欢迎提交 Issue 和 PR！

---

### 🔗 社区链接

本项目在 [LINUX DO](https://linux.do) 社区进行开源推广，感谢社区的支持！

---

### 📄 许可证

MIT License
