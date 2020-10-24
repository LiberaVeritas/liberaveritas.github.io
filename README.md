# Website

Markdown files and static site tools for my website.

## Structure

---

Each page or book has its own directory
along with its own navigation structure specified in its `nav.yaml`.
Each directory (including the root) has a landing page.
All markdown files go inside a `markdown` directory.
The `make` script converts all markdown files to html files using
[pandoc](https://pandoc.org/) using `template.html` as a template.

## Dependencies

---

[pandoc](https://github.com/jgm/pandoc/releases)

[LinkChecker](https://linkchecker.github.io/linkchecker/install.html)

## License

---

All non-software written content is license under the
[Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/)
