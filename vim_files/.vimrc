" some gems taken from https://bitbucket.org/sjl/dotfiles

set nocompatible
syntax on

filetype off
call pathogen#infect()
filetype plugin indent on

set modelines=0
set encoding=utf-8
set autoindent
set nosmartindent
set history=10000
set number
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap

nmap , \

" search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>a :Ack<space>

set cursorline
set wrap
set noswapfile
set bs=2

if &t_Co == 256
  colorscheme Tomorrow-Night
  set t_ut=
endif

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" set quickfix window to appear after grep invocation
autocmd QuickFixCmdPost *grep* cwindow

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

map <silent> <LocalLeader>t :CommandT<CR>
map <silent> <LocalLeader>cf :CommandTFlush<CR>
map <silent> <LocalLeader>cb :CommandTBuffer<CR>
map <silent> <LocalLeader>cj :CommandTJump<CR>
map <silent> <LocalLeader>ct :CommandTTag<CR>
let g:CommandTAcceptSelectionSplitMap=['<C-s>']
let g:CommandTAcceptSelectionVSplitMap=['<C-v>']
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTMaxHeight=10

imap <C-L> <SPACE>=><SPACE>

" copy and paste to Mac OS X clipboard
set clipboard=unnamed
" noremap <leader>y "*y
" noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
" noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
" vnoremap <leader>y "*ygv

" window width
set winwidth=90
set winminwidth=15

" no arrow keys in normal and insert modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" split line
" the normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>at :SwitchARoo<cr>
nnoremap <leader>as :SwitchARooHorizontal<cr>
nnoremap <leader>av :SwitchARooVertical<cr>
nnoremap <leader>aj :SwitchToJavascript<cr>

" convert dos format to unix format
noremap <leader>ff :update<CR>:e ++ff=dos<CR>:setlocal ff=unix<CR>:w<CR>

" HTML tag folding
nnoremap <leader>ft Vatzf

" CSS properties sorting
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

let vimclojure#HighlightBuiltins=0
let vimclojure#ParenRainbow=1

command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>L"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = 'a'
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"" control-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tmp/*

" rspec_pipe
nnoremap <leader>A :!rspec_runner stdout suite<cr>
nnoremap <leader>S :!rspec_runner stdout rake_unit<cr>
nnoremap <leader>R :!rspec_runner stdout file %:p<cr>
nnoremap <leader>L :!rspec_runner stdout line %:p =line(".")<cr><cr>
nnoremap <leader>a :execute "silent !rspec_runner fifo suite /Users/taka/.__rspec__ &" \| redraw!<cr>
nnoremap <leader>s :!rspec_runner fifo rake_unit<cr>
nnoremap <leader>r :execute "silent !rspec_runner fifo file /Users/taka/.__rspec__ %:p &" \| redraw!<cr>
nnoremap <leader>l :execute "silent !rspec_runner fifo line /Users/taka/.__rspec__ %:p =line(".")<cr> &" \| redraw!<cr>

