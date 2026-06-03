# GitHub Trending Briefing Skills

每天自动抓取 GitHub Trending，对比历史数据，生成人话版趋势简报。支持中英文双语。

Generate plain-language GitHub Trending daily briefings with historical comparison. Available in English and Chinese.

---

## 🚀 快速开始

### 方式一：一键安装（推荐）

**macOS / Linux:**
```bash
curl -s https://raw.githubusercontent.com/wahahaazhe/githubvisual/master/install.sh | bash
```

**Windows (PowerShell):**
```powershell
iwr https://raw.githubusercontent.com/wahahaazhe/githubvisual/master/install.ps1 | iex
```

### 方式二：手动安装

```bash
# 克隆仓库
git clone https://github.com/wahahaazhe/githubvisual.git

# 复制 skill 到你的全局 skills 目录
cp -r githubvisual/skills/productivity/github-trending-briefing/gettrending ~/.claude/skills/
cp -r githubvisual/skills/productivity/github-trending-briefing/gettrendingzh ~/.claude/skills/
```

### 方式三：作为插件安装

```bash
claude plugin install github-trending-briefing@wahahaazhe/githubvisual
```

---

## 使用

重启 Claude Code 后，直接输入命令：

```
/gettrending      # 英文简报
/gettrendingzh    # 中文简报
```

或者自然语言提问：
- "看看今天 GitHub 有什么热门项目"
- "生成今日趋势报告"
- "See what's trending on GitHub today"

---

## ✨ 功能特性

| 特性 | 说明 |
|------|------|
| 📊 **双报告模式** | 每次生成「简报 + 详细解读」两个文件 |
| 🔄 **历史对比** | 自动对比之前的报告，识别新上榜/掉榜项目 |
| 📈 **趋势分析** | 归纳技术风向，解读背后的原因 |
| 🌍 **双语支持** | 中英文两个独立 skill |
| 💬 **人话解读** | 不是干巴巴的列表，告诉你「这到底是什么」「谁该用」 |

---

## 📁 输出示例

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

## 🛠️ 项目结构

```
githubvisual/
├── skills/productivity/github-trending-briefing/
│   ├── gettrending/
│   │   └── SKILL.md              # English skill
│   ├── gettrendingzh/
│   │   └── SKILL.md              # 中文 skill
│   ├── examples/                  # 输出示例
│   └── README.md
├── trending_reports/              # 历史报告存档
├── .claude-plugin/
│   └── plugin.json                # Claude Code 插件清单
└── 每日运行必看.md                # 中文使用指南
```

---

## 📖 使用场景

1. **技术从业者**：每天早上花 5 分钟了解技术风向
2. **投资人/分析师**：发现早期热门技术方向
3. **开源作者**：看看同类项目的热度变化
4. **学习者**：找到值得学习的新技术项目

---

## 🤝 贡献

欢迎提交 Issue 和 PR！

---

## 📄 许可证

MIT License
