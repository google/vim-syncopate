# syncopate

(**Syn**)tax (**cop**)y-p(**a**)s(**te**).

## What's it for?

To make sharing beautiful code as frictionless as possible.

Say you have a nicely syntax-highlighted buffer in vim.
This plugin lets you open a browser tab with that buffer's contents, including the highlighting.
If you copy-paste into a webmail window, a Google Doc, etc., the syntax highlighting stays intact.

Best of all, it cleans up after itself: it won't clutter your directories with `.html` files.

## How do I install it?

Depends on your plugin manager.

Note that syncopate is a [maktaba](https://github.com/google/vim-maktaba) plugin, so you will need to install maktaba (if your plugin manager doesn't handle dependencies).
If you want to configure the plugin, we strongly recommend installing [glaive](https://github.com/google/vim-glaive) as well.

Here are instructions for Vundle, the most popular plugin manager.
Add the following lines between your `call vundle#begin()` and `call vundle#end()` lines.

```vim
" Dependency; reqiured for vim-syncopate.
Plugin google/vim-maktaba

" Strongly recommended: easy configuration of maktaba plugins.
Plugin google/vim-glaive

Plugin google/vim-syncopate
```

## How do I use it?

### Use the clipboard directly

Use the `:SyncopateExportToClipboard` command.
It populates the clipboard with the contents of your buffer (or just part of it, if you're in visual mode), including highlighting.
You can then paste your beautiful code into a compose window (such as Gmail).

Of course, it's even better with a keymapping, which you can enable using Glaive:

```vim
" This line needs to go anywhere after 'call vundle#end()'.
call glaive#Install()

" Enable keymappings.
Glaive syncopate plugin[mappings]
```

Suppose your [`<leader>`](http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file) is `,`.
Then you will have a mapping `,<>` which calls `:SyncopateExportToClipboard` for you.
If you want a different mapping, just assign it to `plugin[mappings]` like so:

```vim
Glaive syncopate plugin[mappings]='qwer'
```

Now your mapping will be `qwer`.

### Put it in a browser window

Alternatively, you can use the `:SyncopateExportToBrowser` command.
It opens the HTML in a new browser tab, so you can select regions interactively.
Syncopate automatically cleans up the HTML file after opening the tab.

If you use `:SyncopateExportToBrowser`, be sure to copy with `Ctrl-C` (as opposed to mouse selection/middle-click); otherwise, the highlighting will not be retained.

## How do I configure it?

Use the built-in options for the `:TOhtml` command: `:help 2html.vim`.
(Options are down below, starting at `:help g:html_diff_one_file`.)

For example, the following line will exclude line numbers from the output, even if you use them in vim:

```vim
let g:html_number_lines = 0
```

## So how's this different from plain :TOhtml?

Mainly convenience.
Under the hood, `:SyncopateExportToClipboard` will:

1. Switch to the default `colorscheme` (it shows up better on white backgrounds).
2. Create the HTML version of your vim buffer.
3. Export it to the clipboard.
4. Restore your `colorscheme`, and any other settings it needed to change.

Simply running `:TOhtml` only does the second step.
In particular, the third step is difficult to remember how to do.
Without it, `:TOhtml` usually involves tiresome saving-and-subsequently-deleting of HTML files, and fiddling with a browser.
