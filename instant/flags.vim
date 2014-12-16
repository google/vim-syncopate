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


""
" @section Introduction, intro
" @order intro standard-config config commands functions
" Syncopate makes it very easy to share beautiful code in webmail windows,
" Google Docs, etc.
"
" Use the @command(SyncopateExportToBrowser) command to open a new browser tab
" with your buffer's contents, syntax highlighting and all.  (If you're in
" |visual-mode|, only the selected text will be exported.)  Then you can
" copy-paste from the browser tab into your intended destination.
"
" Use a keymapping for even more convenience (see @flag(plugin[mappings])).
" The default mapping is "<Leader><>".  So if your |<Leader>| is set to ",",
" then the mapping ",<>" will run @command(SyncopateExportToBrowser) for you.
" (Mnemonic: "<>" is reminiscent of HTML tags, and it triggers HTML output.)
"
" Syncopate will automatically switch to the default colorscheme before output,
" since this tends to show up better (and be less error-prone!) on white
" backgrounds.  You can change this behaviour with the @flag(change_colorscheme)
" and @flag(colorscheme) settings.  In any case, Syncopate restores your
" original colorscheme once it's finished.

""
" @section Configuring with standard settings, standard-config
" Syncopate is based on the built-in |convert-to-HTML| functionality, which
" already has a wealth of configurable settings.  We try to use these settings
" wherever possible.  (For additional, Syncopate-specific settings, see
" @section(config).)
"
" For example: many people who use line numbers in vim do not want them in the
" HTML output, since they would show up when recipients copy-paste the code into
" an editor window.  By default, HTML output includes line numbers whenever vim
" does.  To force them not to appear, use the @setting(html_number_lines)
" setting: add >
"   let g:html_number_lines = 0
" < to your vimrc.
"
" To browse all available settings, go to the first one
" (@setting(html_diff_one_file)) and scroll down from there.

" Maktaba boilerplate (which also prevents re-entry).
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


""
" The browser command which @command(SyncopateExportToBrowser) will use.
"
" The default, "sensible-browser", only works on Debian-based systems (including
" Ubuntu).  It can be configured by the "update-alternatives" command.  If you
" don't want to do this (or if you're not using a Debian-based system), you will
" need to set this flag for the browser export to work.
call s:plugin.Flag('browser', 'sensible-browser')


""
" Controls whether @command(SyncopateExportToClipboard) will clear the
" background colour.
"
" This can be useful for copy-pasting into a destination (e.g., some talk
" slides) whose background colour might be slightly different than the
" background in the editor.
call s:plugin.Flag('clear_bg', 0)
