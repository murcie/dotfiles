filetype off
filetype plugin indent off

scriptencoding utf-8

" use binary installed on Homebrew
"let g:python_host_prog='/usr/local/bin/python2'
"let g:python3_host_prog='/usr/local/bin/python3'
"let g:ruby_host_prog='/usr/local/bin/ruby'

" ======================================================================

" dein.vim
let s:dein_root = expand('~/.local/share/nvim/dein')
call mkdir(s:dein_root, 'p')
let s:dein_repo = s:dein_root . '/repos/github.com/Shougo/dein.vim'
let s:dein_config = expand('~/.config/nvim')

" Function for downloading dein
function DeinDownload()
  " Download dein.vim if not located
  if !isdirectory(s:dein_repo)
    call mkdir(fnamemodify(s:dein_repo, ':h'), 'p')
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo
    " Set permission if executable
    "silent! '!chmod 700 -R ' . s:vim_data_home
  endif
endfunction

execute 'set runtimepath^=' . fnamemodify(s:dein_repo, ':p')

if filereadable(s:dein_repo . '/README.md') && dein#load_state(s:dein_root)
  call dein#begin(s:dein_root)

  call dein#add(s:dein_repo)
  call dein#load_toml(s:dein_config . '/plugin.toml', {'lazy': 0})
  call dein#load_toml(s:dein_config . '/plugin_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" ======================================================================

" Syntax color:
" White:
set background=light
silent! colorscheme PaperColor
" Black:
"set background=dark
"silent! colorscheme lucius

" ======================================================================

" Display
set number "Line number
if v:version > 703
  set relativenumber "Use relative number to current line
endif
set showmatch "Brink a couple of bracket cursole on.
set matchtime=1 " Brink time of `showmatch'
set wildmenu
set wildmode=longest,full "command completion for vim
" mute beep
if v:version > 748
  set belloff=all
else
  set visualbell t_vb=
endif
set list "display white space characters
set listchars=tab:»-,nbsp:%,extends:»
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Indent
set expandtab "Use spaces to insert a <Tab>
set shiftwidth=4 "insert/delete size
set tabstop=4 "Visual length for character <Tab>
set smartindent "Smart indent when starting a new line

set ambiwidth=double "CJK character length (effective Unicode only)
set fileformats=unix,dos,mac "Auto detect newline character
set backspace=indent,eol,start "Enable deleting with <BS> out of Insert mode.
set whichwrap=b,s,h,l,<,>,[,],~ "Enable move cursole accross lines.

" Cursor (a block cursor in normal mode and a line cursor in insert mode)
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Fix key consistency about yanc end of line (alike D; Delete end of line)
nnoremap Y y$

" Keymap
" MapLeader (Using special key name explained in :help expr-string)
let mapleader="\<Space>"
" Move next/previous item on quickfix window.
nnoremap <silent> <leader>] :cnext<CR>
nnoremap <silent> <leader>[ :cprevious<CR>

" ======================================================================

filetype plugin indent on
syntax on

