" -----------------------------------------------------------------------------
" File: gruvpink.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvpink
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvpink'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvpink_bold')
  let g:gruvpink_bold=1
endif
if !exists('g:gruvpink_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvpink_italic=1
  else
    let g:gruvpink_italic=0
  endif
endif
if !exists('g:gruvpink_undercurl')
  let g:gruvpink_undercurl=1
endif
if !exists('g:gruvpink_underline')
  let g:gruvpink_underline=1
endif
if !exists('g:gruvpink_inverse')
  let g:gruvpink_inverse=1
endif

if !exists('g:gruvpink_guisp_fallback') || index(['fg', 'bg'], g:gruvpink_guisp_fallback) == -1
  let g:gruvpink_guisp_fallback='NONE'
endif

if !exists('g:gruvpink_improved_strings')
  let g:gruvpink_improved_strings=0
endif

if !exists('g:gruvpink_improved_warnings')
  let g:gruvpink_improved_warnings=0
endif

if !exists('g:gruvpink_termcolors')
  let g:gruvpink_termcolors=256
endif

if !exists('g:gruvpink_invert_indent_guides')
  let g:gruvpink_invert_indent_guides=0
endif

if exists('g:gruvpink_contrast')
  echo 'g:gruvpink_contrast is deprecated; use g:gruvpink_contrast_light and g:gruvpink_contrast_dark instead'
endif

if !exists('g:gruvpink_contrast_dark')
  let g:gruvpink_contrast_dark='medium'
endif

if !exists('g:gruvpink_contrast_light')
  let g:gruvpink_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#180a18', 235]     " 40-40-40                  ok
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#251029', 237]     " 60-56-54                  ok
let s:gb.dark2       = ['#3d203d', 239]     " 80-73-69                  ok
let s:gb.dark3       = ['#af76af', 241]     " 102-92-84                 ok
let s:gb.dark4       = ['#402845', 243]     " 124-111-100               ok ?
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#a895a0', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#e9def6', 230]     " 249-245-215
let s:gb.light0      = ['#dfcdf3', 229]     " 253-244-193
let s:gb.light0_soft = ['#f9e5cc', 228]     " 242-229-188
let s:gb.light1      = ['#f9e5fa', 223]     " 235-219-178               ok
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a88994', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#cf4383', 167]     " 251-73-52              ok
let s:gb.bright_green   = ['#b7e58c', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fdc09b', 214]     " 250-189-47             ok
let s:gb.bright_blue    = ['#307cb1', 109]     " 131-165-152
let s:gb.bright_purple  = ['#f060d8', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#aacdff', 108]     " 142-192-124
let s:gb.bright_orange  = ['#ffb4ca', 208]     " 254-128-25

let s:gb.neutral_red    = ['#ef5757', 124]     " 204-36-29
let s:gb.neutral_green  = ['#85cb33', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#9cd0A1', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#50a2a7', 66]      " 69-133-136
let s:gb.neutral_purple = ['#9055a2', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#7d82b8', 72]      " 104-157-106
let s:gb.neutral_orange = ['#ff99b8', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvpink_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvpink_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvpink_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvpink_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvpink_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:gruvpink_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:gruvpink_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:gruvpink_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:gruvpink_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:gruvpink_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvpink_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvpink_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvpink_number_column')
  let s:number_column = get(s:gb, g:gruvpink_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvpink_sign_column')
    let s:sign_column = get(s:gb, g:gruvpink_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:gruvpink_color_column')
  let s:color_column = get(s:gb, g:gruvpink_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvpink_vert_split')
  let s:vert_split = get(s:gb, g:gruvpink_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvpink_invert_signs')
  if g:gruvpink_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvpink_invert_selection')
  if g:gruvpink_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvpink_invert_tabline')
  if g:gruvpink_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvpink_italicize_comments')
  if g:gruvpink_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvpink_italicize_strings')
  if g:gruvpink_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvpink_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvpink_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Gruvpink Hi Groups: {{{

" memoize common hi groups
call s:HL('GruvpinkFg0', s:fg0)
call s:HL('GruvpinkFg1', s:fg1)
call s:HL('GruvpinkFg2', s:fg2)
call s:HL('GruvpinkFg3', s:fg3)
call s:HL('GruvpinkFg4', s:fg4)
call s:HL('GruvpinkGray', s:gray)
call s:HL('GruvpinkBg0', s:bg0)
call s:HL('GruvpinkBg1', s:bg1)
call s:HL('GruvpinkBg2', s:bg2)
call s:HL('GruvpinkBg3', s:bg3)
call s:HL('GruvpinkBg4', s:bg4)

call s:HL('GruvpinkRed', s:red)
call s:HL('GruvpinkRedBold', s:red, s:none, s:bold)
call s:HL('GruvpinkGreen', s:green)
call s:HL('GruvpinkGreenBold', s:green, s:none, s:bold)
call s:HL('GruvpinkYellow', s:yellow)
call s:HL('GruvpinkYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvpinkBlue', s:blue)
call s:HL('GruvpinkBlueBold', s:blue, s:none, s:bold)
call s:HL('GruvpinkPurple', s:purple)
call s:HL('GruvpinkPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvpinkAqua', s:aqua)
call s:HL('GruvpinkAquaBold', s:aqua, s:none, s:bold)
call s:HL('GruvpinkOrange', s:orange)
call s:HL('GruvpinkOrangeBold', s:orange, s:none, s:bold)

call s:HL('GruvpinkRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GruvpinkGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GruvpinkYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvpinkBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GruvpinkPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvpinkAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('GruvpinkOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvpink/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText GruvpinkBg2
hi! link SpecialKey GruvpinkBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GruvpinkGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GruvpinkGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GruvpinkYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GruvpinkYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GruvpinkOrangeBold
" Warning messages
hi! link WarningMsg GruvpinkRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvpink_improved_strings == 0
  hi! link Special GruvpinkOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GruvpinkRedBold
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvpinkRedBold
" for, do, while, etc.
hi! link Repeat GruvpinkRedBold
" case, default, etc.
hi! link Label GruvpinkRedBold
" try, catch, throw
hi! link Exception GruvpinkRedBold
" sizeof, "+", "*", etc.
hi! link Operator GruvpinkYellow
" Any other keyword
hi! link Keyword GruvpinkRed

" Variable name
hi! link Identifier GruvpinkBlue
" Function name
hi! link Function GruvpinkYellow

" Generic preprocessor
hi! link PreProc GruvpinkPurple
" Preprocessor #include
hi! link Include GruvpinkPurple
" Preprocessor #define
hi! link Define GruvpinkPurple
" Same as Define
hi! link Macro GruvpinkPurple
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvpinkPurple

" Generic constant
hi! link Constant GruvpinkPurpleBold
" Character constant: 'c', '/n'
hi! link Character GruvpinkGreenBold
" String constant: "this is a string"
if g:gruvpink_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean GruvpinkAquaBold
" Number constant: 234, 0xff
hi! link Number GruvpinkAquaBold
" Floating point constant: 2.3e10
hi! link Float GruvpinkAquaBold

" Generic type
hi! link Type GruvpinkBlueBold
" static, register, volatile, etc
hi! link StorageClass GruvpinkOrange
" struct, union, enum, etc.
hi! link Structure GruvpinkRedBold
" typedef
hi! link Typedef GruvpinkRedBold

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvpink_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:gruvpink_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd GruvpinkGreenSign
hi! link GitGutterChange GruvpinkAquaSign
hi! link GitGutterDelete GruvpinkRedSign
hi! link GitGutterChangeDelete GruvpinkAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile GruvpinkGreen
hi! link gitcommitDiscardedFile GruvpinkRed

" }}}
" Signify: {{{

hi! link SignifySignAdd GruvpinkGreenSign
hi! link SignifySignChange GruvpinkAquaSign
hi! link SignifySignDelete GruvpinkRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign GruvpinkRedSign
hi! link SyntasticWarningSign GruvpinkYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   GruvpinkBlueSign
hi! link SignatureMarkerText GruvpinkPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl GruvpinkBlueSign
hi! link ShowMarksHLu GruvpinkBlueSign
hi! link ShowMarksHLo GruvpinkBlueSign
hi! link ShowMarksHLm GruvpinkBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch GruvpinkYellow
hi! link CtrlPNoEntries GruvpinkRed
hi! link CtrlPPrtBase GruvpinkBg2
hi! link CtrlPPrtCursor GruvpinkBlue
hi! link CtrlPLinePre GruvpinkBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket GruvpinkFg3
hi! link StartifyFile GruvpinkFg1
hi! link StartifyNumber GruvpinkBlue
hi! link StartifyPath GruvpinkGray
hi! link StartifySlash GruvpinkGray
hi! link StartifySection GruvpinkYellow
hi! link StartifySpecial GruvpinkBg2
hi! link StartifyHeader GruvpinkOrange
hi! link StartifyFooter GruvpinkBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign GruvpinkRedSign
hi! link ALEWarningSign GruvpinkYellowSign
hi! link ALEInfoSign GruvpinkBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail GruvpinkAqua
hi! link DirvishArg GruvpinkYellow

" }}}
" Netrw: {{{

hi! link netrwDir GruvpinkAqua
hi! link netrwClassify GruvpinkAqua
hi! link netrwLink GruvpinkGray
hi! link netrwSymLink GruvpinkFg1
hi! link netrwExe GruvpinkYellow
hi! link netrwComment GruvpinkGray
hi! link netrwList GruvpinkBlue
hi! link netrwHelpCmd GruvpinkAqua
hi! link netrwCmdSep GruvpinkFg3
hi! link netrwVersion GruvpinkGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir GruvpinkAqua
hi! link NERDTreeDirSlash GruvpinkAqua

hi! link NERDTreeOpenable GruvpinkOrange
hi! link NERDTreeClosable GruvpinkOrange

hi! link NERDTreeFile GruvpinkFg1
hi! link NERDTreeExecFile GruvpinkYellow

hi! link NERDTreeUp GruvpinkGray
hi! link NERDTreeCWD GruvpinkGreen
hi! link NERDTreeHelp GruvpinkFg1

hi! link NERDTreeToggleOn GruvpinkGreen
hi! link NERDTreeToggleOff GruvpinkRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign GruvpinkRedSign
hi! link CocWarningSign GruvpinkOrangeSign
hi! link CocInfoSign GruvpinkYellowSign
hi! link CocHintSign GruvpinkBlueSign
hi! link CocErrorFloat GruvpinkRed
hi! link CocWarningFloat GruvpinkOrange
hi! link CocInfoFloat GruvpinkYellow
hi! link CocHintFloat GruvpinkBlue
hi! link CocDiagnosticsError GruvpinkRed
hi! link CocDiagnosticsWarning GruvpinkOrange
hi! link CocDiagnosticsInfo GruvpinkYellow
hi! link CocDiagnosticsHint GruvpinkBlue

hi! link CocSelectedText GruvpinkRed
hi! link CocCodeLens GruvpinkGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded GruvpinkGreen
hi! link diffRemoved GruvpinkRed
hi! link diffChanged GruvpinkAqua

hi! link diffFile GruvpinkOrange
hi! link diffNewFile GruvpinkYellow

hi! link diffLine GruvpinkBlue

" }}}
" Html: {{{

hi! link htmlTag GruvpinkBlue
hi! link htmlEndTag GruvpinkBlue

hi! link htmlTagName GruvpinkAquaBold
hi! link htmlArg GruvpinkAqua

hi! link htmlScriptTag GruvpinkPurple
hi! link htmlTagN GruvpinkFg1
hi! link htmlSpecialTagName GruvpinkAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar GruvpinkOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag GruvpinkBlue
hi! link xmlEndTag GruvpinkBlue
hi! link xmlTagName GruvpinkBlue
hi! link xmlEqual GruvpinkBlue
hi! link docbkKeyword GruvpinkAquaBold

hi! link xmlDocTypeDecl GruvpinkGray
hi! link xmlDocTypeKeyword GruvpinkPurple
hi! link xmlCdataStart GruvpinkGray
hi! link xmlCdataCdata GruvpinkPurple
hi! link dtdFunction GruvpinkGray
hi! link dtdTagName GruvpinkPurple

hi! link xmlAttrib GruvpinkAqua
hi! link xmlProcessingDelim GruvpinkGray
hi! link dtdParamEntityPunct GruvpinkGray
hi! link dtdParamEntityDPunct GruvpinkGray
hi! link xmlAttribPunct GruvpinkGray

hi! link xmlEntity GruvpinkOrange
hi! link xmlEntityPunct GruvpinkOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation GruvpinkOrange
hi! link vimBracket GruvpinkOrange
hi! link vimMapModKey GruvpinkOrange
hi! link vimFuncSID GruvpinkFg3
hi! link vimSetSep GruvpinkFg3
hi! link vimSep GruvpinkFg3
hi! link vimContinue GruvpinkFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword GruvpinkBlue
hi! link clojureCond GruvpinkOrange
hi! link clojureSpecial GruvpinkOrange
hi! link clojureDefine GruvpinkOrange

hi! link clojureFunc GruvpinkYellow
hi! link clojureRepeat GruvpinkYellow
hi! link clojureCharacter GruvpinkAqua
hi! link clojureStringEscape GruvpinkAqua
hi! link clojureException GruvpinkRed

hi! link clojureRegexp GruvpinkAqua
hi! link clojureRegexpEscape GruvpinkAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen GruvpinkFg3
hi! link clojureAnonArg GruvpinkYellow
hi! link clojureVariable GruvpinkBlue
hi! link clojureMacro GruvpinkOrange

hi! link clojureMeta GruvpinkYellow
hi! link clojureDeref GruvpinkYellow
hi! link clojureQuote GruvpinkYellow
hi! link clojureUnquote GruvpinkYellow

" }}}
" C: {{{

hi! link cOperator GruvpinkPurple
hi! link cStructure GruvpinkOrange

" }}}
" Python: {{{

hi! link pythonBuiltin GruvpinkOrange
hi! link pythonBuiltinObj GruvpinkOrange
hi! link pythonBuiltinFunc GruvpinkOrange
hi! link pythonFunction GruvpinkAqua
hi! link pythonDecorator GruvpinkRed
hi! link pythonInclude GruvpinkBlue
hi! link pythonImport GruvpinkBlue
hi! link pythonRun GruvpinkBlue
hi! link pythonCoding GruvpinkBlue
hi! link pythonOperator GruvpinkRed
hi! link pythonException GruvpinkRed
hi! link pythonExceptions GruvpinkPurple
hi! link pythonBoolean GruvpinkPurple
hi! link pythonDot GruvpinkFg3
hi! link pythonConditional GruvpinkRed
hi! link pythonRepeat GruvpinkRed
hi! link pythonDottedName GruvpinkGreenBold

" }}}
" CSS: {{{

hi! link cssBraces GruvpinkBlue
hi! link cssFunctionName GruvpinkYellow
hi! link cssIdentifier GruvpinkOrange
hi! link cssClassName GruvpinkGreen
hi! link cssColor GruvpinkBlue
hi! link cssSelectorOp GruvpinkBlue
hi! link cssSelectorOp2 GruvpinkBlue
hi! link cssImportant GruvpinkGreen
hi! link cssVendor GruvpinkFg1

hi! link cssTextProp GruvpinkAqua
hi! link cssAnimationProp GruvpinkAqua
hi! link cssUIProp GruvpinkYellow
hi! link cssTransformProp GruvpinkAqua
hi! link cssTransitionProp GruvpinkAqua
hi! link cssPrintProp GruvpinkAqua
hi! link cssPositioningProp GruvpinkYellow
hi! link cssBoxProp GruvpinkAqua
hi! link cssFontDescriptorProp GruvpinkAqua
hi! link cssFlexibleBoxProp GruvpinkAqua
hi! link cssBorderOutlineProp GruvpinkAqua
hi! link cssBackgroundProp GruvpinkAqua
hi! link cssMarginProp GruvpinkAqua
hi! link cssListProp GruvpinkAqua
hi! link cssTableProp GruvpinkAqua
hi! link cssFontProp GruvpinkAqua
hi! link cssPaddingProp GruvpinkAqua
hi! link cssDimensionProp GruvpinkAqua
hi! link cssRenderProp GruvpinkAqua
hi! link cssColorProp GruvpinkAqua
hi! link cssGeneratedContentProp GruvpinkAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces GruvpinkFg1
hi! link javaScriptFunction GruvpinkAqua
hi! link javaScriptIdentifier GruvpinkRed
hi! link javaScriptMember GruvpinkBlue
hi! link javaScriptNumber GruvpinkPurple
hi! link javaScriptNull GruvpinkPurple
hi! link javaScriptParens GruvpinkFg3

" }}}
" YAJS: {{{

hi! link javascriptImport GruvpinkAqua
hi! link javascriptExport GruvpinkAqua
hi! link javascriptClassKeyword GruvpinkAqua
hi! link javascriptClassExtends GruvpinkAqua
hi! link javascriptDefault GruvpinkAqua

hi! link javascriptClassName GruvpinkYellow
hi! link javascriptClassSuperName GruvpinkYellow
hi! link javascriptGlobal GruvpinkYellow

hi! link javascriptEndColons GruvpinkFg1
hi! link javascriptFuncArg GruvpinkFg1
hi! link javascriptGlobalMethod GruvpinkFg1
hi! link javascriptNodeGlobal GruvpinkFg1
hi! link javascriptBOMWindowProp GruvpinkFg1
hi! link javascriptArrayMethod GruvpinkFg1
hi! link javascriptArrayStaticMethod GruvpinkFg1
hi! link javascriptCacheMethod GruvpinkFg1
hi! link javascriptDateMethod GruvpinkFg1
hi! link javascriptMathStaticMethod GruvpinkFg1

" hi! link javascriptProp GruvpinkFg1
hi! link javascriptURLUtilsProp GruvpinkFg1
hi! link javascriptBOMNavigatorProp GruvpinkFg1
hi! link javascriptDOMDocMethod GruvpinkFg1
hi! link javascriptDOMDocProp GruvpinkFg1
hi! link javascriptBOMLocationMethod GruvpinkFg1
hi! link javascriptBOMWindowMethod GruvpinkFg1
hi! link javascriptStringMethod GruvpinkFg1

hi! link javascriptVariable GruvpinkOrange
" hi! link javascriptVariable GruvpinkRed
" hi! link javascriptIdentifier GruvpinkOrange
" hi! link javascriptClassSuper GruvpinkOrange
hi! link javascriptIdentifier GruvpinkOrange
hi! link javascriptClassSuper GruvpinkOrange

" hi! link javascriptFuncKeyword GruvpinkOrange
" hi! link javascriptAsyncFunc GruvpinkOrange
hi! link javascriptFuncKeyword GruvpinkAqua
hi! link javascriptAsyncFunc GruvpinkAqua
hi! link javascriptClassStatic GruvpinkOrange

hi! link javascriptOperator GruvpinkRed
hi! link javascriptForOperator GruvpinkRed
hi! link javascriptYield GruvpinkRed
hi! link javascriptExceptions GruvpinkRed
hi! link javascriptMessage GruvpinkRed

hi! link javascriptTemplateSB GruvpinkAqua
hi! link javascriptTemplateSubstitution GruvpinkFg1

" hi! link javascriptLabel GruvpinkBlue
" hi! link javascriptObjectLabel GruvpinkBlue
" hi! link javascriptPropertyName GruvpinkBlue
hi! link javascriptLabel GruvpinkFg1
hi! link javascriptObjectLabel GruvpinkFg1
hi! link javascriptPropertyName GruvpinkFg1

hi! link javascriptLogicSymbols GruvpinkFg1
hi! link javascriptArrowFunc GruvpinkYellow

hi! link javascriptDocParamName GruvpinkFg4
hi! link javascriptDocTags GruvpinkFg4
hi! link javascriptDocNotation GruvpinkFg4
hi! link javascriptDocParamType GruvpinkFg4
hi! link javascriptDocNamedParamType GruvpinkFg4

hi! link javascriptBrackets GruvpinkFg1
hi! link javascriptDOMElemAttrs GruvpinkFg1
hi! link javascriptDOMEventMethod GruvpinkFg1
hi! link javascriptDOMNodeMethod GruvpinkFg1
hi! link javascriptDOMStorageMethod GruvpinkFg1
hi! link javascriptHeadersMethod GruvpinkFg1

hi! link javascriptAsyncFuncKeyword GruvpinkRed
hi! link javascriptAwaitFuncKeyword GruvpinkRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword GruvpinkAqua
hi! link jsExtendsKeyword GruvpinkAqua
hi! link jsExportDefault GruvpinkAqua
hi! link jsTemplateBraces GruvpinkAqua
hi! link jsGlobalNodeObjects GruvpinkFg1
hi! link jsGlobalObjects GruvpinkFg1
hi! link jsFunction GruvpinkAqua
hi! link jsFuncParens GruvpinkFg3
hi! link jsParens GruvpinkFg3
hi! link jsNull GruvpinkPurple
hi! link jsUndefined GruvpinkPurple
hi! link jsClassDefinition GruvpinkYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved GruvpinkAqua
hi! link typeScriptLabel GruvpinkAqua
hi! link typeScriptFuncKeyword GruvpinkAqua
hi! link typeScriptIdentifier GruvpinkOrange
hi! link typeScriptBraces GruvpinkFg1
hi! link typeScriptEndColons GruvpinkFg1
hi! link typeScriptDOMObjects GruvpinkFg1
hi! link typeScriptAjaxMethods GruvpinkFg1
hi! link typeScriptLogicSymbols GruvpinkFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects GruvpinkFg1
hi! link typeScriptParens GruvpinkFg3
hi! link typeScriptOpSymbols GruvpinkFg3
hi! link typeScriptHtmlElemProperties GruvpinkFg1
hi! link typeScriptNull GruvpinkPurple
hi! link typeScriptInterpolationDelimiter GruvpinkAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword GruvpinkAqua
hi! link purescriptModuleName GruvpinkFg1
hi! link purescriptWhere GruvpinkAqua
hi! link purescriptDelimiter GruvpinkFg4
hi! link purescriptType GruvpinkFg1
hi! link purescriptImportKeyword GruvpinkAqua
hi! link purescriptHidingKeyword GruvpinkAqua
hi! link purescriptAsKeyword GruvpinkAqua
hi! link purescriptStructure GruvpinkAqua
hi! link purescriptOperator GruvpinkBlue

hi! link purescriptTypeVar GruvpinkFg1
hi! link purescriptConstructor GruvpinkFg1
hi! link purescriptFunction GruvpinkFg1
hi! link purescriptConditional GruvpinkOrange
hi! link purescriptBacktick GruvpinkOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp GruvpinkFg3
hi! link coffeeSpecialOp GruvpinkFg3
hi! link coffeeCurly GruvpinkOrange
hi! link coffeeParen GruvpinkFg3
hi! link coffeeBracket GruvpinkOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter GruvpinkGreen
hi! link rubyInterpolationDelimiter GruvpinkAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier GruvpinkRed
hi! link objcDirective GruvpinkBlue

" }}}
" Go: {{{

hi! link goDirective GruvpinkAqua
hi! link goConstants GruvpinkPurple
hi! link goDeclaration GruvpinkRed
hi! link goDeclType GruvpinkBlue
hi! link goBuiltins GruvpinkOrange

" }}}
" Lua: {{{

hi! link luaIn GruvpinkRed
hi! link luaFunction GruvpinkAqua
hi! link luaTable GruvpinkOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp GruvpinkFg3
hi! link moonExtendedOp GruvpinkFg3
hi! link moonFunction GruvpinkFg3
hi! link moonObject GruvpinkYellow

" }}}
" Java: {{{

hi! link javaAnnotation GruvpinkBlue
hi! link javaDocTags GruvpinkAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen GruvpinkFg3
hi! link javaParen1 GruvpinkFg3
hi! link javaParen2 GruvpinkFg3
hi! link javaParen3 GruvpinkFg3
hi! link javaParen4 GruvpinkFg3
hi! link javaParen5 GruvpinkFg3
hi! link javaOperator GruvpinkOrange

hi! link javaVarArg GruvpinkGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter GruvpinkGreen
hi! link elixirInterpolationDelimiter GruvpinkAqua

hi! link elixirModuleDeclaration GruvpinkYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition GruvpinkFg1
hi! link scalaCaseFollowing GruvpinkFg1
hi! link scalaCapitalWord GruvpinkFg1
hi! link scalaTypeExtension GruvpinkFg1

hi! link scalaKeyword GruvpinkRed
hi! link scalaKeywordModifier GruvpinkRed

hi! link scalaSpecial GruvpinkAqua
hi! link scalaOperator GruvpinkFg1

hi! link scalaTypeDeclaration GruvpinkYellow
hi! link scalaTypeTypePostDeclaration GruvpinkYellow

hi! link scalaInstanceDeclaration GruvpinkFg1
hi! link scalaInterpolation GruvpinkAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 GruvpinkGreenBold
hi! link markdownH2 GruvpinkGreenBold
hi! link markdownH3 GruvpinkYellowBold
hi! link markdownH4 GruvpinkYellowBold
hi! link markdownH5 GruvpinkYellow
hi! link markdownH6 GruvpinkYellow

hi! link markdownCode GruvpinkAqua
hi! link markdownCodeBlock GruvpinkAqua
hi! link markdownCodeDelimiter GruvpinkAqua

hi! link markdownBlockquote GruvpinkGray
hi! link markdownListMarker GruvpinkGray
hi! link markdownOrderedListMarker GruvpinkGray
hi! link markdownRule GruvpinkGray
hi! link markdownHeadingRule GruvpinkGray

hi! link markdownUrlDelimiter GruvpinkFg3
hi! link markdownLinkDelimiter GruvpinkFg3
hi! link markdownLinkTextDelimiter GruvpinkFg3

hi! link markdownHeadingDelimiter GruvpinkOrange
hi! link markdownUrl GruvpinkPurple
hi! link markdownUrlTitleDelimiter GruvpinkGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType GruvpinkYellow
" hi! link haskellOperators GruvpinkOrange
" hi! link haskellConditional GruvpinkAqua
" hi! link haskellLet GruvpinkOrange
"
hi! link haskellType GruvpinkFg1
hi! link haskellIdentifier GruvpinkFg1
hi! link haskellSeparator GruvpinkFg1
hi! link haskellDelimiter GruvpinkFg4
hi! link haskellOperators GruvpinkBlue
"
hi! link haskellBacktick GruvpinkOrange
hi! link haskellStatement GruvpinkOrange
hi! link haskellConditional GruvpinkOrange

hi! link haskellLet GruvpinkAqua
hi! link haskellDefault GruvpinkAqua
hi! link haskellWhere GruvpinkAqua
hi! link haskellBottom GruvpinkAqua
hi! link haskellBlockKeywords GruvpinkAqua
hi! link haskellImportKeywords GruvpinkAqua
hi! link haskellDeclKeyword GruvpinkAqua
hi! link haskellDeriving GruvpinkAqua
hi! link haskellAssocType GruvpinkAqua

hi! link haskellNumber GruvpinkPurple
hi! link haskellPragma GruvpinkPurple

hi! link haskellString GruvpinkGreen
hi! link haskellChar GruvpinkGreen

" }}}
" Json: {{{

hi! link jsonKeyword GruvpinkGreen
hi! link jsonQuote GruvpinkGreen
hi! link jsonBraces GruvpinkFg1
hi! link jsonString GruvpinkFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! GruvpinkHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! GruvpinkHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
