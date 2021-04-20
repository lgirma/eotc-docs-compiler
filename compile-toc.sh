#!/usr/bin/env bash

IN_FILE="${1:-chapter1.md}"
IN_FILENAME="${IN_FILE%.*}"
REFERENCE_DOCX=""
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEPTH="${2:-2}"

echo '' > "$IN_FILENAME"_toc.md

if test -f Reference.docx; then
    REFERENCE_DOCX=Reference.docx
else
    REFERENCE_DOCX="$SCRIPT_DIR/lib/Reference.docx"
fi

pandoc -s --toc --toc-depth=$DEPTH "$IN_FILE" -t markdown --template="$SCRIPT_DIR/lib/template.toc.md" > "$IN_FILENAME"_toc.md

pandoc --reference-doc="$REFERENCE_DOCX" "$IN_FILENAME"_toc.md -s -o "$IN_FILENAME"_toc.docx