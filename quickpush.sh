# ----------------------------
# Git Auto Push Script
# ----------------------------

# Set Git identity (only needed first time)
git config --global user.name "csarvind2000"
git config --global user.email "abc@abc.com"

# Initialize repo if not already
git init

# Create .gitkeep in empty folders automatically
Get-ChildItem -Directory | ForEach-Object {
    if (-not (Get-ChildItem $_.FullName)) {
        New-Item "$($_.FullName)\.gitkeep" -ItemType File -Force
    }
}

# Add all files
git add .

# Commit
git commit -m "Initial commit"

# Rename branch to main
git branch -M main

# Add remote (if not exists)
git remote remove origin 2>$null
git remote add origin https://github.com/csarvind2000/GenAI_Learning.git

# Push
git push -u origin main