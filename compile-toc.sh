#!/usr/bin/env bash

echo '' > out/toc.md
pandoc -s --toc --toc-depth=2 ./chapter1.md -t markdown --template=lib/template.toc.md > out/toc.md
pandoc -s --toc --toc-depth=2 ./chapter2.md -t markdown --template=lib/template.toc.md >> out/toc.md
pandoc -s --toc --toc-depth=2 ./chapter3.md -t markdown --template=lib/template.toc.md >> out/toc.md

pandoc --reference-doc=lib/Reference.docx out/toc.md -s -o out/toc.docx