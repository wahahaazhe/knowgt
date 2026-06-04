# KnowGT - Know GitHub Trending · Windows 一键安装脚本
# Usage: iwr https://raw.githubusercontent.com/wahahaazhe/KnowGT/main/install.ps1 | iex

Write-Host "📦 正在安装 KnowGT - Know GitHub Trending..." -ForegroundColor Cyan
Write-Host ""

# 确定目标目录
$skillsDir = "$env:USERPROFILE\.claude\skills"

if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

Write-Host "📂 Skills 目录: $skillsDir"
Write-Host ""

# 临时目录
$tmpDir = Join-Path $env:TEMP "KnowGT-install"
if (Test-Path $tmpDir) {
    Remove-Item -Recurse -Force $tmpDir
}
New-Item -ItemType Directory -Path $tmpDir | Out-Null

Write-Host "🔽 正在下载最新版本..." -ForegroundColor Yellow

try {
    git clone --depth 1 https://github.com/wahahaazhe/KnowGT.git "$tmpDir\KnowGT" 2>&1 | Out-Null
} catch {
    Write-Host "❌ 下载失败，请检查网络连接" -ForegroundColor Red
    exit 1
}

# 复制 skills
Copy-Item -Force "$tmpDir\KnowGT\skills\productivity\github-trending-briefing\KnowGT\SKILL.md" "$skillsDir\KnowGT.md"
Copy-Item -Force "$tmpDir\KnowGT\skills\productivity\github-trending-briefing\KnowGTzh\SKILL.md" "$skillsDir\KnowGTzh.md"

# 清理临时目录
Remove-Item -Recurse -Force $tmpDir

Write-Host ""
Write-Host "✅ 安装成功！" -ForegroundColor Green
Write-Host ""
Write-Host "📝 使用方法："
Write-Host "   /KnowGTzh    # 中文简报"
Write-Host "   /KnowGT      # English briefing"
Write-Host ""
Write-Host "   或者直接说：""帮我看看今天 GitHub 趋势"""
Write-Host ""
Write-Host "🔄 重启 Claude Code 后即可使用"
