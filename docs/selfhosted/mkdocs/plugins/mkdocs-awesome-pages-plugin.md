# mkdocs-awesome-pages-plugin

## Overview
MkDocs has `nav` configuration in mkdocs.yml to set up navigation of the page. If it's not provided, the navigation will be automatically created by all markdown files in the document directory. 

We need to use one, not both. And, the auto create will be sorted alphabetically, which is not flexible. This plugin allows us to have more control. 

## Installation

Install the plugin with pip

``` bash
pip install mkdocs-awesome-pages-plugin
```

Enable the plugin in `mkdocs.yml`

``` yaml title="mkdocs.yml"
plugins:
    - search
    - awesome-pages
```

## Configuration

### Rest 
`...` is a special entry to let MkDocs to add the rest from the folder structure

``` yaml 
nav:
    - introduction.md
    - ...
    - summary.md
```