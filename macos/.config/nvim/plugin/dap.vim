"Delve Remaps
au FileType go nnoremap <Leader>ha :DapToggleBreakpoint <CR>
au FileType go nnoremap <Leader>hc :DapContinue <CR>
au FileType go nnoremap <Leader>ho :DapStepOut <CR>
au FileType go nnoremap <Leader>hn :DapStepOver <CR>
au FileType go nnoremap <Leader>hi :DapStepIn <CR>
au FileType go nnoremap <Leader>hq :DapTerminate <CR>

lua << EOF

local dap = require('dap')
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug Dir",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  {
    type = "delve",
    name = "Debug File",
    request = "launch",
    mode = "test",
    program = "${file}",
  }
}


local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

EOF
