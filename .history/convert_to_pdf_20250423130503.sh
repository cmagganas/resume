#!/bin/bash

# Check if Pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "Pandoc could not be found. Please install Pandoc to use this script."
    exit
fi

# Check if a LaTeX distribution is installed
if ! command -v xelatex &> /dev/null
then
    echo "A LaTeX distribution with XeLaTeX could not be found. Please install a LaTeX distribution to use this script."
    exit
fi

# Define the input and output files
INPUT_FILE="./README.md"
OUTPUT_FILE="./Christos_Magganas_Resume.pdf"

# Convert the markdown file to PDF using XeLaTeX with a different font
pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --pdf-engine=xelatex --variable mainfont="Arial"

# Check if the PDF was created successfully
if [ -f "$OUTPUT_FILE" ]; then
    echo "PDF created successfully: $OUTPUT_FILE"
else
    echo "Failed to create PDF."
fi