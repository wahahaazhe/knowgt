---
name: knowgtzh
description: 从 WebFetch/WebSearch 结果生成简洁、易读的 GitHub Trending 中文简报，与已有的 markdown 历史报告对比，并撰写每日或每周趋势总结。当用户要求分析 GitHub 热门趋势、对比今日与历史趋势、用通俗语言解释热门仓库，或为 Codex、Claude Code 等编码助手创建可重复的 GitHub 趋势报告时使用。
---

# GitHub 热门趋势简报（中文版）

从 GitHub Trending 生成通俗易懂的中文简报。优先使用 WebFetch/WebSearch，而非本地爬虫脚本。本 skill 的价值在于趋势解读，而非爬虫维护。

## 工作流程

1. 确定范围：
   - 默认周期：`daily`（每日）。
   - 同时支持 `weekly`（每周）和 `monthly`（每月）。
   - 默认输出：带日期的 markdown 简报。

2. 获取当前数据：
   - 抓取 `https://github.com/trending?since=daily`、`weekly` 或 `monthly`。
   - 捕获仓库名称、URL、语言、总 stars 数、本周期新增 stars 数，以及简短描述。
   - 如果 GitHub Trending 不可用，使用 WebSearch 寻找可靠的镜像站或 GitHub 搜索作为备选方案，并说明使用了何种备选。

3. 查找历史：
   - 如果当前项目有 `trending_reports/` 目录，读取最新的 2-5 份 markdown 报告。
   - 如果用户指定了其他历史目录，使用用户指定的目录。
   - 如果没有历史记录，创建首份简报，并说明暂无对比基准。

4. 对比分析：
   - 识别未在近期报告中出现的新上榜项目。
   - 识别在多轮报告中持续热门的项目。
   - 识别在有历史记录的情况下掉出榜单的项目。
   - 按主题归类趋势，例如 AI 编码助手、开发者工具、基础设施、UI、数据、安全、教育等。

5. 撰写简报：
   - 使用直接清晰的语言。避免使用架构、范式、赋能、杠杆、战略护城河等术语，除非仓库本身使用了这些词且确有必要。
   - 解释每个项目能帮助人们做什么，而非其内部实现细节。
   - **关键原则：让外行也能看懂。** 如果写完之后一个非技术背景的人看不懂这个项目是干什么的，说明解释不合格。
   - 不要在项目间复制粘贴相似的模糊描述（如”AI 原生””现代化架构”），每个项目的解释必须体现它独有的特点。
   - 仅在解释不熟悉的项目时使用简单的类比。
   - 在说明”谁需要它”时，描述具体的人群和场景，而非泛泛的”开发者”或”工程师”。

6. 保存 markdown 输出（在仓库中工作时）：
   - **必须同时生成两份报告**：
     - **简报** → `trending_reports/trending_briefing_YYYY-MM-DD.md`（快速概览）
     - **详细报告** → `trending_reports/trending_detailed_YYYY-MM-DD.md`（新项目逐一深度讲解）
   - 详细报告中，历史上首次出现的项目必须逐一展开讲解，已在历史报告中出现过的项目只需简短引用。
   - 除非用户要求，否则不要覆盖已有报告。

7. 生成 HTML 报告并在浏览器中打开：
   - 读取模板文件 `skills/productivity/github-trending-briefing/reference/briefing-template.html`，理解其 CSS 和 DOM 结构。模板采用**单页双标签设计**，将简报和详细报告合并在同一页面。
   - 生成 `trending_reports/trending_briefing_YYYY-MM-DD.html`，使用与模板**完全相同的 CSS 和 DOM 结构**。将每个部分填入真实数据：
     - **Hero 头部**：更新标题、日期、周期、来源、对比基准等信息。
     - **Stats 统计栏**：将示例数字替换为实际统计（总项目数、新上榜数、持续热门数、掉榜数）。
     - **简报标签页**（"新上榜"表格、"持续热门"表格、"掉出榜单"表格、"趋势解读"段落、"完整榜单"表格）。有真实数据后移除 empty-row 占位行。
     - **详细标签页**（`.detail-list`）：对每个**首次出现**的项目，渲染完整的 `.project-card`，包含头部（排名、名称+链接、语言标签、stars 数）和正文（what-is-it、`.proj-analogy` 类比、`.proj-helps` 帮助列表、`.persona` 适用人群标签）。对已在历史报告中出现过的项目，渲染较短的 `.project-card`，降低透明度，添加引用说明而无需重复完整解读。
     - **标签切换 `<script>`**：保留模板中的 `switchTab()` 函数以确保标签切换正常工作。
   - HTML 文件必须是自包含的（不依赖外部资源），所有 CSS 保持在 `<style>` 标签内，所有 JS 保持在 `<script>` 标签内。
   - 写入 HTML 文件后，在默认浏览器中打开：
     - **macOS**：运行 `open trending_reports/trending_briefing_YYYY-MM-DD.html`
     - **Linux**：运行 `xdg-open trending_reports/trending_briefing_YYYY-MM-DD.html`
     - **Windows**：运行 `start trending_reports/trending_briefing_YYYY-MM-DD.html`（cmd）或 `Start-Process trending_reports/trending_briefing_YYYY-MM-DD.html`（PowerShell）
   - 自动检测平台，不要询问用户使用什么操作系统。

## 简报结构

除非用户另有要求，否则使用以下结构：

```markdown
# GitHub 热门趋势简报 - YYYY-MM-DD

> 生成日期：YYYY-MM-DD
> 来源：github.com/trending
> 对比基准：<近期报告日期 或 "无">

## 新上榜

| 排名 | 项目 | 语言 | 新增 Stars | 通俗解释 |
|------|------|------|------------|----------|

## 持续热门

| 项目 | 证据 | 为什么值得关注 |
|------|------|----------------|

## 掉出榜单

| 项目 | 此前状态 | 可能意味着什么 |
|------|----------|----------------|

## 趋势解读

用简洁的段落解释当前最强趋势。

## 完整榜单

| 排名 | 项目 | 语言 | 总 Stars | 新增 Stars |
|------|------|------|----------|------------|
```

## 仓库解释模板

当需要单独解释某个仓库时，使用以下格式：

```markdown
**这是什么？** 30 字以内。

**简单类比：** 一个日常生活中的比喻。

**它能帮你做什么？**
- 帮你 …
- 让你 …
- 省去 … 的麻烦

**谁真正需要它？**
- 有具体工作或反复遇到的问题的人。
```

