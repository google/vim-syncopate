" Maktaba boilerplate (which also prevents re-entry).
let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

""
" Export syntax-highlighted text to an HTML tab.
command -nargs=0 -range=% HtmlExport <line1>,<line2>call syncopate#HtmlExport()
