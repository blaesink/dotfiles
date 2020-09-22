"==== Netrw Settings ====
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let g:netrw_fastbrowse = 2
let g:netrw_altfile = 1
nnoremap <Leader>[ <C-^>

" ==== User Settings ====
syntax on
let mapleader=" "

set conceallevel=2
"set cursorline
set expandtab
set nohls
set number
set inccommand=split
set fillchars-=vert:\| | set fillchars+=vert:\ 

" ==== User Keybinds ====
nnoremap ; :
nnoremap ! :!
nnoremap <Leader>n :tabnew<CR>
nnoremap <Tab><Tab> gt
nnoremap <S-Tab> gT
nnoremap %% :so %<CR>

" ==== Emacs Evil Bindings ====
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wc :q<CR>
nnoremap <Leader>cc :q!<CR>
nnoremap <Leader>qa :qa!<CR>
nnoremap <Leader>wv :vs<CR><C-w>l
nnoremap <Leader>ws :sp<CR><C-w>j

 
"let g:ranger_map_keys = 0
"nnoremap <Leader>. :Ranger<CR>
nnoremap <Leader>. :Ex<CR>

" ==== Quick movement ====
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap H ^
nnoremap L $

tnoremap <ESC> <C-\><C-n>

inoremap jj <ESC>
inoremap {<CR> {<CR>}<ESC>O
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" ==== Build Commands ====
au FileType c nnoremap <Leader>b :!cc -Wall % -o %< && ./%< <CR>
au FileType c nnoremap <Leader>c :!cc -Wall % -o %< <CR>
au FileType cpp nnoremap <Leader>b :!cc % -o %< && ./%<<CR>
au FileType cpp nnoremap <Leader>c :!cc % -o %< <CR>
au FileType python nnoremap <Leader>b :!python % <CR>
au FileType rust nnoremap <Leader>b :!cargo run --release<CR>
au FileType rust nnoremap <Leader>c :!cargo build --release<CR>
"au FileType go nnoremap <Leader>r :!go build % && ./%<<CR>
au FileType go nnoremap <Leader>r :!go run %<CR>
au FileType go nnoremap <Leader>c :!go build %<CR>
au FileType * nnoremap <Leader>m :!make<CR>


" ==== Quality of Life Shortcuts ====
au filetype go inoremap p! fmt.Println(
au filetype go inoremap sp! fmt.Sprintf(
au filetype python inoremap p! print(
au FileType rust inoremap p! println!(


" ==== Ruler for certain languages ====
"au FileType python set colorcolumn=79
"au FileType python highlight ColorColumn ctermbg=255 guibg=#ed11ba


" ==== Statusline ====
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %y
set statusline+=%=
set statusline+=\%L
set statusline+=\|%c


" ==== Plugins ====
"call plug#begin('~/.vim/plugged')
"Plug 'rbgrouleff/bclose.vim'
"Plug 'francoiscabrol/ranger.vim'
"call plug#end()

" ==== Disable Autocomment ====
autocmd BufNewFile,BufRead * setlocal fo-=cro

fu! Monad_Split()
        :vs
        wincmd l
        :sp
        wincmd h
endfu

nnoremap <Leader>mo :call Monad_Split()<CR>

" ==== Tab Autocomplete ====
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction

