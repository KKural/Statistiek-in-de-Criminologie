# PowerShell script to restructure all chapters 3-12
$baseDir = "C:\Users\kukumar\OneDrive - UGent\My Projects\Dodona\Statistiek-in-de-Criminologie"

# Define chapters to process
$chapters = @(
    "Hoofdstuk_3_De univariate beschrijvende statistiek",
    "Hoofdstuk_4_Een inleiding in kansrekeren", 
    "Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen",
    "Hoofdstuk_6_Inleiding tot de bivariate beschrijvende statistiek",
    "Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen",
    "Hoofdstuk_8_Correlatie- en regressieanalyse",
    "Hoofdstuk_9_Inferentiële statistiek en variantieanalyse",
    "Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek",
    "Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen",
    "Hoofdstuk_12_Complexere relaties tussen variabelen"
)

foreach ($chapter in $chapters) {
    $chapterNum = ($chapter -split "_")[1].Replace("Hoofdstuk", "")
    $chapterPath = Join-Path $baseDir $chapter
    
    if (Test-Path $chapterPath) {
        Write-Host "Processing Chapter $chapterNum..."
        Set-Location $chapterPath
        
        # Update config files to have simple "Oef - X.Y" format
        $configFiles = Get-ChildItem -Path "Oef - $chapterNum.*" -Recurse -Name "config.json"
        foreach ($configFile in $configFiles) {
            $folderName = Split-Path (Split-Path $configFile -Parent) -Leaf
            if ($folderName -match "Oef - (\d+)\.(\d+)") {
                $newTitle = "Oef - $($matches[1]).$($matches[2])"
                $content = Get-Content $configFile -Raw
                $content = $content -replace '"nl":\s*"[^"]*"', "`"nl`": `"$newTitle`""
                Set-Content $configFile $content
                Write-Host "Updated config for $folderName"
            }
        }
    }
}

Write-Host "All chapters processed!"