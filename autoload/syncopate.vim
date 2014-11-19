" Copyright 2014 Google Inc. All rights reserved.
" 
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
" 
"     http://www.apache.org/licenses/LICENSE-2.0
" 
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

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
