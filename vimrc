"Douglas Black " Colors {{{ 
syntax enable           " enable syntax processing
"for color scheme
"syntax on
"colorscheme bandit
"}}}

" Misc {{{
set backspace=indent,eol,start


" Change VIMHOME variable to /local/mnt/workspace/msimili/
let &runtimepath='/local/mnt/workspace/msimili/.vim/'
let $VIMHOME = '/local/mnt/workspace/msimili/.vim/'

" Nerdtree change directory behavior
let g:NERDTreeChDirMode = 2

let g:vimwiki_list = [{'path': '~/.wiki/'}]
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
"set fillchars+=vert:
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=manual   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap "," za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
"
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W><C-H> :tabprevious<CR>
nnoremap <C-W><C-L> :tabnext<CR>
" }}}
"
" Leader Shortcuts {{{
let mapleader = "\<Space>" 
noremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>et :exec ":vsp /users/dblack/notes/vim/" . strftime('%m-%d-%y') . ".md"<cr>
nnoremap <leader>em :vsp ~/.bashrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>r :call Togglenumber()<cr>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
"nnoremap <leader>r :TestFile<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
vnoremap <leader>p "+p
nmap Y y$
nnoremap ss a<space><Esc>
nnoremap <C-m> m`o<Esc>``
nnoremap <C-i> m`O<Esc>``
nnoremap <leader>e<leader> :e#<CR>
nnoremap <leader>s<leader> :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<space>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <leader>f :FZF<CR>



" }}}

" }}}
" Syntastic {{{
"let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
"let g:syntastic_python_python_exec = 'python3'
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
augroup END
" }}}
" Testing {{{
"let test#strategy = 'neovim'
let test#python#runner = 'nose'
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Vim Plug {{{
call plug#begin("$VIMHOME/plugged")
"Plug 'gisphm/easycolor-mirror'
"Plug 'vim-scripts/Vimball'
Plug 'jimmysitu/pyclewn'
"Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-scala'
Plug 'janko-m/vim-test'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
"Plug 'JPR75/vip' "Activate for VHDL. Manage the conflict"
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'klen/python-mode'
Plug 'gabrielelana/vim-markdown'
Plug 'shime/vim-livedown'
Plug 'lervag/vimtex'

"Plug 'ntpeters/vim-better-whitespace'
"Plug 'altercation/vim-colors-solarized'
"Plug 'szw/vim-tags'
"Plug 'abudden/taghighlight-automirror'
Plug 'jnurmine/Zenburn'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
"Plug 'wincent/command-t', {
"\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"\ }
Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/tinymode.vim'
Plug 'jlanzarotta/bufexplorer'

call plug#end()
" }}}
" snippets config

" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<ALT>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" airline {{{
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatusFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0
"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
set background=dark
"this to make YCM compatible with syntastic
"let g:ycm_show_diagnostics_ui = 0


"au BufNewFile,BufRead *.py
    "\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unixu BufNewFile,BufRead *.py
	"
	"	
	"	python mode deactivate dot
    "let g:pymode_rope_complete_on_dot = 0

	

"" For Markdown

nmap gm :LivedownToggle<CR>


"" For Latex

let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'okular'
set shellslash=0

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
