#!/bin/bash

# GitHub Trending Briefing Skills - 一键安装脚本
# Usage: curl -s https://raw.githubusercontent.com/YOUR_USERNAME/githubvisual/master/install.sh | bash

set -e

echo "📦 正在安装 GitHub Trending Briefing Skills..."
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
git clone --depth 1 https://github.com/leizhaoqi/githubvisual.git "$TMP_DIR/githubvisual" 2>/dev/null || {
    echo "❌ 下载失败，请检查网络连接"
    exit 1
}

# 复制 skills
cp -r "$TMP_DIR/githubvisual/skills/productivity/github-trending-briefing/gettrending" "$SKILLS_DIR/"
cp -r "$TMP_DIR/githubvisual/skills/productivity/github-trending-briefing/gettrendingzh" "$SKILLS_DIR/"

# 清理临时目录
rm -rf "$TMP_DIR"

echo ""
echo "✅ 安装成功！"
echo ""
echo "📝 使用方法："
echo "   /gettrending      - 英文简报"
echo "   /gettrendingzh    - 中文简报"
echo ""
echo "🔄 重启 Claude Code 后即可使用"
