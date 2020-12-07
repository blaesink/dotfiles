" Go to function/class definition for text under cursor.
fu! Go_To_Def()
        let l:search_term = expand("<cword>")
        " Search for the keyword and the search term in the buffer
        if Find_In_Buffer(l:search_term)
                " Go to the line in the buffer
                :norm Find_In_Buffer(l:search_term) G
        else
                " Use an external search program
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
        return
endfu!

" Find a search term in other files using Ack/Ag
fu! Find_In_Files(term)
        let l:ftype = Get_File_Family(expand('%:e'))
        let l:buff_dir = expand('%:p:h')
        let l:keywds = {"py": ['def', 'class'], "clike": ['fn', 'struct', 'enum']}
        for ext in keys(l:keywds)
                if l:ftype ==? ext
                        for keywd in l:keywds[ext]
                                let l:search_term = keywd . " " . a:term
                                exec "Ack" . " \"" . l:search_term . "\" " l:buff_dir
                        endfor
                endif
        endfor
        " Automatically close the result window
        :clo
        return
endfu!

" Find references of a search term
fu! Find_References()
        let l:git_dir = Parent_Git_Directory()
        let l:search_term = expand("<cword>")
        if len(l:git_dir) > 0
                exec "Ack!" . " \"" . l:search_term . "\" " l:git_dir
        endif
endfu!

" Get the family that the file is like
fu! Get_File_Family(ext)
        let l:extensions = { 'oct': ['py', 'sh', 'rb', 'fish'], 'clike': ['cpp', 'c', 'h', 'hpp', 'rs', 'js', 'jsx'], 'vim': ['vim'], 'lisp': ['el']}

        " Match on the filetype
        for ftype in keys(l:extensions)
                for ext in l:extensions[ftype]
                        if a:ext ==? ext
                                return ftype
                        endif
                endfor
        endfor
        return
endfu!
