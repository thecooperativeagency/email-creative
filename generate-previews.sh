#!/bin/bash
REPO="thecooperativeagency/email-creative"
BRANCH="refs/heads/main"

find . -name "*.html" -type f | while read -r htmlfile; do
  dir=$(dirname "$htmlfile")
  filename=$(basename "$htmlfile")
  relpath="${htmlfile#./}"
  preview_url="https://htmlpreview.github.io/?https://raw.githubusercontent.com/${REPO}/${BRANCH}/${relpath}"
  
  cat > "${dir}/PREVIEW.md" << PREVIEW
# Email Preview

**[👁️ Open Live Preview](${preview_url})**

Clean HTML file is right next to this one for easy copy-paste into your email tool.
PREVIEW

  echo "Created: ${dir}/PREVIEW.md"
done
