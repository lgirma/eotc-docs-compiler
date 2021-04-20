# EOTC Documents Compiler

This is collection of scripts to help compile texts (mostly related to the Ethiopian Orthodox Tewahedo Church, but not limited to) written in markdown format to docx or pdf using pandoc.

## Simple Compilation

To compile a markdown file to docx:

```
compile.sh myFile.md
```

This will compile the markdown file to `myFile.docx`. For PDF:

```
compile.sh myFile.md pdf
```

## Bibliography and Citations

If your project references couple of books or links, you can create a bibliography file with the name `ref.bib` alongside the markdown document. A sample bibliography:

```
@Book{item1,
    author = "ብፁዕ አቡነ ጎርጎርዮስ",
    title = "የቤተ ክርስቲያን ታሪክ በዓለም መድረክ",
    year = "1978",
    address = "አዲስ አበባ",
    publisher = ""
}

@Book{item2,
    author = "ዲያቆን ያረጋል አበጋዝ",
    title = "መድሎተ ጽድቅ ቅጽ 1",
    year = "2009",
    address = "አዲስ አበባ",
    publisher = ""
}
```

Then, you can reference it in your markdown as:

```
ቤተ ክርስቲያን ረቂቅ የክርስቶስ አካል ናት [^akale_kristos]

[^akale_kristos]: [@item1] - ምዕራፍ 1
```

This will output something like:

```
ቤተ ክርስቲያን ረቂቅ የክርስቶስ አካል ናት [1]

[1] መድሎተ ጽድቅ ቅጽ 1 - ምዕራፍ 1
```

A bibliography list (ዋቢ መጻሕፍት) is automatically generated at the end of your document.

## Template Word Document

The reference Word document to help format the output is found in `lib/Reference.docx`. If you want to modify it, copy that document to your project's directory and modify it without changing its name.

## Template For PDF

The reference TEX document (in LaTeX language) to help format the PDF output is found in `lib/template.tex`. If you want to modify it, copy that document to your project's directory and modify it without changing its name.

## Pandoc Options

If you want your own pandoc options, save the options in `docx.config.sh` or `pdf.config.sh` files for docx or PDF respectively. A sample docx config:

**pdf.config.sh**

```
--number-sections
```

## Fonts

By default the script generates documents with `Abyssinica SIL` as the main font and `Ebrima` (found in Windows 10) as a quotation font.

For docx documents you can simply update styles in `Reference.docx` file as you wish.

But for PDF documents, you can change these using the pandoc options in `pdf.config.sh` file:

```
-V 'mainfont:Abyssinica SIL' -V 'quotefont:Ebrima' -V 'monofont:Ebrima'
```