# Download-Categorized-Songs.ps1

Write-Host "Starting the massive download of Categorized Tamil Hits..." -ForegroundColor Cyan

# 1. Ensure yt-dlp is available
if (!(Test-Path "yt-dlp.exe")) {
    Write-Host "Downloading yt-dlp.exe..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -OutFile "yt-dlp.exe"
}

# 2. Define our target folder and categories
$BaseFolder = "Pendrive_Categorized_Songs"
if (!(Test-Path $BaseFolder)) { New-Item -ItemType Directory -Path $BaseFolder | Out-Null }

$Categories = @{
    "Romantic_Hits" = "ytsearch800:tamil romantic hit songs audio"
    "90s_Evergreen" = "ytsearch800:tamil 90s hit songs audio"
    "Dance_Kuthu" = "ytsearch800:tamil kuthu dance hit songs audio"
    "Latest_Hits_2024" = "ytsearch800:tamil latest hit songs 2024 audio"
    "Sad_Songs_Feel_Good" = "ytsearch800:tamil sad hit songs feel good audio"
    "Ilayaraja_Classics" = "ytsearch800:tamil ilayaraja hit songs audio"
    "AR_Rahman_Magic" = "ytsearch800:tamil ar rahman hit songs audio"
    "Anirudh_Vibes" = "ytsearch800:tamil anirudh hit songs audio"
}

# 3. Download individual songs into category subfolders
foreach ($Cat in $Categories.GetEnumerator()) {
    $CategoryName = $Cat.Name
    $SearchQuery = $Cat.Value
    $CategoryFolder = Join-Path $BaseFolder $CategoryName

    if (!(Test-Path $CategoryFolder)) { New-Item -ItemType Directory -Path $CategoryFolder | Out-Null }

    Write-Host "=> Downloading $CategoryName (This might take a while)..." -ForegroundColor Green
    
    # We use bestaudio[ext=m4a] to quickly grab the native audio without needing ffmpeg.
    # It will save files nicely as "Song Title.m4a"
    $OutputPath = Join-Path $CategoryFolder "%(title)s.%(ext)s"
    
    # Run yt-dlp
    .\yt-dlp.exe -f "bestaudio[ext=m4a]" --no-playlist -o $OutputPath $SearchQuery
}

Write-Host "All downloads finished! Copy the '$BaseFolder' folder to your pendrive." -ForegroundColor Cyan
