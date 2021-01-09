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

Alternatives
============

[open-browser.vim](https://github.com/tyru/open-browser.vim)
is a comprehensive (but significantly more complex) alternative for opening
files and urls from vim. It can also be used as a replacement for netrw's `gx`:

```vim
" Use open-browser with fugitive's Gbrowse:
command! -nargs=1 Browse OpenBrowser <args>

" Replace netrw gx with open-browser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Add to ~/.vim/autoload/netrw.vim for plugins that expect netrw to be
" installed.
function! netrw#BrowseX(url, ignored) abort
    call OpenBrowser(a:url)
endf
```
