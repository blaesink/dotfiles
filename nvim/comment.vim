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
        
        " Match on the filetype
        let l:ftype = Get_File_Family(expand('%:e'))
        :call Handle_Comment_Extension(l:ftype)
endfu!

" Uncomment a line
fu! Uncomment()
        :norm ^
        " Delete until the first space char, which should uncomment the line
        " if you don't have anything else set to your comment...
        execute "norm df "
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
