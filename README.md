vim-gogo
========

Open anything on any platform with the right program.

Use the `:Gogo` command to open files, URLS, etc in the associated program.

Use the `gogo` alias to do the same from your shell.

Optional Configuration
======================

vimrc:
```vim
" Use gogo with fugitive's Gbrowse:
command! -nargs=1 Browse Gogo <args>
```

bash_aliases:
```bash
# Setup platform-specific gogo alias.
source ~/.vim/bundle/gogo/bin/gogo_alias.bash
```

