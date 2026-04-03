# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview
This is a GitHub Pages personal website serving as a resume/portfolio site, hosted at brentrockwood.com. The site is static HTML with embedded CSS and uses Jekyll's minimal theme via `_config.yml`.

## Architecture
- **Static HTML Resume**: `index.html` contains the complete resume with embedded CSS styling using SF Pro font family
- **Jekyll Theme**: Configured to use `jekyll-theme-minimal` in `_config.yml`
- **Custom Domain**: `CNAME` file points to brentrockwood.com
- **Assets**: `dog.png` logo image, plus `index.docx` and `index.pdf` versions of resume

## Deployment
The site auto-deploys to GitHub Pages via `.github/workflows/static.yml`:
- Triggers on pushes to `master` branch
- Can be manually triggered via GitHub Actions UI
- Deploys the entire repository root as static content
- No build step required - pure static HTML deployment

## Making Changes
When editing `index.html`:
- Maintain the embedded `<style>` block structure
- Keep SF Pro font references intact (sf, sf+bold, sf-light)
- Preserve `@media print` styling for PDF export compatibility
- Use semantic HTML sections with `page-break-inside: avoid` for print layout
- Changes to master branch automatically deploy to production

## Testing Locally
Since this is static HTML:
```bash
# Option 1: Simple HTTP server
python3 -m http.server 8000

# Option 2: If Jekyll is installed
bundle exec jekyll serve
```

Then visit http://localhost:8000 or http://localhost:4000

## Branch Strategy
- `master` is the production branch
- All commits to master trigger immediate deployment to GitHub Pages
