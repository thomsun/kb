# mkdocs-material

## Overview
Material for MkDocs (mkdocs-material) is a theme for MkDocs.

## Installation

Install theme via pip
``` bash
pip install mkdocs-material
```
## Configuration

### Syntax Highlighting
MkDocs provides 2 ways to set up syntax highlighting - during building using Pygments or during runtime using JavaScript.

Here is how to set up with Pygments i.e. build time highlighting.

See reference for code blocks [here](https://squidfunk.github.io/mkdocs-material/reference/code-blocks)

``` yaml title="mkdocs.yml"
markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
```