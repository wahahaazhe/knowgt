"""
GitHub Trending 爬虫 - 使用 WebFetch 方式
最简单有效的方法
"""

import json

def get_trending_prompt(since='daily'):
    """生成用于提取 trending 数据的 prompt"""
    return f"""提取所有 trending 仓库信息，返回 JSON 格式：
[
  {{
    "name": "owner/repo",
    "link": "https://github.com/owner/repo",
    "description": "描述",
    "stars": "总star数",
    "stars_today": "今日新增star数",
    "language": "编程语言"
  }}
]
只返回 JSON，不要其他文字。"""

# 使用示例（需要配合 Claude API 或 WebFetch）
if __name__ == '__main__':
    print("=== GitHub Trending 爬虫 ===")
    print("\n方法1: 使用 Claude Code 的 WebFetch 工具")
    print("方法2: 使用 requests + BeautifulSoup（需要处理动态内容）")
    print("方法3: 使用 Playwright/Selenium（处理 JavaScript 渲染）")
    print("\n推荐使用 Claude Code 的 WebFetch，最简单！")
