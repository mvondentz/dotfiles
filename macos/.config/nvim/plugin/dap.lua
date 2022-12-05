local present, dap = pcall(require, "dap")
if not present then
    return
end

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
        name = "dir",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
    },
    {
        type = "delve",
        name = "file",
        request = "launch",
        mode = "test",
        program = "${file}",
    }
}


local present, dapui = pcall(require, "dapui")
if not present then
    return
end

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

