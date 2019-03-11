set nocompatible              " be iMproved, required

" vim-plug https://github.com/junegunn/vim-plug
let g:plug_threads=1
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" My Bundles
" Plugin 'neocomplcache'
" Plugin 'taglist.vim'
" Plugin 'rails.vim'
" Plugin 'Smooth-Scroll'
" Plug 'jlanzarotta/bufexplorer'
" Plugin 'Solarized'
Plug 'majutsushi/tagbar'
" Plugin 'unite.vim'
" Plugin 'javacomplete'
" Plugin 'JavaImp.vim--Lee'
" Plugin 'DirDiff.vim'
Plug 'scrooloose/syntastic'
" for rspec plugin
" Plugin 'maven2.vim'
" Plugin 'ctrlp.vim'
" Plugin 'UltiSnips'
" Plugin 'ShowMarks'
" Plugin 'pyflakes.vim'
Plug 'vim-airline/vim-airline'
" Plug 'https://github.com/kevinw/pyflakes-vim.git'
" Plugin 'https://github.com/Shougo/neosnippet.git'
" Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'https://github.com/Shougo/vimproc.git'
Plug 'https://github.com/Shougo/vimshell.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'mileszs/ack.vim'
" Plugin 'xolox/vim-easytags'
" Plugin 'orenhe/pylint.vim'
" Plug 'AutoTag'
Plug 'https://github.com/arnaud-lb/vim-php-namespace.git'
Plug 'https://github.com/tpope/vim-haml.git'
Plug 'easymotion/vim-easymotion'
" Plugin 'joonty/vdebug.git'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'benmills/vimux'
" Plugin 'zenorocha/dracula-theme'
Plug 'brendonrapp/smyck-vim'
Plug 'fatih/vim-go'
Plug 'kshenoy/vim-signature'
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'ElmCast/elm-vim'
" Plug 'lambdatoast/elm.vim'
" Plug 'Townk/vim-autoclose'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'slim-template/vim-slim'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'nanotech/jellybeans.vim'
Plug 'chr4/nginx.vim'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'phenomenes/ansible-snippets'
Plug 'bhurlow/vim-parinfer'
Plug 'tpope/vim-vinegar'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'




" All of your Plugins must be added before the following line
call plug#end()            " required

" Put your non-Plugin stuff after this line
" set clipboard=unnamed
set clipboard+=unnamedplus

set nocompatible " We're running Vim, not Vi!

set so=7
set mouse=a
set cc=80
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set exrc
set number
set incsearch	
set linebreak showbreak=>>
set sidescroll=5
set listchars+=precedes:<,extends:>,nbsp:#,conceal:@
set ignorecase
" set ambiwidth=double
set directory=~/.vimswp//,~/tmp//,/tmp//
set cursorcolumn cursorline
set laststatus=2
set wildmenu
set ruler
set hid
set cmdheight=2
set smartcase
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw 
set magic
set showmatch 
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=2
set ffs=unix,dos,mac

" set statusline=%F

" for macvim
if has("gui_macvim")
  set guifont=Monaco:h14
  set visualbell
  set transp=0
  set lines=50
  set columns=100

  " not support...
  set guioptions-=m
  set guioptions-=T
  colors desertEx
endif

" Syntax color
set background=dark
" color smyck
" colorscheme gruvbox
colorscheme jellybeans
" let base16colorspace=256  " Access colors present in 256 colorspace

" tags
" set tags+=~/src/**/tags


" colors desert256 
" colors wombat256

" colors zenburn
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

syntax enable " Enable syntax highlighting

" default seeting 
set ai sw=2 sts=2 et

" autocmd FocusGained redraw!

filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

" auto trim trailing whitspace for source code
autocmd FileType c,cpp,java,php,ruby,python,javascript,coffee,haskell autocmd BufWritePre <buffer> :%s/\s\+$//e

" ---------ruby
augroup filetype_ruby
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby compiler ruby
  autocmd BufWritePost *.rb !ruby -cw %
  " autocmd FileType ruby,eruby call SetRubyQFix()
  " autocmd FileType ruby,eruby set makeprg=ruby\ %
  " autocmd FileType ruby,eruby set errorformat=%-GSyntax\ OK,%A%f:%l:%m,%-Z%p^
augroup END

" --------- haskell
augroup filetype_haskell
  " Clear old autocmds in group
  autocmd!
  autocmd FileType haskell set nospell
