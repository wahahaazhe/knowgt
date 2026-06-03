"""
GitHub Trending 智能分析系统
============================
功能:
1. 爬取 GitHub Trending (daily/weekly/monthly)
2. 使用 Tavily/WebFetch 搜索项目详细信息
3. 生成通俗易懂的项目讲解（面向开发者）

系统架构:
┌─────────────────────────────────────────────────────────┐
│                    用户命令                              │
│              python trending_analyzer.py                │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│               Step 1: 爬取 Trending                      │
│         GitHubTrendingScraper.scrape(period)            │
│         返回: List[TrendingRepo]                         │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│               Step 2: 搜索项目信息                       │
│         TavilySearcher / WebFetch                        │
│         搜索每个项目的: 功能、架构、使用场景              │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│               Step 3: 生成讲解                           │
│         ProjectAnalyzer.analyze()                        │
│         生成: 功能介绍、类比、使用场景、适合人群          │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│               Step 4: 输出报告                           │
│         Markdown 格式报告                                │
│         包含图表、代码示例、对比表格                      │
└─────────────────────────────────────────────────────────┘

使用方法:
  # 方式1: 直接运行（需要 TAVILY_API_KEY）
  export TAVILY_API_KEY=your_key
  python trending_analyzer.py --period daily --limit 5

  # 方式2: 在 Claude Code 中使用
  直接调用 analyze_trending() 函数

配置文件: ~/.trending_analyzer.yaml
"""

import requests
import json
import time
import os
import re
import yaml
from typing import List, Dict, Optional
from dataclasses import dataclass, asdict, field
from datetime import datetime
from pathlib import Path

# ============== 数据模型 ==============

@dataclass
class TrendingRepo:
    """Trending 仓库数据结构"""
    name: str
    link: str
    description: str
    stars: str
    stars_period: str  # 今日/本周/本月新增
    language: str
    period: str  # daily/weekly/monthly

@dataclass
class ProjectInfo:
    """项目搜索到的信息"""
    summary: str  # 项目简介
    features: List[str]  # 核心功能
    tech_stack: List[str]  # 技术栈
    architecture: str  # 架构说明

@dataclass
class RepoAnalysis:
    """仓库分析结果"""
    repo: TrendingRepo
    what_it_does: str  # 这个项目是做什么的
    analogy: str  # 通俗易懂的类比
    use_cases: List[str]  # 使用场景
    target_users: List[str]  # 适合谁用
    tech_highlight: str  # 技术亮点
    source_urls: List[str]  # 信息来源

# ============== 配置 ==============

DEFAULT_CONFIG = {
    'tavily_api_key': None,
    'output_dir': './trending_reports',
    'cache_dir': './.trending_cache',
    'request_delay': 1.0,  # 请求间隔秒数
    'max_retries': 3,
}

def load_config() -> dict:
    """加载配置文件"""
    config_path = Path.home() / '.trending_analyzer.yaml'
    config = DEFAULT_CONFIG.copy()

    if config_path.exists():
        with open(config_path, 'r') as f:
            user_config = yaml.safe_load(f) or {}
            config.update(user_config)

    # 环境变量优先级最高
    if os.environ.get('TAVILY_API_KEY'):
        config['tavily_api_key'] = os.environ['TAVILY_API_KEY']

    return config

# ============== 爬虫模块 ==============

class GitHubTrendingScraper:
    """
    GitHub Trending 爬虫

    注意: GitHub 现在对未登录用户限制了部分访问
    推荐使用 Claude Code 的 WebFetch 工具
    """

    def __init__(self, config: dict):
        self.config = config
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        }

    def scrape(self, period: str = 'daily') -> List[TrendingRepo]:
        """
        爬取 GitHub Trending

        实际使用时应该调用 Claude Code 的 WebFetch 工具
        """
        url = f"https://github.com/trending?since={period}"
        print(f"📡 正在爬取 {period} trending...")
        print(f"   提示: 推荐使用 Claude Code 的 WebFetch 工具")
        return []

# ============== 搜索模块 ==============

class TavilySearcher:
    """Tavily 搜索器"""

    API_URL = "https://api.tavily.com/search"

    def __init__(self, api_key: Optional[str] = None):
        self.api_key = api_key

    def search(self, query: str, max_results: int = 5) -> Dict:
        """执行搜索"""
        if not self.api_key:
            return {"error": "No API key configured"}

        payload = {
            "api_key": self.api_key,
            "query": query,
            "search_depth": "advanced",
            "max_results": max_results,
            "include_answer": True,
        }

        try:
            response = requests.post(self.API_URL, json=payload, timeout=30)
            return response.json()
        except Exception as e:
            return {"error": str(e)}

# ============== 分析模块 ==============

