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

" Maktaba boilerplate (which also prevents re-entry).
let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif


""
" Export syntax-highlighted text, in HTML format, to a browser tab.
command -nargs=0 -range=% SyncopateExportToBrowser
    \ <line1>,<line2>call syncopate#ExportToBrowser()


""
" Export syntax-highlighted text, in HTML format, to the clipboard.
" Requires xclip to be installed on your system.
command -nargs=0 -range=% SyncopateExportToClipboard
    \ <line1>,<line2>call syncopate#ExportToClipboard()
