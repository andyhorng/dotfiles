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
Plug 'scrooloose/nerdtree'
" Plugin 'neocomplcache'
" Plugin 'taglist.vim'
" Plugin 'rails.vim'
" Plugin 'Smooth-Scroll'
Plug 'jlanzarotta/bufexplorer'
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
" Plug 'https://github.com/arnaud-lb/vim-php-namespace.git'
Plug 'https://github.com/tpope/vim-haml.git'
Plug 'easymotion/vim-easymotion'
" Plugin 'joonty/vdebug.git'
Plug 'cakebaker/scss-syntax.vim'
Plug 'airblade/vim-gitgutter'
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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'slim-template/vim-slim'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'digitaltoad/vim-pug'
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'bhurlow/vim-parinfer'

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
set autoindent
set smartindent

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
colorscheme gruvbox
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

augroup php
  autocmd!
  autocmd FileType php set sw=4 sts=4 cindent
augroup END

augroup pug
  autocmd!
  autocmd! FileType pug set sw=4 sts=4
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
  set foldlevel=4
augroup END


augroup clojure
  set foldlevel=99
augroup END

augroup filetype_javascript
  autocmd!
augroup END
let g:syntastic_javascript_checkers = ['eslint']

" C
augroup c_code
  autocmd!
  autocmd FileType c,h set ai sw=8 sts=8
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

" mark
map K \m

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

" tag list, nnoremap avoid nested map
nmap <F1> <ESC>:tabnew ~/.vimrc<CR>
imap <F1> <ESC>
" autocmd BufWritePost ~/.vimrc echo "auto source!" | source ~/.vimrc


nnoremap <F2> <ESC>:tabnew<CR>
nnoremap <F3> <ESC>:Gstat<CR>


" nnoremap <F4> <ESC>:NERDTreeToggle<CR>
nnoremap <F4> <ESC>:call NERDTreeFindToggle()<CR>
" nnoremap <F5> <ESC>:call NeoCnippetEditToggle()<CR>

" let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets/'

function! NeoCnippetEditToggle()
  if matchend(bufname(winbufnr(0)), ".snip") != -1
    bprevious
  else
    NeoSnippetEdit
  endif
endfunction

" nnoremap <F5> <ESC>gT
" noremap <F6> <ESC>gt
nnoremap <C-L> gt
nnoremap <C-H> gT
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

function! NERDTreeFindToggle()
    if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        NERDTreeClose
    else
      if filereadable(expand("%:p"))
        NERDTreeFind
      else 
        NERDTree
      endif
    endif
endfunction


command! -nargs=0 Coding call CloseNERDTreeAndTagbar()
function! CloseNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open
        NERDTreeClose
    endif

    if tagbar_open
        TagbarClose
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
" nnoremap <leader> :call ToggleNERDTreeAndTagbar()<CR><leader>
" Unite find file recursively
" Unite find file recursively
nnoremap <leader>uf <ESC>:call CloseNERDTreeAndTagbar()<CR>:NERDTreeClose<CR>:Unite file_rec<CR>
nnoremap <leader>ut <ESC>:call CloseNERDTreeAndTagbar()<CR>:NERDTreeClose<CR>:Unite tab<CR>
nnoremap <leader>us <ESC>:call CloseNERDTreeAndTagbar()<CR>:NERDTreeClose<CR>:Unite source<CR>
nnoremap <leader>ub <ESC>:call CloseNERDTreeAndTagbar()<CR>:NERDTreeClose<CR>:Unite buffer<CR>
let g:unite_enable_start_insert = 1

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

" Display shell commands' output on Vim window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "	call setline(1, 'You entered:    ' . a:cmdline)
  "	call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "	call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

function! OpenSpace(o)
  if(a:o == "o") 
    call append(line("."), "")
    call cursor(line(".") + 1, 0)
  else
    call append(line(".") - 1, "")
    call cursor(line(".") - 1, 0)
  endif

  let s = prevnonblank(line(".")) + 1
  let e = nextnonblank(line(".")) - 1
  
  execute s . "," . e . "delete"

  normal OO 
  startinsert

  
  " call append(line(".") - 1, ["", "", ""])

  " call cursor(line(".") - 1, 0)
endfunction

function! PecoOpen()
  for filename in split(system("ag -g . | peco"), "\n")
    execute "e" filename
  endfor
  execute "silent !echo -e \\033c"
  redraw!
endfunction

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" 

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" imap <TAB>     <Plug>(neocomplcache_snippets_expand)
" smap <TAB>     <Plug>(neocomplcache_snippets_expand)
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Neosnippet
" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let PHP_removeCRwhenUnix=1

" taglist
let Tlist_Use_Right_Window = 1

" tagbar
let g:tagbar_autoclose=0


" NERDTree
let NERDTreeIgnore = ['\.class$', '\.pyc$']
let NERDTreeBookmarksFile='./.NERDTreeBookmarks'

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

" hi MarkWord1  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
" hi MarkWord2  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
" hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
" hi MarkWord4  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
" hi MarkWord5  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
" hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black


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

" let g:ycm_filetype_specific_completion_to_disable = {'php': 'true'}
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
let g:gitgutter_sign_added = '»'
let g:gitgutter_sign_modified = '⌁'
let g:gitgutter_sign_removed = '«'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


let g:elm_format_autosave = 1
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
