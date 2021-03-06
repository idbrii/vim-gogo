if exists('loaded_gogo') || &cp
	finish
endif
let loaded_gogo = 1

" Quickly launch input data
if has("win32")
    function! s:Gogo(filename)
        let fname = expand(a:filename)
        if len(fname) == 0 || match(fname, "://") > 0
            " Was a url or something else not expandable.
            let fname = a:filename
        endif
        let fname = fnamemodify(fname, ':p')
        " Forwardslashes are great, but old versions of cmd.exe won't handle
        " them. Convert to backslash.
        if &shellslash
            let fname = substitute(fname, '/', '\\', 'g')
        endif
        " ! will expand #/% to filenames, but we already tried expanding
        " above. We might have a url with #, so escape to prevent expansion.
        let fname = escape(fname, '#%')
        exec '! start "" "'. fname .'"'
    endfunction
    command! -nargs=1 Gogo silent call s:Gogo("<args>")
elseif has("macunix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 Gogo ! open <args>
elseif has("unix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 Gogo ! xdg-open <args>
endif

" Separate command with completion so vim doesn't try to force Gogo commands
" to be a file. (Fails on E480 on urls containing '?'.)
command! -nargs=1 -complete=file GogoFile Gogo <args>

