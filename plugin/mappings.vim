" Maktaba boilerplate (which also prevents re-entry).
let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif


""
" Export syntax-highlighted text as HTML, using the current syncopate settings.
let s:prefix = s:plugin.MapPrefix('<>')
" nnoremap, followed by ounmap, makes the mapping valid in normal and visual
" modes.
execute 'nnoremap <unique> <silent>' s:prefix ':HtmlExport<CR>'
execute 'ounmap' s:prefix
