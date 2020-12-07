" Return the next highest directory that has a .git directory
" With hope it's the project root
fu! Parent_Git_Directory()
        return finddir(".git/..", expand("%:p:h").";")
endfu!

" TODO
fu! VimGit()
        let l:git_dir = Parent_Git_Directory()
endfu!
