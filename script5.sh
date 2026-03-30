#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Aniket Pandey | Reg: 24BSA10012

echo "Answer three questions to generate your manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Compose the manifesto and write it to the output file
echo "================================"  > "$OUTPUT"
echo " My Open Source Manifesto"        >> "$OUTPUT"
echo " Aniket Pandey | 24BSA10012"      >> "$OUTPUT"
echo " Date: $DATE"                     >> "$OUTPUT"
echo "================================" >> "$OUTPUT"
echo ""                                 >> "$OUTPUT"
echo "Every day I use $TOOL — a tool that exists because" >> "$OUTPUT"
echo "someone chose to share their work with the world freely." >> "$OUTPUT"
echo ""                                 >> "$OUTPUT"
echo "To me, freedom means $FREEDOM." >> "$OUTPUT"
echo "That is exactly what open source gives everyone —" >> "$OUTPUT"
echo "the freedom to read, learn, change, and share." >> "$OUTPUT"
echo ""                                 >> "$OUTPUT"
echo "One day I want to build $BUILD and release it openly," >> "$OUTPUT"
echo "so others can learn from it and pass it forward." >> "$OUTPUT"
echo ""                                 >> "$OUTPUT"
echo "Open source is not just a license. It is a way of thinking." >> "$OUTPUT"
echo "================================" >> "$OUTPUT"

echo "Manifesto saved to $OUTPUT"
echo ""
cat "$OUTPUT"