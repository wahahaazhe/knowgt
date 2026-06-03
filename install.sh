#!/bin/bash

# knowgt - Know GitHub Trending · 一键安装脚本
# Usage: curl -s https://raw.githubusercontent.com/wahahaazhe/knowgt/main/install.sh | bash

set -e

echo "📦 正在安装 knowgt - Know GitHub Trending..."
echo ""

# 确定目标目录
if [ -d "$HOME/.claude/skills" ]; then
    SKILLS_DIR="$HOME/.claude/skills"
elif [ -d "$USERPROFILE/.claude/skills" ]; then
    SKILLS_DIR="$USERPROFILE/.claude/skills"
else
    # 如果目录不存在，创建它
    SKILLS_DIR="$HOME/.claude/skills"
    mkdir -p "$SKILLS_DIR"
fi

echo "📂 Skills 目录: $SKILLS_DIR"
echo ""

# 临时目录
TMP_DIR=$(mktemp -d)
echo "🔽 正在下载最新版本..."
git clone --depth 1 https://github.com/wahahaazhe/knowgt.git "$TMP_DIR/knowgt" 2>/dev/null || {
    echo "❌ 下载失败，请检查网络连接"
    exit 1
}

# 复制 skills
cp "$TMP_DIR/knowgt/skills/productivity/github-trending-briefing/knowgt/SKILL.md" "$SKILLS_DIR/knowgt.md"
cp "$TMP_DIR/knowgt/skills/productivity/github-trending-briefing/knowgtzh/SKILL.md" "$SKILLS_DIR/knowgtzh.md"

# 清理临时目录
rm -rf "$TMP_DIR"

echo ""
echo "✅ 安装成功！"
echo ""
echo "📝 使用方法："
echo "   /knowgtzh    # 中文简报"
echo "   /knowgt      # English briefing"
echo ""
echo "   或者直接说：\"帮我看看今天 GitHub 趋势\""
echo ""
echo "🔄 重启 Claude Code 后即可使用"
