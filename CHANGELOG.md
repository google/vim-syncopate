# Current changes

## Features

- New `'operatorfunc'` function `syncopate#ClipboardOperatorfunc()`, and default mapping `,<`.
  - This lets you do things like `,<ip` to export the current paragraph.
* New `clear_bg` flag lets `:SyncopateExportToClipboard` output transparent backgrounds.

# 0.2.0

*2014-12-08*

## Features

* New `:SyncopateExportToClipboard` command now exports directly to clipboard using `xclip`
  * `<Leader><>` mapping uses this instead of browser export
* `:HtmlExport` renamed to `:SyncopateExportToBrowser` for clarity
* Users can choose browser command with `browser` option (see `:help syncopate:browser`)

## Bugfixes

* Syncopate failed in non-writable directories (#2)
* HTML output was unreadable (yellow-on-white) when `t_Co=8` (#5)
* Better handling of `'background'` option (important for `solarized` colorscheme) (#6)
* Direct-to-clipboard was eliminating users' background colours (#16)

# 0.1.0

*2014-11-19*

## Features

* `:HtmlExport` command exports to a browser tab
* Optional mapping (default: `<Leader><>`) to run `:HtmlExport`
