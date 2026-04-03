#!/usr/bin/env bash
set -euo pipefail

INPUT=$1
BASENAME=$(basename "$INPUT" .md)

OUTDIR="dist/$BASENAME"
mkdir -p "$OUTDIR"

echo "Building $INPUT → $OUTDIR"

# HTML
pandoc "$INPUT" \
  -o "$OUTDIR/$BASENAME.html" \
  --standalone \
  --template=template/html.pandoc \
  --variable pagetitle="Brent Rockwood - CV"

# PDF (LaTeX)
pandoc "$INPUT" \
  -o "$OUTDIR/$BASENAME.pdf" \
  --pdf-engine=pdflatex \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V linkcolor=blue

# DOCX
pandoc "$INPUT" \
  -o "$OUTDIR/$BASENAME.docx"

rm -f ./index.html
rm -f ./BrentRockwood-CV.pdf
rm -f ./BrentRockwood-CV.docx

ln -s $OUTDIR/$BASENAME.html ./index.html
ln -s $OUTDIR/$BASENAME.pdf ./BrentRockwood-CV.pdf
ln -s $OUTDIR/$BASENAME.docx ./BrentRockwood-CV.docx

echo "Done: $OUTDIR"