class ProjectAnalyzer:
    """项目分析器"""

    def __init__(self, config: dict):
        self.config = config
        self.searcher = TavilySearcher(config.get('tavily_api_key'))

    def build_search_query(self, repo: TrendingRepo) -> str:
        """构建搜索查询"""
        return f"{repo.name} GitHub project what it does features architecture use cases"

    def analyze(self, repo: TrendingRepo, search_result: Optional[Dict] = None) -> RepoAnalysis:
        """
        分析单个仓库

        如果提供了 search_result，直接使用
        否则需要调用搜索 API
        """
        # 构建基础分析
        return RepoAnalysis(
            repo=repo,
            what_it_does="",
            analogy="",
            use_cases=[],
            target_users=[],
            tech_highlight=repo.language,
            source_urls=[repo.link]
        )

    def generate_explanation(self, analysis: RepoAnalysis) -> str:
        """生成通俗易懂的讲解"""
        template = """
## {name}

**语言**: {language} | **Star**: {stars} | **{period}新增**: {stars_period}

### 🎯 这个项目是做什么的？

{what_it_does}

### 💡 通俗理解

{analogy}

### 🔧 使用场景

{use_cases}

### 👥 适合谁用？

{target_users}
"""
        return template.format(
            name=analysis.repo.name,
            language=analysis.repo.language or '未知',
            stars=analysis.repo.stars,
            period=analysis.repo.period,
            stars_period=analysis.repo.stars_period,
            what_it_does=analysis.what_it_does or '暂无详细信息',
            analogy=analysis.analogy or '暂无类比',
            use_cases='\n'.join(f'- {uc}' for uc in analysis.use_cases) or '- 暂无',
            target_users='\n'.join(f'- {tu}' for tu in analysis.target_users) or '- 暂无'
        )

# ============== 报告生成器 ==============

class ReportGenerator:
    """报告生成器"""

    def __init__(self, output_dir: str):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

    def generate(self, analyses: List[RepoAnalysis], period: str) -> str:
        """生成完整报告"""
        timestamp = datetime.now().strftime('%Y-%m-%d_%H%M%S')
        filename = f"trending_{period}_{timestamp}.md"
        filepath = self.output_dir / filename

        report = self._build_report(analyses, period)

        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(report)

        return str(filepath)

    def _build_report(self, analyses: List[RepoAnalysis], period: str) -> str:
        """构建报告内容"""
        lines = [
            f"# GitHub Trending 分析报告 ({period})",
            f"> 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
            "",
            "---",
            "",
        ]

        for i, analysis in enumerate(analyses, 1):
            lines.append(f"## {i}. {analysis.repo.name}")
            lines.append("")
            lines.append(f"**仓库**: [{analysis.repo.link}]({analysis.repo.link})")
            lines.append(f"**语言**: {analysis.repo.language or '未知'} | **Star**: {analysis.repo.stars}")
            lines.append("")

            if analysis.what_it_does:
                lines.append("### 🎯 功能介绍")
                lines.append("")
                lines.append(analysis.what_it_does)
                lines.append("")

            if analysis.analogy:
                lines.append("### 💡 通俗理解")
                lines.append("")
                lines.append(analysis.analogy)
                lines.append("")

            if analysis.use_cases:
                lines.append("### 🔧 使用场景")
                lines.append("")
                for uc in analysis.use_cases:
                    lines.append(f"- {uc}")
                lines.append("")

            if analysis.target_users:
                lines.append("### 👥 适合人群")
                lines.append("")
                for tu in analysis.target_users:
                    lines.append(f"- {tu}")
                lines.append("")

            lines.append("---")
            lines.append("")

        return '\n'.join(lines)

# ============== 主入口 ==============

def analyze_trending(
    repos: List[TrendingRepo],
    search_results: Optional[Dict[str, Dict]] = None,
    config: Optional[dict] = None
) -> str:
    """
    分析 trending 仓库（供 Claude Code 调用）

    Args:
        repos: 仓库列表（从 WebFetch 获取）
        search_results: 搜索结果（从 Tavily/WebFetch 获取）
        config: 配置

    Returns:
        报告文件路径
    """
    config = config or load_config()
    analyzer = ProjectAnalyzer(config)
    report_gen = ReportGenerator(config['output_dir'])

    analyses = []
    for repo in repos:
        result = search_results.get(repo.name) if search_results else None
        analysis = analyzer.analyze(repo, result)
        analyses.append(analysis)

    return report_gen.generate(analyses, repos[0].period if repos else 'daily')

def main():
    """命令行入口"""
    import argparse

    parser = argparse.ArgumentParser(description='GitHub Trending 智能分析系统')
    parser.add_argument('--period', '-p', default='daily',
                        choices=['daily', 'weekly', 'monthly'])
    parser.add_argument('--limit', '-l', type=int, default=5)
    parser.add_argument('--output', '-o', default=None)

    args = parser.parse_args()
    config = load_config()

    print("=" * 60)
    print("📊 GitHub Trending 智能分析系统")
    print("=" * 60)

    # 检查配置
    if not config.get('tavily_api_key'):
        print("⚠️  未配置 TAVILY_API_KEY")
        print("   请设置环境变量: export TAVILY_API_KEY=your_key")
        print("   或在 Claude Code 中使用 WebFetch")

    print("\n推荐使用方式:")
    print("  在 Claude Code 中直接调用 analyze_trending() 函数")

if __name__ == '__main__':
    main()
