" = Netrw Settings =
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let g:netrw_fastbrowse = 2
let g:netrw_altfile = 1

" Go back to the previous
nnoremap <Leader>[ <C-^>

" = User Settings =

" Show all those nice colors from your theme
syntax on

" Disable automatic comments on new lines
autocmd BufNewFile,BufRead * setlocal fo-=cro

" Space is a really fast & conventient leader
let mapleader=" "

" Concealed text is hidden when not on the same line
set conceallevel=2

" Highlight the line you're on
set cursorline

" Tabs are instead just a bunch of spaces, but you hit tab
set expandtab

" Don't show every result of a search (don't behave like findall)
set nohls

" Show line numbers!
set number

" Show partial result of commands in a preview window
set inccommand=split
set fillchars-=vert:\| | set fillchars+=vert:\ 

" = User Keybinds =

" Colon is faster!
nnoremap ; :

" Some fast shortcuts
nnoremap ! :!
nnoremap %% :so %<CR>

" Line movement
nnoremap <A-j> ddjP

" = Doom Emacs-y Keybinds =

" Tab behavior
nnoremap <Leader><Tab>] gt
nnoremap <Leader><Tab>[ gT
nnoremap <Leader><Tab>n :tabnew<CR>
nnoremap <Leader><Tab><Tab> :call Tab_Switch()<CR>
nnoremap <Leader><Tab>d :tabclose<CR>

" Buffer behavior
nnoremap <Leader>b[ :bp<CR>
nnoremap <Leader>b] :bn<CR>
nnoremap <C-x>k :call Buff_Kill()<CR>
nnoremap <Leader><Leader> :call Buff_Switch()<CR>

" Window/Split Management
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wc :q<CR>
nnoremap <Leader>cc :q!<CR>
nnoremap <Leader>qa :qa!<CR>
nnoremap <Leader>wv :vs<CR><C-w>l
nnoremap <Leader>ws :sp<CR><C-w>j

" Comment/Uncomment
nnoremap <Leader>/ :call Comment_Line()<CR>

" Go to definition
nnoremap <Leader>gd :call Go_To_Def()<CR>
nnoremap <Leader>gD :call Find_References()<CR>

" File Management
"nnoremap <Leader>. :Ranger<CR>
nnoremap <Leader>. :Ex<CR>

" = Quick movement =

" Move between windows faster
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Go to the beginning and end of a line faster
nnoremap H ^
nnoremap L $

" I actually don't remember what this does
tnoremap <ESC> <C-\><C-n>

" Get into normal mode on the homerow
inoremap jj <ESC>

" For multiline functions, dictionaries etc.
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O

" C-n/C-p is a horrible autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" = Build Commands =

" C/C++
au FileType c nnoremap <Leader>b :!cc -Wall % -o %< && ./%< <CR>
au FileType c nnoremap <Leader>c :!cc -Wall % -o %< <CR>
au FileType cpp nnoremap <Leader>b :!cc % -o %< && ./%<<CR>
au FileType cpp nnoremap <Leader>c :!cc % -o %< <CR>

" === Python ===
au FileType python nnoremap <Leader>r :!python % <CR>
au FileType python nnoremap <Leader>t :!pytest -vv<CR>

" == Rust ==
au FileType rust nnoremap <Leader>br :!cargo build --release<CR>
au FileType rust nnoremap <Leader>bb :!cargo build<CR>
au FileType rust nnoremap <Leader>r :!cargo run --release<CR>
au FileType rust nnoremap <Leader>c :!cargo build --release<CR>
au FileType rust nnoremap <Leader>t :!cargo test<CR>

" == Go ==
"au FileType go nnoremap <Leader>r :!go build % && ./%<<CR>
au FileType go nnoremap <Leader>r :!go run %<CR>
au FileType go nnoremap <Leader>c :!go build %<CR>

" General Build Commands
au FileType * nnoremap <Leader>m :!make<CR>
au FileType * nnoremap <Leader>mc :!make clean<CR>
au FileType * nnoremap <Leader>mm :!make 

" = Quality of Life Shortcuts =

" == Go ==
au filetype go inoremap p! fmt.Println(
au filetype go inoremap sp! fmt.Sprintf(

" == Python ==
au filetype python inoremap p! print(

" == Rust ==
au FileType rust inoremap p! println!(

" == C/C++ ==
au FileType c inoremap p! printf("")<ESC>hi

" = Ruler for certain languages =
"au FileType python set colorcolumn=79
"au FileType python highlight ColorColumn ctermbg=255 guibg=#ed11ba

" = Statusline =
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %y
set statusline+=%=
set statusline+=\%L
set statusline+=\|%c

" = Plugins =
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'mileszs/ack.vim'
call plug#end()

" == Color Settings (from plugins) ==
set termguicolors
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" == Search with Ag (the silver searcher) ==

" Use ack.vim, but set the executable to ag
if executable('ag')
        let g:ackprg='ag'
endif

" = Functions =
" Beware, some of these may be barbaric in implementation

" A master-stack XMonad-stye window layout
fu! Monad_Split()
        :vs
        wincmd l
        :sp
        wincmd h
endfu

" Caveman-style dired clone
fu! Buff_Switch()
        :ls<CR>
        let l:buff_no = input("Enter the buffer you want to change to: ")
        if l:buff_no
                execute "buffer" l:buff_no
        endif
endfu!

" Caveman-style emacs buffer kill
fu! Buff_Kill()
        :ls<CR>
        let l:kill_buff_no = input("Enter the buffer you want to kill: ")
        if l:kill_buff_no
                execute "bd" l:kill_buff_no
        endif
endfu!

" Tab Autocomplete 
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction!

" Caveman Doom-Emacs tab switching
" TODO make this nicer, maybe even list the possible tabs
fu! Tab_Switch()
        let l:buff_no = input("")
        if l:buff_no
                execute "tabn" l:buff_no
        endif
endfu!

" Comment and uncomment lines!
fu! Comment_Line()
        " Make sure that the beginning of the line isn't a comment, if so,
        " uncomment it
        if len(getline('.')) ==? 0
                echo "Cannot comment empty line!"
                return
        endif
        if Is_Commented()
                :call Uncomment()
                return
        endif
        
        " Get the current line
        let l:extensions = { 'oct': ['py', 'sh', 'rb', 'fish'], 'clike': ['cpp', 'c', 'h', 'hpp', 'rs', 'js', 'jsx'], 'vim': ['vim'], 'lisp': ['el']}
        let l:buff_ext = expand('%:e') " Extension

        " Match on the filetype
        for ftype in keys(l:extensions)
                for ext in l:extensions[ftype]
                        if l:buff_ext ==? ext
                                :call Handle_Comment_Extension(ftype)
                        endif
                endfor
        endfor
endfu!

" Uncomment a line
fu! Uncomment()
        :norm ^df 
        :norm $
endfu

" Check to see if a line is commented
fu! Is_Commented()
        let l:comment_chars = ['#', '/', '"']
        " Go to beginning of the line. The next two lines are not elegant.
        " There should be a nicer way to do this
        :norm ^ 
        let l:first_char = getline('.')[getpos('.')[2]-1] " Seems pretty barbaric but this works
        for char in l:comment_chars
                if l:first_char ==? char
                        return 1
                endif
        endfor
endfu!

" I wish case was a thing
fu! Handle_Comment_Extension(ftype)
        " Super shitty if-else incoming
        if a:ftype ==? 'clike'
                :norm I// 
                :norm $
        elseif a:ftype ==? 'oct'
                :norm I# 
                :norm $
        elseif a:ftype ==? 'vim'
                :norm I" 
                :norm $
        elseif a:ftype ==? 'lisp'
                :norm I; 
                :norm $

        endif
endfu!

" Go to function/class definition for text under cursor.
fu! Go_To_Def()
        let l:search_term = expand("<cword>")
        " Search for the keyword and the search term in the buffer
        if Find_In_Buffer(l:search_term)
                " Go to the line in the buffer
                :norm Find_In_Buffer(l:search_term) G
        else
                " Use an external
                :call Find_In_Files(l:search_term)
        endif
endfu!

" Find a term in buffer without using Ack/Ag/etc
fu! Find_In_Buffer(term)
        let l:func_def_keywds = ['def', 'fn', 'fu!', 'function!', 'function', 'class', 'struct'] " C like stuff will have to be handled later

        for keywd in l:func_def_keywds
                if search(keywd . " " . a:term)
                        let l:line_no = search(keywd . " " . a:term)
                        return l:line_no
                endif
        endfor
        return 0 " Fail
endfu!

" Find a search term in other files using Ack/Ag
fu! Find_In_Files(term)
        let l:buff_ext = expand('%:e')
        let l:keywds = {"py": ['def', 'class'], "clike": ['fn', 'struct', 'enum']}
        for ext in keys(l:keywds)
                if l:buff_ext ==? ext
                        for keywd in l:keywds[ext]
                                let l:search_term = keywd . " " . a:term
                                exec "Ack" . " \"" . l:search_term . "\" ."
                        endfor
                endif
        endfor
        :clo
        return
endfu!

" Find references of a search term
fu! Find_References()
        let l:search_term = expand("<cword>")
        exec "Ack!" . " \"" . l:search_term . "\" ."
endfu!
