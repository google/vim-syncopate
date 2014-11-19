let s:plugin = maktaba#plugin#Get('syncopate')


""
" Export syntax-highlighted content to a new browser tab.
function! syncopate#HtmlExport() range
  " Save the old colorscheme and set it to 'default'.
  " This results in more readable text.
  let l:old_colorscheme = get(g:, 'colors_name', 'default')
  colorscheme default

  " Generate the HTML and save the file.
  execute a:firstline . ',' . a:lastline 'TOhtml'
  w

  " Open the HTML file in a browser.
  let l:html_file = @%
  call system(printf("sensible-browser '%s'", l:html_file))

  " Kill the HTML file.
  bwipeout
  call system(printf("rm '%s'", l:html_file))

  " Restore the original colorscheme.
  execute 'colorscheme' l:old_colorscheme
endfunction
