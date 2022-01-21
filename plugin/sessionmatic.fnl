(local cmd vim.cmd)
(local f vim.fn)

(global Sessionmatic {})

(fn load []
  (local session-file :Session.vim)
  (when
    (and
      (= (f.argc -1) 0)
      (= (f.filereadable session-file) 1)
      (= vim.v.this_session ""))
    (cmd (string.format "source %s" session-file))))
(set Sessionmatic.load load)

(fn save []
  (local this-session vim.v.this_session)
  (when
    (and
      (not= this-session null)
      (= (f.filewritable this-session) 1))
    (cmd (string.format "mksession! %s" this-session))))
(set Sessionmatic.save save)

(cmd "augroup Sessionmatic")
(cmd :autocmd!)
(cmd "autocmd DirChanged,VimEnter * nested lua Sessionmatic.load()")
(cmd "autocmd VimLeavePre * lua Sessionmatic.save()")
(cmd "augroup END")
