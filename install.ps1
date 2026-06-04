# KnowGT - Know GitHub Trending Windows installer
# Usage: irm https://raw.githubusercontent.com/wahahaazhe/KnowGT/master/install.ps1 | iex

Write-Host "Installing KnowGT - Know GitHub Trending..." -ForegroundColor Cyan
Write-Host ""

# Resolve target directory
$skillsDir = "$env:USERPROFILE\.claude\skills"

if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

Write-Host "Skills directory: $skillsDir"
Write-Host ""

# Temporary directory
$tmpDir = Join-Path $env:TEMP "KnowGT-install"
if (Test-Path $tmpDir) {
    Remove-Item -Recurse -Force $tmpDir
}
New-Item -ItemType Directory -Path $tmpDir | Out-Null

Write-Host "Downloading latest version..." -ForegroundColor Yellow

try {
    git clone --depth 1 --branch master https://github.com/wahahaazhe/KnowGT.git "$tmpDir\KnowGT" 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw "git clone failed"
    }
} catch {
    Write-Host "Download failed. Please check your network connection." -ForegroundColor Red
    exit 1
}

# Copy skills and keep reference template assets
$srcDir = "$tmpDir\KnowGT\skills\productivity\github-trending-briefing"
$knowgtDir = Join-Path $skillsDir "knowgt"
$knowgtzhDir = Join-Path $skillsDir "knowgtzh"
$legacySkillFiles = @("KnowGT.md", "KnowGTzh.md", "knowgt.md", "knowgtzh.md")
foreach ($legacyFile in $legacySkillFiles) {
    $legacyPath = Join-Path $skillsDir $legacyFile
    if (Test-Path $legacyPath) {
        Remove-Item -Force $legacyPath
    }
}
if (Test-Path $knowgtDir) {
    Remove-Item -Recurse -Force $knowgtDir
}
if (Test-Path $knowgtzhDir) {
    Remove-Item -Recurse -Force $knowgtzhDir
}
New-Item -ItemType Directory -Path $knowgtDir -Force | Out-Null
New-Item -ItemType Directory -Path $knowgtzhDir -Force | Out-Null
Copy-Item -Force "$srcDir\knowgt\SKILL.md" "$knowgtDir\SKILL.md"
Copy-Item -Force "$srcDir\knowgtzh\SKILL.md" "$knowgtzhDir\SKILL.md"
Copy-Item -Recurse -Force "$srcDir\knowgt\reference" "$knowgtDir\reference"
Copy-Item -Recurse -Force "$srcDir\knowgtzh\reference" "$knowgtzhDir\reference"

# Clean temporary directory
Remove-Item -Recurse -Force $tmpDir

Write-Host ""
Write-Host "Install complete." -ForegroundColor Green
Write-Host ""
Write-Host "Usage:"
Write-Host "   /knowgtzh    # Chinese briefing"
Write-Host "   /knowgt      # English briefing"
Write-Host ""
Write-Host '   Or ask: "Show me today GitHub trends"'
Write-Host ""
Write-Host "Restart Claude Code before use."
