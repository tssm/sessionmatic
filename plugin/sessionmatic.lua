local _2afile_2a = "plugin/sessionmatic.fnl"
local cmd = vim.cmd
local f = vim.fn
Sessionmatic = {}
local function load()
  local session_file = "Session.vim"
  if ((f.argc(-1) == 0) and (f.filereadable(session_file) == 1)) then
    return cmd(string.format("source %s", session_file))
  else
    return nil
  end
end
Sessionmatic.load = load
local function save()
  local this_session = vim.v.this_session
  if ((this_session ~= null) and (f.filewritable(this_session) == 1)) then
    return cmd(string.format("mksession! %s", this_session))
  else
    return nil
  end
end
Sessionmatic.save = save
cmd("augroup Sessionmatic")
cmd("autocmd!")
cmd("autocmd DirChanged,VimEnter * nested lua Sessionmatic.load()")
cmd("autocmd VimLeavePre * lua Sessionmatic.save()")
return cmd("augroup END")