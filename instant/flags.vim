let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif


""
" Use a different colorscheme for the HTML output.  This can make the text more
" readable.
call s:plugin.Flag('change_colorscheme', 1)


""
" The colorscheme to switch to for the HTML output.  The default is "default",
" since it shows up nicely on a white background (as in most webmail windows).
"
" This setting has no effect if @flag(change_colorscheme) is false.
call s:plugin.Flag('colorscheme', 'default')