augroup END


" --------- haskell
augroup elm
  " Clear old autocmds in group
  autocmd!
  autocmd FileType elm set sw=4 sts=4
augroup END

" golang
augroup golang
  autocmd!
  autocmd! User GoyoEnter set foldcolumn=0
  autocmd! User GoyoLeave set foldcolumn=2
  autocmd FileType go set ai sw=8 sts=8
  let g:go_fmt_command = "goimports"
  let g:go_doc_keywordprg_enabled = 0
  set foldmethod=syntax 
  set foldlevel=7
augroup END

augroup filetype_javascript
  autocmd!
augroup END
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pyflakes', 'python']

" C
augroup c_code
  autocmd!
  autocmd FileType c,h set ai sw=8 sts=8
augroup END

" PHP
augroup php
  autocmd!
  autocmd FileType php set sw=4 sts=4 foldmethod=indent
  " insert use statement
  autocmd FileType php imap <buffer> <Leader>u <C-O>:call PhpInsertUse()<CR><RIGHT>
  autocmd FileType php map <buffer> <Leader>u :call PhpInsertUse()<CR>
  autocmd FileType php imap <buffer> <Leader>e <C-O>:call PhpExpandClass()<CR>
  autocmd FileType php map <buffer> <Leader>e :call PhpExpandClass()<CR>
  autocmd FileType php set foldmethod=indent
  autocmd FileType php set foldlevel=4
  " autocmd BufWritePost *.php !php -l %
augroup END

" HAML
augroup haml
  autocmd!
  autocmd FileType haml set sw=4 sts=4
augroup END

" SCSS
augroup scss
  autocmd!
  autocmd FileType scss.css set indentexpr=scss_indent#GetIndent(v:lnum)
augroup END

" Haskell
augroup haskell
  autocmd!
  autocmd FileType haskell set sts=4 sw=4
augroup END

augroup jsp
  autocmd!
  autocmd FileType jsp set ft=html
augroup END

augroup coffee
   autocmd!
   autocmd FileType coffee set nospell sts=4 sw=4
 augroup END

" Java
augroup java
  autocmd!
  " autocmd FileType java compiler javac
  " autocmd FileType java set makeprg=ant
  " autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd FileType java set ai sw=4 sts=4
  autocmd FileType java let g:JavaImpPaths=$HOME . "/projects/prebuild-hudson-plugin/src/main/java"
  autocmd FileType java let g:JavaImpDataDir=$HOME . "/tmp/"
  " autocmd FileType java nmap <leader>p iSystem.out.println();<ESC>hh==f(a
augroup END

augroup jelly
  autocmd!
  autocmd BufRead,BufNewFile *.jelly set ft=xml
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python set ai sw=4 sts=4
augroup END

" YAML
augroup yaml
  autocmd! 
  autocmd FileType yaml set foldmethod=indent
  autocmd FileType yaml set ai sw=2 sts=2
augroup END

" command line window
augroup command_window
  autocmd!
  autocmd CmdwinEnter : nmap <ESC> <C-C>
  autocmd CmdwinLeave : unmap <ESC>
augroup END

" function! SetRubyQFix() 
" 	setlocal makeprg=/opt/bin/ruby\ -w\ %
" 	setlocal errorformat=%+GSyntax\ OK
" 	setlocal efm+=%+E%f:%l:\ parse\ error
" 	setlocal efm+=%A%f:%l:in\ %*[^:]:\ %m
" 	setlocal efm+=%A%f:%l:\ %m
"         setlocal efm+=%-C%\tfrom\ %f:%l:%m
" 	setlocal efm+=%-Z%\tfrom\ %f:%l
" 	setlocal efm+=%-Z%p^
" 	setlocal efm+=%-G%.%#
" endfunction
" ---------ruby

" map

" nnoremap <leader>o o<ESC>ko<CR>
" nnoremap <leader>O O<ESC>O<CR>

nnoremap <C-p> :GFiles<CR>

" copy
vnoremap <C-c> "*y

" BBS type Browsing
map <UP> <C-Y>
map <DOWN> <C-E>
map <RIGHT> <C-F>
map <LEFT> <C-B>


" easy motion
nmap <space> \\f
nmap <space><space> \\F

" wrap line
map k gk
map j gj

