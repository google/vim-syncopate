# syncopate

**Syn**tax **cop**y-**pa**s**te**.

## What's it for?

To make sharing beautiful code as frictionless as possible.

Say you have a nicely syntax-highlighted buffer in vim.
This plugin lets you open a browser tab with that buffer's contents, including the highlighting.
If you copy-paste into a Gmail window, a Google Doc, Google Groups, etc., the syntax highlighting stays intact.

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

Use the `:HtmlExport` command.
It opens up a new browser tab with the contents of your buffer (or just part of it, if you're in visual mode).
You can then copy (with `Ctrl-C`, _not_ just by selection) and paste your beautiful code into a compose window (such as Gmail).

Of course, it's even better with a keymapping, which you can enable using Glaive:

```vim
" This line needs to go anywhere after 'call vundle#end()'.
call glaive#Install()

" Enable keymappings.
Glaive syncopate plugin[mappings]
```

Suppose your [`<leader>`](http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file) is `,`.
Then you will have a mapping `,<>` which calls `:HtmlExport` for you.
If you want a different mapping, just assign it to `plugin[mappings]` like so:

```vim
Glaive syncopate plugin[mappings]='qwer'
```

Now your mapping will be `qwer`.

## How do I configure it?

Use the built-in options for the `:TOhtml` command: `:help 2html.vim`.
(Options are down below, starting at `:help g:html_diff_one_file`.)

For example, the following line will exclude line numbers from the output, even if you use them in vim:

```vim
let g:html_number_lines = 0
```

## So how's this different from plain :TOhtml?

Mainly convenience.
Under the hood, `:HtmlExport` will:

1. Switch to the default `colorscheme` (it shows up better on white backgrounds).
2. Create the HTML version of your vim buffer.
3. Save the file.
4. Open it in a browser window.
5. Delete the html file and buffer.
6. Switch back to your original `colorscheme`.

Simply running `:TOhtml` only does the second step.
