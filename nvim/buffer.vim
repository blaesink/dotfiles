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

" Caveman Doom-Emacs tab switching
" TODO make this nicer, maybe even list the possible tabs
fu! Tab_Switch()
        let l:buff_no = input("")
        if len(l:buff_no) > 0
                execute "tabn" l:buff_no
        endif
endfu!