nnoremap <leader>o <ESC>:call OpenSpace("o")<CR>
nnoremap <leader>O <ESC>:call OpenSpace("O")<CR>
" nnoremap <SPACE> <C-D>zz 
" nnoremap <TAB> <C-U>zz

" set nopaste while leaving insert
augroup for_paste
  autocmd InsertLeave * set nopaste
augroup END

nnoremap <leader>p <ESC>:set invpaste<CR><ESC>:set paste?<CR>i

" indent
nnoremap <leader>i <ESC>ggVG==

tnoremap <Esc> <C-\><C-n>


" tag list, nnoremap avoid nested map
nmap <F1> <ESC>:e ~/.vimrc<CR>
imap <F1> <ESC>
" autocmd BufWritePost ~/.vimrc echo "auto source!" | source ~/.vimrc



" nnoremap <F2> <ESC>:tabnew<CR>
" nnoremap <F3> <ESC>:Gstat<CR>

" let g:airline#extensions#tabline#enabled = 1


" nnoremap <F5> <ESC>gT
" noremap <F6> <ESC>gt
" nnoremap <C-L> :bnext<CR>
" nnoremap <C-H> :bprev<CR>
nnoremap <C-K> <ESC>:silent! call TagMove(0)<CR>
nnoremap <C-J> <ESC>:silent! call TagMove(1)<CR>
" disable autocomplpop.vim
" nnoremap <F7> <ESC>:AutoComplPopDisable<CR>
" nnoremap <F8> <ESC>:TlistToggle<CR>
nnoremap <silent> <F8> <ESC>:TagbarToggle<CR>
" nnoremap <F9> <ESC>:set invwrap <CR><ESC>:set wrap?<CR>

nnoremap <F9> <ESC>:VimuxRunLastCommand<CR>
nnoremap <F10> <ESC>:VimuxPromptCommand<CR>
nnoremap <F11> <ESC>:VimuxScrollUpInspect<CR>
nnoremap <F12> <ESC>:VimuxScrollDownInspect<CR>

nnoremap <leader>q :QFix<CR>

" folding
nnoremap <leader>z <ESC>:set foldlevel=0<CR>zx

command! -nargs=0 C execute "tabc"
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" next is 1, previous is 0
function! TagMove(next_or_previous)
  let move = ""
  if a:next_or_previous
    let move = "n"
  else
    let move = "p"
  endif
  if PreviewOrQFixExist() == 1
    let move = "c".move
  elseif PreviewOrQFixExist() == 2
    let move = "pt".move
  else
    let move = "t".move
  endif
  execute move
endfunction

function! PreviewOrQFixExist()
  for window in range(1, winnr('$'))
    if getbufvar(winbufnr(window), "&buftype") == "quickfix"
      return 1
    elseif getwinvar(window, "&pvw") == 1
      return 2
    endif
  endfor
  return 0
endfunction

" insert mode map
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" inoremap () ()<LEFT>
" inoremap [] []<LEFT>
" inoremap {} {}<LEFT>

" QUICKFIX WINDOW
command! -bang -nargs=? QFix call QFixToggle()
function! QFixToggle()
  if PreviewOrQFixExist() == 1
    cclose
  else
    copen 10
  endif
endfunction

" sudo write
command! -nargs=0 SudoWrite call SudoWrite()
function! SudoWrite()
  write !sudo tee %
endfunction

" taglist
let Tlist_Use_Right_Window = 1

" tagbar
let g:tagbar_autoclose=0


"smooth scroll
" let g:scroll_factor = 0

" Specky: for rspec convinent
let g:speckySpecSwitcherKey = "<leader>sx"
let g:speckyRunSpecKey = "<leader>sr"
let g:speckyRunSpecCmd = "rspec -r ~/.vim/bundle/Specky/ruby/specky_formatter.rb -f SpeckyFormatter"

" ctrl p
" let g:ctrlp_max_files = 0
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"             \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" PyFlakes
let g:pyflakes_use_quickfix = 0

" powerline
" let g:Powerline_symbols = 'fancy'

" let g:vdebug_options['path_maps'] = {}

" airline configure
" let g:airline_powerline_fonts=1
" let g:airline_symbols = {}
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

let g:ycm_filetype_specific_completion_to_disable = {'php': 'true'}
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

let g:ycm_python_binary_path = 'python'


let g:ackprg = 'ag --nogroup --nocolor -S '

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction


highlight clear SignColumn
highlight clear FoldColumn
