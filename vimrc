set nocompatible

let g:plug_threads=1

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'brendonrapp/smyck-vim'
Plug 'fatih/vim-go'
Plug 'kshenoy/vim-signature'
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'chr4/nginx.vim'
Plug 'phenomenes/ansible-snippets'
Plug 'eraserhd/parinfer-rust'
Plug 'Olical/conjure', { 'tag': 'v1.0.2', 'do': 'bin/compile'  }
Plug 'chrisbra/Colorizer'
Plug 'dense-analysis/ale'

call plug#end()

set clipboard+=unnamedplus
set ai sw=2 sts=2 et
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
set autoindent
set smartindent
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=2
set ffs=unix,dos,mac
set background=dark

colorscheme jellybeans

autocmd FocusGained redraw!

" Return to last edit position 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
syntax enable 
filetype plugin indent on 
runtime! macros/matchit.vim

highlight clear SignColumn
highlight clear FoldColumn

" --- Key Maps ---
nnoremap <C-p> :CocList<CR>
nmap <space><space> <Plug>(easymotion-overwin-f)
map <UP> <C-Y>
map <DOWN> <C-E>
map <RIGHT> <C-F>
map <LEFT> <C-B>
map k gk
map j gj
tnoremap <Esc> <C-\><C-n>

" --- Plugin Configs ---
let g:ackprg = 'ag --nogroup --nocolor -S '
let g:conjure_fold_multiline_results=v:true
let g:conjure_log_direction="horizontal"
let g:conjure_log_auto_close=v:false
let g:colorizer_auto_color = 1
let g:coc_global_extensions = ['coc-conjure']
let g:ale_linters = {'clojure': ['clj-kondo']}
