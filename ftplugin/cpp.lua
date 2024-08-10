vim.bo.commentstring = "// %s"

function _G.run_commands_in_terminal()
    local term = require("toggleterm.terminal").Terminal:new({
        cmd = "cmake -S . -B build && cmake --build build && cmake --build build --target run", -- Comandos a ejecutar
        hidden = true,
    })
    term:toggle()
end

-- Mapea F5 para abrir la terminal y ejecutar comandos
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua run_commands_in_terminal()<CR>", {noremap = true, silent = true})
