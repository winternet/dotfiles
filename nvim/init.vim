call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-easytags'
""Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" colorschemes
Plug 'tomasr/molokai'
Plug 'dikiaap/minimalist'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp':'/vim'}
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
""""Plug 'neomake/neomake'
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" linting
""""Plug 'w0rp/ale' "cpp-check
" code completion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"""Plug 'ncm2/ncm2'
"""Plug 'roxma/nvim-yarp'
""Plug 'ncm2/ncm2-neoinclude'
""Plug 'ncm2/ncm2-syntax'
""Plug 'ncm2/ncm2-tmux'
""Plug 'ncm2/ncm2-path'
""Plug 'ncm2/ncm2-bufword'
" language specific plugins
" ncm2: go
"Plug 'ncm2/ncm2-go'
" ncm2: cpp
"Plug 'Rip-Rip/clang_complete'
"Plug 'ncm2/ncm2-pyclang'
" ncm2: vimscript
"""Plug 'ncm2/ncm2-vim'
" ncm2: javascript / typescript
"""Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
" ncm2: css
"""Plug 'ncm2/ncm2-cssomni'
" ncm2: python
"""Plug 'ncm2/ncm2-jedi'
" ncm2: latex
Plug 'lervag/vimtex'
" java
"Plug 'artur-shaik/vim-javacomplete2'
" html
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'
" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" ruby
Plug 'vim-ruby/vim-ruby'
" delimiter
Plug 'Raimondi/delimitMate'
" autosave
Plug '907th/vim-auto-save'
" debugger
"Plug 'vim-vdebug/vdebug'
call plug#end()

"source ~/.config/nvim/sessions.vim
source ~/.config/nvim/mappings.vim

filetype plugin indent on

set t_Co=256
set mouse=a

" true gui colors in terminal
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
set spell

set noswapfile
set nopaste
filetype on
syntax on
set number
set undofile
set undodir="$HOME/.vimundo"
" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
set completeopt+=menuone,noinsert,noselect
set completeopt-=preview

" colorscheme
"colorscheme molokai
"colorscheme onedark
colorscheme onehalflight

" scroll line in the middle
let &scrolloff=999-&scrolloff

" line numbering
set relativenumber number

" spaces instead of tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" ignore whitespaces in :diffthis
set diffopt+=iwhite

" search ignorecase and smartcase
set ignorecase
set smartcase
" search as letters are entered
set incsearch
" do not scroll to TOP on last occurence
set nowrapscan

" set smart indentation gg=G
set smartindent

" highligh current cursor line
set cursorline

" disable folding per default
set nofoldenable

" nerdtree
let NERDTreeIgnore = ['\.pyc$', '\.js.map$']

"delimitMate
let delimitMate_expand_cr = 1

"clang cpp options
"let g:clang_use_library = 1
"let g:clang_cpp_options = '-std=c++14'
"let g:clang_user_options=' || exit 0'

" filetypes
augroup filetypes
    autocmd!
    autocmd FileType html           setlocal foldmethod=indent foldlevelstart=1 shiftwidth=2 tabstop=2
    autocmd FileType python         setlocal foldmethod=indent foldlevelstart=1 expandtab shiftwidth=4 softtabstop=4
    autocmd FileType xml            setlocal shiftwidth=2 tabstop=2
    autocmd Filetype java           setlocal foldmethod=syntax foldlevel=1 foldlevelstart=1
    autocmd Filetype javascript     setlocal foldmethod=syntax foldlevel=1 foldlevelstart=1
    autocmd FileType cpp            setlocal foldmethod=syntax foldlevelstart=1 shiftwidth=2 tabstop=2
    "autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
    autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
augroup end

" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" always show signcolumns
set signcolumn=yes
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['ccls'],
\ }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1  

"""""""""""""function! s:check_back_space() abort
"""""""""""""  let col = col('.') - 1
"""""""""""""  return !col || getline('.')[col - 1]  =~# '\s'
"""""""""""""endfunction
"""""""""""""
"""""""""""""" Use <c-space> for trigger completion.
"""""""""""""inoremap <silent><expr> <c-space> coc#refresh()
"""""""""""""
" Use `[c` and `]c` for navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

nnoremap <C-A-Left> <C-O>
nnoremap <C-A-Right> <C-I>

" Remap keys for coc.vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gw <Plug>(coc-references)

nmap <silent> gl <Plug>(coc-codelens-action)
nmap <silent> <A-Enter> <Plug>(coc-codeaction)
nmap <silent> <C-p> <Plug>(coc-diagnostic-info)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <A-F6> <Plug>(coc-rename)
nnoremap <silent> <C-s> :call LanguageClient_textDocument_documentSymbol()<CR>
nmap <silent> <leader>f <Plug>(coc-format-selected)
vnoremap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>ca :call LanguageClient_textDocument_codeAction()<CR>
" caller
nn <silent> gc <Plug>(coc-references)
" callee
nn <silent> gC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>
nn <silent> <A-F7> :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>

" Remap keys for gotos (LanguageClient-neovim)
nmap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nmap <silent> gy :call LanguageClient_textDocument_typeDefinition()<CR>
nmap <silent> gi :call LanguageClient_textDocument_implementation()<CR>
nmap <silent> gw :call LanguageClient_textDocument_references()<CR>

nmap <silent> <C-p> :call LanguageClient_textDocument_hover()<CR>
nmap <silent> <leader>rn :call LanguageClient_textDocument_rename()<CR>
nmap <silent> <A-F6> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <C-s> :call LanguageClient_textDocument_documentSymbol()<CR>
nmap <silent> <leader>f :call LanguageClient_textDocument_formatting()<CR>
vnoremap <silent> <leader>f :call LanguageClient_textDocument_rangeFormatting()<CR>
nmap <silent> <leader>ca :call LanguageClient_textDocument_codeAction()<CR>
" caller
nn <silent> gc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
" callee
nn <silent> gC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>
nn <silent> <A-F7> :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>

" ncm2
"let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so'
"let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so.6'
"let g:ncm2_pyclang#database_path = [
"            \ 'compile_commands.json',
"            \ 'build/compile_commands.json'
"            \ ]
"let g:ncm2_pyclang#source = {'complete_length': -1}
""let g:ncm2#complete_delay=180
""
"let g:ale_c_build_dir_names = ['build', 'release', 'debug']
"let g:ale_cpp_clangtidy_checks = ['*','-fuchsia-default-arguments', '-google-readability-todo']
"let g:ale_completion_enabled = 1
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'cpp': [],
\}
"let g:deoplete#enable_at_startup = 1

" AutoSave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
