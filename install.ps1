# GitHub Trending Briefing Skills - Windows 一键安装脚本
# Usage: iwr https://raw.githubusercontent.com/YOUR_USERNAME/githubvisual/master/install.ps1 | iex

Write-Host "📦 正在安装 GitHub Trending Briefing Skills..." -ForegroundColor Cyan
Write-Host ""

# 确定目标目录
$skillsDir = "$env:USERPROFILE\.claude\skills"

if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

Write-Host "📂 Skills 目录: $skillsDir"
Write-Host ""

# 临时目录
$tmpDir = Join-Path $env:TEMP "githubvisual-install"
if (Test-Path $tmpDir) {
    Remove-Item -Recurse -Force $tmpDir
}
New-Item -ItemType Directory -Path $tmpDir | Out-Null

Write-Host "🔽 正在下载最新版本..." -ForegroundColor Yellow

try {
    git clone --depth 1 https://github.com/wahahaazhe/githubvisual.git "$tmpDir\githubvisual" 2>&1 | Out-Null
} catch {
    Write-Host "❌ 下载失败，请检查网络连接" -ForegroundColor Red
    exit 1
}

# 复制 skills
Copy-Item -Recurse -Force "$tmpDir\githubvisual\skills\productivity\github-trending-briefing\gettrending" "$skillsDir\"
Copy-Item -Recurse -Force "$tmpDir\githubvisual\skills\productivity\github-trending-briefing\gettrendingzh" "$skillsDir\"

# 清理临时目录
Remove-Item -Recurse -Force $tmpDir

Write-Host ""
Write-Host "✅ 安装成功！" -ForegroundColor Green
Write-Host ""
Write-Host "📝 使用方法："
Write-Host "   /gettrending      - 英文简报"
Write-Host "   /gettrendingzh    - 中文简报"
Write-Host ""
Write-Host "🔄 重启 Claude Code 后即可使用"
