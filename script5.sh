#!/bin/bash

echo "========================================================"
echo "         Open Source Manifesto Generator                 "
echo "  Student: Mradula Chouhan | Reg: 24BCE11337            "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source manifesto."
echo ""

read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo "" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "   My Open Source Manifesto" >> "$OUTPUT"
echo "   Generated on: $DATE" >> "$OUTPUT"
echo "   Author: $(whoami)" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $TOOL - a tool that exists because" >> "$OUTPUT"
echo "someone chose to share their work rather than lock it away." >> "$OUTPUT"
echo "That single act of generosity has shaped how I learn, work," >> "$OUTPUT"
echo "and think about software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom in the context of open source means $FREEDOM." >> "$OUTPUT"
echo "It means the freedom to read the code that runs on my machine," >> "$OUTPUT"
echo "to fix what is broken, to learn from what others built, and" >> "$OUTPUT"
echo "to stand on shoulders rather than reinvent every wheel." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I commit to carrying this forward. If I ever build $BUILD," >> "$OUTPUT"
echo "I will share it freely - not because it will make me famous," >> "$OUTPUT"
echo "but because the tools I love were built by people who thought" >> "$OUTPUT"
echo "the same way. Open source is not a license model. It is a" >> "$OUTPUT"
echo "statement that knowledge belongs to everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

echo ""
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "--------------------------------------------------------"
cat "$OUTPUT"
echo "--------------------------------------------------------"
echo ""
echo "  Note: 'alias mymanifesto=\"cat $OUTPUT\"' can be added"
echo "  to ~/.bashrc to quickly view this manifesto anytime."
echo "========================================================"
