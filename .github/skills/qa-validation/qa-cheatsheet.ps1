#!/usr/bin/env powershell
<#
.SYNOPSIS
    FHIR IG QA & Validation Quick Commands Cheat Sheet
    
.DESCRIPTION
    Common commands for analyzing QA reports in the LACPASS IG project.
    Copy and paste into PowerShell or run directly.

.EXAMPLE
    .\qa-cheatsheet.ps1
    Shows all available commands and examples
#>

Write-Host "╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  FHIR IG QA & Validation - Quick Reference                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host "`n1️⃣  QUICK STATUS (One-liner)" -ForegroundColor Yellow
Write-Host @"
cd d:\24.IG_RACSEL
(Get-Content output\qa.txt | Select-Object -First 3)

Expected: "err = X, warn = Y, info = Z"
"@

Write-Host "`n2️⃣  COUNT ERRORS vs WARNINGS" -ForegroundColor Yellow
Write-Host @"
(Get-Content output\qa.txt) -match 'err|warn|info' | Select-Object -First 1

# Or detailed:
[regex]::Matches((Get-Content output\qa.txt), '(err|warn|info) = (\d+)') | 
  ForEach-Object { Write-Host "$($_.Groups[1].Value) = $($_.Groups[2].Value)" }
"@

Write-Host "`n3️⃣  LIST TOP PROBLEMS (by frequency)" -ForegroundColor Yellow
Write-Host @"
(Get-Content output\qa.txt | Select-String "^WARNING|^ERROR") | 
  ForEach-Object { $_ -replace '^[A-Z]+: ', '' -replace ':.*', '' } | 
  Group-Object | Sort-Object Count -Descending | 
  Select-Object Count, @{N='Problem';E={$_.Name}} | 
  Format-Table -AutoSize
"@

Write-Host "`n4️⃣  FIND SPECIFIC PROBLEM" -ForegroundColor Yellow
Write-Host @"
# Find all canonical link warnings:
Select-String -Path output\qa.txt -Pattern "canonical.*unsafe"

# Find all duplicate anchor IDs:
Select-String -Path output\qa.txt -Pattern "duplicate anchor"

# Find version mismatches:
Select-String -Path output\qa.txt -Pattern "version.*mismatch|not.*valid.*version"
"@

Write-Host "`n5️⃣  EXTRACT UNIQUE ERROR TYPES" -ForegroundColor Yellow
Write-Host @"
(Get-Content output\qa.txt | Select-String "^ERROR|^WARNING") | 
  ForEach-Object { $_ -replace '^[A-Z]+: ', '' } | 
  Select-Object -Unique | 
  Sort-Object
"@

Write-Host "`n6️⃣  QUICK SUMMARY TABLE" -ForegroundColor Yellow
Write-Host @"
# Show problem count by file:
(Get-Content output\qa.txt | Select-String "^.+:") | 
  ForEach-Object { $_ -replace ':.*', '' } | 
  Group-Object | Sort-Object Count -Descending | 
  Select-Object Count, Name | 
  Format-Table -AutoSize | 
  head -20
"@

Write-Host "`n7️⃣  CHECK WHEN IT WAS BUILT" -ForegroundColor Yellow
Write-Host @"
Get-Item output\qa.txt | Select-Object LastWriteTime

# Compare age of different QA reports:
Get-Item output\qa.* | Select-Object Name, LastWriteTime
"@

Write-Host "`n8️⃣  VALIDATE JSON EXAMPLES" -ForegroundColor Yellow
Write-Host @"
# Check for invalid OID format in examples:
Select-String -Path "fsh-generated\resources\*.json" -Pattern "urn:oid\." | 
  ForEach-Object { Write-Host $_.Path : $_.Line -ForegroundColor Red }

# Fix format (urn:oid:2.16.X instead of urn:oid.2.16.X):
Get-Content fsh-generated\resources\Patient-*.json | 
  Select-String "urn:oid\."
"@

Write-Host "`n9️⃣  OPEN QA REPORTS" -ForegroundColor Yellow
Write-Host @"
# View text version (readable):
notepad output\qa.txt

# Or pipe to less (if available):
(Get-Content output\qa.txt) -join "`n" | less

# View JSON version (structured):
code output\qa.json

# View HTML dashboard:
start output\qa.html
"@

Write-Host "`n🔟  REGENERATE IG + QA IN ONE GO" -ForegroundColor Yellow
Write-Host @"
# Windows batch script:
.\\_genonce.bat

# Then immediately check status:
&{ (Get-Content output\qa.txt)[0..5] }
"@

Write-Host "`n📋 NEXT STEPS" -ForegroundColor Green
Write-Host @"
Once you've analyzed the QA report:

1. Copy findings into .github/qa-decisions.md
2. Categorize each problem: ARREGLAR / IGNORAR / POSPONER
3. For ARREGLAR: create issues and assign priorities
4. Document your decisions with timestamps
5. Track fixes in the Status column

Example entry:
| Problema | Tipo | Severidad | Decisión | Status |
|----------|------|-----------|----------|---------|
| OID format | URLs | CRÍTICA | ARREGLAR | ⏳ TODO |
"@

Write-Host "`n💡 PRO TIPS" -ForegroundColor Magenta
Write-Host @"
• Run QA check after major changes: .\\_genonce.bat
• Keep qa-decisions.md updated for audit trail
• Use 'IGNORAR + justificación' for warnings you won't fix
• Review deprecated dependencies quarterly
• Set warning limit (e.g., max 50 warnings) as quality gate
"@

Write-Host "`n" -ForegroundColor Green
Write-Host "📖 Full Guide: .github/skills/qa-validation/SKILL.md" -ForegroundColor Cyan
Write-Host "📝 Decisions: .github/qa-decisions.md" -ForegroundColor Cyan
Write-Host "🎯 Examples: .github/skills/qa-validation/EXAMPLES.md" -ForegroundColor Cyan

