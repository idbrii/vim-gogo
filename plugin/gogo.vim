if exists('loaded_gogo') || &cp
	finish
endif
let loaded_gogo = 1

" Quickly launch input data
if has("win32")
    if &shellslash
        " Forwardslashes are great, but cmd.exe won't handle them. Convert to 
        " backslash.
        function s:Gogo(filename)
            let fname = substitute(fnamemodify(a:filename, ':p'), '/', '\\', 'g')
            exec '! start '. fname
        endfunction
        command! -nargs=1 -complete=file Gogo call s:Gogo("<args>")
    else
        command! -nargs=1 -complete=file Gogo ! start <args>
    endif
elseif has("macunix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 -complete=file Gogo ! open <args>
elseif has("unix")
    " TODO: Does this work as expected? Does it need q-quoting?
    command! -nargs=1 -complete=file Gogo ! xdg-open <args>
endif

