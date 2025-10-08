if not vim.g.vscode then
  return {}
end

local vscode = require('vscode')

vim.o.cmdheight = 100
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- Navigation
    vim.keymap.set("n", "H", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>",
      { desc = "Next Editor" })
    vim.keymap.set("n", "L", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>",
      { desc = "Prev Editor" })

    -- Find and replace word under cursor
    vim.keymap.set('n', '<leader>sr', function()
      local word = vim.fn.expand('<cword>')
      vscode.action('editor.action.startFindReplaceAction', {
        args = { query = word }
      })
    end, { desc = 'Find and replace word under cursor' })
    -- Search in files with word under curor
    vim.keymap.set('n', '<leader>sf', function()
      local word = vim.fn.expand('<cword>')
      vscode.action('workbench.action.findInFiles', {
        args = { query = word }
      })
    end, { desc = 'Search word in files' })

    -- Search in files with visual selection
    vim.keymap.set('v', '<leader>/', function()
      vscode.action('workbench.action.findInFiles')
    end, { desc = 'Search selected text in files' })
    vim.keymap.set('v', '<leader>sf', function()
      vscode.action('workbench.action.findInFiles')
    end, { desc = 'Search selected text in files' })

    -- Code actions
    vim.keymap.set({ "n", "x" }, "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>",
      { desc = "Quick Fix" })
    vim.keymap.set({ "n", "x" }, "<leader>cr", "<cmd>call VSCodeNotify('editor.action.rename')<cr>",
      { desc = "Rename Symbol" })
    vim.keymap.set({ "n", "x" }, "<leader>cR", "<cmd>call VSCodeNotify('renameFile')<cr>",
      { desc = "Rename File" })
    vim.keymap.set("n", "<leader>cf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>",
      { desc = "Format" })
    vim.keymap.set("v", "<leader>cf", "<cmd>call VSCodeNotify('editor.action.formatSelection')<cr>",
      { desc = "Format Selection" })
    vim.keymap.set("n", "<leader>cd", "<cmd>call VSCodeNotify('editor.action.organizeImports')<cr>",
      { desc = "Organize Imports" })

    -- Go to problems
    vim.keymap.set("n", "]d", "<cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<cr>",
      { desc = "Prev Diagnostic" })
    vim.keymap.set("n", "[d", "<cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<cr>",
      { desc = "Next Diagnostic" })

    -- Buffers
    vim.keymap.set("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.explorer.fileView.focus')<cr>",
      { desc = "Focus explorer view" })
    vim.keymap.set("n", "<leader>,", "<cmd>call VSCodeNotify('workbench.action.quickOpen', 'edt active ')<cr>",
      { desc = "Focus active editors" })

    -- Search symbol by type
    vim.keymap.set("n", "<leader>ss", "<cmd>call VSCodeNotify('workbench.action.quickOpen', '@:')<cr>")
    vim.keymap.set("n", "<leader>sS", "<cmd>call VSCodeNotify('workbench.action.showAllSymbols')<cr>")

    -- Files
    vim.keymap.set("n", "<leader>fo", "<cmd>call VSCodeNotify('workbench.action.files.openFile')<cr>",
      { desc = "Open File" })
    vim.keymap.set("n", "<leader>fn", "<cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<cr>",
      { desc = "New File" })

    -- Git
    vim.keymap.set('n', '<leader>gs', function()
      vscode.action('workbench.view.scm')
    end, { desc = 'Open source control' })
    vim.keymap.set('v', 'gs', function()
      vscode.action('git.stageSelectedRanges')
    end, { desc = 'Stage selected lines' })

    -- Zen mode
    vim.keymap.set('n', '<leader>z', function()
      vscode.action('workbench.action.toggleZenMode')
    end, { desc = 'Toggle Zen mode' })

    -- Emmet
    vim.keymap.set({ 'n', 'v' }, '<leader>xe', function()
      vscode.action('editor.emmet.action.wrapWithAbbreviation')
    end, { desc = 'Emmet wrap with abbrevication' })
  end
})
return {}
