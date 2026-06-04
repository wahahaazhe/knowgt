#!/bin/bash

# KnowGT - Know GitHub Trending · 一键安装脚本
# Usage: curl -s https://raw.githubusercontent.com/wahahaazhe/KnowGT/master/install.sh | bash

set -e

echo "📦 正在安装 KnowGT - Know GitHub Trending..."
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
git clone --depth 1 --branch master https://github.com/wahahaazhe/KnowGT.git "$TMP_DIR/KnowGT" 2>/dev/null || {
    echo "❌ 下载失败，请检查网络连接"
    exit 1
}

# 复制 skills（目录结构保留 reference 模板资源）
SRC_DIR="$TMP_DIR/KnowGT/skills/productivity/github-trending-briefing"
rm -f "$SKILLS_DIR/KnowGT.md" "$SKILLS_DIR/KnowGTzh.md" "$SKILLS_DIR/knowgt.md" "$SKILLS_DIR/knowgtzh.md"
rm -rf "$SKILLS_DIR/knowgt" "$SKILLS_DIR/knowgtzh"
mkdir -p "$SKILLS_DIR/knowgt" "$SKILLS_DIR/knowgtzh"
cp "$SRC_DIR/knowgt/SKILL.md" "$SKILLS_DIR/knowgt/SKILL.md"
cp "$SRC_DIR/knowgtzh/SKILL.md" "$SKILLS_DIR/knowgtzh/SKILL.md"
cp -R "$SRC_DIR/knowgt/reference" "$SKILLS_DIR/knowgt/reference"
cp -R "$SRC_DIR/knowgtzh/reference" "$SKILLS_DIR/knowgtzh/reference"

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
