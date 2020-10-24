# Website

Markdown files and static site tools for my website.

## Structure

All content is written in markdown.
Each page or book has its own directory
along with its own navigation structure specified in its `nav.yaml`.
Each directory (including the root) has a landing page.
All markdown files go inside a `markdown` directory.

## `make`

The `make` script converts all markdown files to html files using
[pandoc](https://pandoc.org/)
using `template.html` as a template and `style.css` as the default stylesheet.
It also calls `LinkChecker` to check for bad links.

## YAML

### `nav.yaml`

Root relative pathnames must be used.
`chapter` specifies a list of top-level items to show up in the nav bar.
Each item should have `name`, `href`, and `label` (for CSS class/id names)
set.
Each item may have a secondary `section` list.

Example:
```yaml
---
chapter:
  - name: Chapter 1
    href: /book/chapter1/chapter1.html
    label: ch1
    section:
      - name: Section 1
        href: /book/chapter1/section1.html
        label: ch1s1
  - name: Chapter 2
    href: /book/chapter2/chapter2.html
    label: ch2
    section:
      - name: Section 1
        href: /book/chapter2/section1.html
        label: ch2s1
      - name: Section 2
        href: /book/chapter2/section2.html
        label: ch2s2
  - name: Chapter 3
    href: /book/chapter3/chapter3.html
    label: ch3
---
```

### YAML metadata

Each `.md` files should have a metadata header formatted in YAML.

Example:
```yaml
---
title: Linear Maps
subsection:
  - Definition
  - Theorem 1
  - Theorem 2
  - Summary

previous:
  name: Vector Spaces
  href: ./vector-spaces.html
next:
  name: Inner Product Spaces
  href: ./inner-product-spaces.html
---
```
Relative paths can be used.
`previous` and `next` (optional)
are used for the navigations buttons at the bottom of the page.

## Dependencies

[pandoc](https://github.com/jgm/pandoc/releases)

[LinkChecker](https://linkchecker.github.io/linkchecker/install.html)

## License

All non-software written content is license under the
[Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/)
