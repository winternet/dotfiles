" Remap <Leader> key to ,
let mapleader = ","

" Unmap the arrow keys
noremap <up> ddkP
noremap <down> ddp
noremap <left> <Nop>
noremap <right> <Nop>

inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>

vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

" intellij-like shortcuts
noremap <c-n> :FZF<CR>
noremap <c-f> :Ag<CR>
noremap <c-t> :Tags<CR>

" nerdtree
map <F2> :NERDTreeToggle %<CR>
" tagbar
" map <F3> :TagbarToggle<CR>
map <F3> :Vista!!<CR>
map <C-G> :Vista finder<CR>
"map <F3> :Vista coc<CR>

" source configuration
noremap <leader>sc <esc>:source $MYVIMRC<CR>

" close all other windows
map <leader>o :only<CR>
nnoremap <silent> <esc> :noh<CR>

" tcomment
vnoremap <c-/> :TComment<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" intellij-like navigation
map <C-A-Left> <C-O>
map <C-A-Right> <C-I>
