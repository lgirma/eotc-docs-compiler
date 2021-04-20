#!/usr/bin/env bash

IN_FILE="${1:-chapter1.md}"
IN_FILENAME="${IN_FILE%.*}"
FORMAT="${2:-docx}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BIBLO=""
REFERENCE_DOCX=""
REFERENCE_TEX=""
DOCX_CONFIG=""
PDF_CONFIG=""

if test -f ref.bib; then
    BIBLO="--bibliography=ref.bib"
fi

if test -f docx.config.sh; then
    DOCX_CONFIG=$(<docx.config.sh)
else
    DOCX_CONFIG=$(<"$SCRIPT_DIR/docx.config.sh")
fi

if test -f pdf.config.sh; then
    PDF_CONFIG=$(<pdf.config.sh)
else
    PDF_CONFIG=$(<"$SCRIPT_DIR/pdf.config.sh")
fi

if test -f Reference.docx; then
    REFERENCE_DOCX=Reference.docx
else
    REFERENCE_DOCX="$SCRIPT_DIR/lib/Reference.docx"
fi

if test -f template.tex; then
    REFERENCE_TEX=template.tex
else
    REFERENCE_TEX="$SCRIPT_DIR/lib/template.tex"
fi

if [ "$FORMAT" = "docx" ]; then

    pandoc "$IN_FILE" \
      $BIBLO \
      --reference-doc="$REFERENCE_DOCX" \
      --csl "$SCRIPT_DIR/lib/citestyle.csl" \
      $DOCX_CONFIG \
      -s -o "$IN_FILENAME.docx"

elif [ "$FORMAT" = "pdf" ]; then

    pandoc --pdf-engine=xelatex \
      $BIBLO \
      --citeproc \
      --csl "$SCRIPT_DIR/lib/citestyle.csl" \
      -V 'mainfont:Abyssinica SIL' \
      -V 'quotefont:Ebrima' \
      -V 'monofont:Ebrima' \
      -V 'geometry:margin=1in' \
      --template="$REFERENCE_TEX" \
      "$IN_FILE" \
      $PDF_CONFIG \
      -s -o "$IN_FILENAME.pdf"

else
    echo "ERROR: Format '$FORMAT' not supported."
    exit 1
fi