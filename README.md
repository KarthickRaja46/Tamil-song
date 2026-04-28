# Tamil MP3 Downloader 🎵

A massive automated downloader for categorized Tamil hit songs! This project uses a PowerShell script and `yt-dlp` to fetch and organize Tamil audio tracks directly from YouTube into ready-to-use folders for your pendrive.

## Features ✨
- **Automated Dependency Handling**: Automatically downloads `yt-dlp.exe` if it's missing.
- **Categorized Downloads**: Downloads top Tamil hits sorted into specific folders:
  - Romantic Hits
  - 90s Evergreen
  - Dance & Kuthu
  - Latest Hits (2024)
  - Sad & Feel Good Songs
  - Ilayaraja Classics
  - AR Rahman Magic
  - Anirudh Vibes
- **High Quality Audio**: Downloads the best available native audio format (`m4a`) directly without needing FFmpeg conversion.
- **Massive Collection**: Configured to grab up to 800 tracks per category.

## How to Run 🚀

1. Clone this repository or download the script.
2. Open PowerShell in the folder where the script is located.
3. If running scripts is disabled on your system, you can bypass the execution policy by running:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\Download-Categorized-Songs.ps1
   ```
4. Sit back and relax! The script will create a `Pendrive_Categorized_Songs` folder and start placing the downloaded audio files into their respective category subfolders.

## Notes ⚠️
- **Time & Data**: Downloading thousands of songs will consume a large amount of bandwidth and storage space. It may take several hours to finish.
- **Git Ignoring**: Downloaded audio files, `yt-dlp.exe`, and the output folder `Pendrive_Categorized_Songs` are ignored via `.gitignore` to prevent filling up the remote repository.