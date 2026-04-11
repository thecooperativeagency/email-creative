#!/bin/bash
REPO="thecooperativeagency/email-creative"
BRANCH="refs/heads/main"

find . -name "*.html" -type f | while read -r htmlfile; do
  dir=$(dirname "$htmlfile")
  filename=$(basename "$htmlfile")
  relpath="${htmlfile#./}"
  # URL encode spaces and special chars
  encoded_path=$(echo "$relpath" | sed 's/ /%20/g')
  preview_url="https://htmlpreview.github.io/?https://raw.githubusercontent.com/${REPO}/${BRANCH}/${encoded_path}"
  
  cat > "${dir}/PREVIEW.md" << PREVIEW
# Email Preview

**[👁️ Open Live Preview](${preview_url})**

Clean HTML file is right next to this one for easy copy-paste into your email tool.
PREVIEW

  echo "Updated: ${dir}/PREVIEW.md"
done

echo "All PREVIEW.md files regenerated with proper URL encoding."
