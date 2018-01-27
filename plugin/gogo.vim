if exists('loaded_gogo') || &cp
	finish
endif
let loaded_gogo = 1

" Quickly launch input data
if has("win32")
    function! s:Gogo(filename)
        let fname = fnamemodify(a:filename, ':p')
        " Forwardslashes are great, but old versions of cmd.exe won't handle
        " them. Convert to backslash.
        if &shellslash
            let fname = substitute(fname, '/', '\\', 'g')
        endif
        exec '! start "" "'. fname .'"'
    endfunction
    command! -nargs=1 -complete=file Gogo silent call s:Gogo("<args>")
elseif has("macunix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 -complete=file Gogo ! open <args>
elseif has("unix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 -complete=file Gogo ! xdg-open <args>
endif

