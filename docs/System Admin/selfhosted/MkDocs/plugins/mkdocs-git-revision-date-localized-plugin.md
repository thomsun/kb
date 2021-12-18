# mkdocs-git-revision-date-localized-plugin

## Overview
[`mkdocs-git-revision-date-localized-plugin`](https://github.com/timvink/mkdocs-git-revision-date-localized-plugin) is MkDocs plugin to add a last updated date to MkDocs pages. This is a fork of [`mkdocs-git-revision-date-plugin`](https://github.com/zhaoterryy/mkdocs-git-revision-date-plugin)

See the doc at [https://timvink.github.io/mkdocs-git-revision-date-localized-plugin/](https://timvink.github.io/mkdocs-git-revision-date-localized-plugin/)

## Installation

### Installing plugin
``` bash
pip install mkdocs-git-revision-date-localized-plugin
```

### Configuring MkDocs

``` yaml title="mkdocs.yml"
plugins:
  - search
  - git-revision-date-localized
```

### Optional

#### Configuring github action

``` yaml title=".github/workflows/ci.yaml"
- uses: actions/checkout@v2
  with:
    fetch-depth: 0
```

## Usage

With support theme like [`mkdocs-material`](https://github.com/squidfunk/mkdocs-material), the last update value will be displayed at the end of the page automatically.

Page can add creation time or last update time using variables `git_creation_date_localized` and `git_revision_date_localized`

Custom create date = {{ git_creation_date_localized }}
Custom update date = {{ git_revision_date_localized }}

### Configuration

See plugin's option [page](https://timvink.github.io/mkdocs-git-revision-date-localized-plugin/options/) for details

``` yaml title="mkdocs.yml"
plugins:
  - git-revision-date-localized:
      type: timeago
      timezone: Europe/Amsterdam
      locale: en
      fallback_to_build_date: false
      enable_creation_date: true
      exclude:
          - index.md
      enabled: true
```