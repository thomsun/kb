# MkDocs

## Overview
[mkdocs](https://www.mkdocs.org) is static site generator aiming for technical documentation.

## Installation

### Prerequisite 
MkDocs requires python 3 and pip. See installation details [here](https://www.mkdocs.org/user-guide/installation/)

I have python2 installed by default so I install python3 using Homebrew that comes with pip3
``` bash
brew install python3
```
Verify python and pip version
``` bash
$ python3 --version
Python 3.9.2
$ pip3 --version
pip 21.0.1 from /usr/local/lib/python3.9/site-packages/pip (python 3.9)
```

### Installing MkDocs
``` bash
pip3 install mkdocs
```

## Themes and Plugins

### Themes
- [`mkdocs-material`](themes/mkdocs-material) - Material theme for MkDocs

### Plugins
- [`mkdocs-git-revision-date-localized-plugin`](plugins/mkdocs-git-revision-date-localized-plugin) - Plugin to pull and display git update timestamp on the page

## 
## Publishing

### Publish to github pages
[GitHub Pages](https://pages.github.com/) provide documentation hosting for free. There are 2 options - Organization/User site and Project site. 

Organization/User site is to host documentation at <username>.github.io, while Project site is to host documentation at <username>.github.io/<repo>. See [https://pages.github.com/](https://pages.github.com/) for set up details

The easiest way to publish MkDocs website to GitHub Pages in my option is to use [GitHub Action](https://github.com/features/actions).

``` yaml title=".github/workflows/ci.yml"
name: ci # Any name as you like
on:
    push:
    branches:
        - main # Branch to track
jobs:
    deploy:
        runs-on: ubuntu-latest
        steps:
            - uses: actions/checkout@v2
              with:
                  fetch-depth: 0 # To fetch all history to support mkdocs-git-revision-date-localized-plugin
            - uses: actions/setup-python@v2
              with:
                  python-version: 3.x
            # Install mkdocs and any themes/plugin here
            - run: pip install mkdocs
            - run: pip install mkdocs-material
            - run: pip install mkdocs-git-revision-date-localized-plugin
            # Deploy to gh-pages branch
            - run: mkdocs gh-deploy --force
```

`mkdocs gh-deploy` is usting github cli behind the scene. It builds the site and call `ghp-import` to commit to `gh-pages` branch. So it's important to set `pages` setting to use `gh-pages` branch for website. This means the markdown files will be in `main` branch while the compiled html will be published to github pages via `gh-pages` branch.
