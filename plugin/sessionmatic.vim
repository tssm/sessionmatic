if exists('g:sessionmatic_loaded')
	finish
endif
let g:sessionmatic_loaded = 1

function! s:loadSession()
	if !argc() && filereadable('Session.vim')
		source Session.vim
	endif
endfunction

augroup LoadSessionAutomatically
  autocmd!
  autocmd DirChanged,VimEnter * nested call s:loadSession()
augroup END

function! s:saveSession()
	if exists('v:this_session') && filewritable(v:this_session)
		mksession!
	endif
endfunction

augroup SaveSessionAutomatically
	autocmd!
	autocmd VimLeavePre * call s:saveSession()
augroup END
