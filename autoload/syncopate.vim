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
"
" @throws WrongType if @flag(colorscheme) or @flag(change_colorscheme) are
" misconfigured.
function! syncopate#ExportToBrowser() range
  " Choose a more readable colorscheme for the HTML output, if desired.
  let l:change_colorscheme = maktaba#ensure#IsBool(
      \ s:plugin.Flag('change_colorscheme'))
  if l:change_colorscheme
    let l:old_colorscheme = get(g:, 'colors_name', 'default')
    let l:colorscheme = maktaba#ensure#IsString(s:plugin.Flag('colorscheme'))
    execute 'colorscheme' l:colorscheme
  endif

  " Generate the HTML.
  execute a:firstline . ',' . a:lastline 'TOhtml'

  " Try to save the HTML to a file and open it in the browser.
  let l:html_file = tempname()
  try
    execute 'saveas!' l:html_file
    call system(printf("sensible-browser '%s'", l:html_file))
  catch /E212/
    call maktaba#error#Warn('Could not write to "%s"', l:html_file)
    let l:could_not_write = 1
  endtry

  " Kill the HTML buffer (and file, if necessary).
  bwipeout!
  if get(l:, 'could_not_write', 0) == 0
    call system(printf("rm '%s'", l:html_file))
  endif

  " Restore the original colorscheme, if necessary.
  if l:change_colorscheme
    execute 'colorscheme' l:old_colorscheme
  endif
endfunction
