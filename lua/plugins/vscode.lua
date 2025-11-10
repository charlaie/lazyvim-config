if not vim.g.vscode then
  return {}
end

local vscode = require("vscode")
local keymap = vim.keymap.set

vim.o.cmdheight = 100
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- Navigation
    keymap("n", "H", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>", { desc = "Next Editor" })
    keymap("n", "L", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>", { desc = "Prev Editor" })
    -- Window size control
    keymap(
      "n",
      "<C-Up>",
      "<cmd>call VSCodeNotify('workbench.action.increaseViewHeight')<cr>",
      { desc = "Increase window height" }
    )
    keymap(
      "n",
      "<C-Down>",
      "<cmd>call VSCodeNotify('workbench.action.decreaseViewHeight')<cr>",
      { desc = "Decrease window height" }
    )
    keymap(
      "n",
      "<C-Right>",
      "<cmd>call VSCodeNotify('workbench.action.increaseViewWidth')<cr>",
      { desc = "Increase window width" }
    )
    keymap(
      "n",
      "<C-Left>",
      "<cmd>call VSCodeNotify('workbench.action.decreaseViewWidth')<cr>",
      { desc = "Decrease window width" }
    )

    -- Find and replace word under cursor
    keymap({ "n", "v" }, "<leader>sr", function()
      local word = vim.fn.expand("<cword>")
      vscode.action("editor.action.startFindReplaceAction", {
        args = { query = word },
      })
    end, { desc = "Find and replace word under cursor" })
    -- Search in files with word under curor
    keymap("n", "<leader>sf", function()
      local word = vim.fn.expand("<cword>")
      vscode.action("workbench.action.findInFiles", {
        args = { query = word },
      })
    end, { desc = "Search word in files" })

    -- Search in files with visual selection
    keymap("v", "<leader>/", function()
      vscode.action("workbench.action.findInFiles")
    end, { desc = "Search selected text in files" })
    keymap("v", "<leader>sf", function()
      vscode.action("workbench.action.findInFiles")
    end, { desc = "Search selected text in files" })

    -- Code actions
    keymap({ "n", "x" }, "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>", { desc = "Quick Fix" })
    keymap({ "n", "x" }, "<leader>cr", "<cmd>call VSCodeNotify('editor.action.rename')<cr>", { desc = "Rename Symbol" })
    keymap({ "n", "x" }, "<leader>cR", "<cmd>call VSCodeNotify('renameFile')<cr>", { desc = "Rename File" })
    keymap("n", "<leader>cf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { desc = "Format" })
    keymap(
      "v",
      "<leader>cf",
      "<cmd>call VSCodeNotify('editor.action.formatSelection')<cr>",
      { desc = "Format Selection" }
    )
    keymap(
      "n",
      "<leader>cd",
      "<cmd>call VSCodeNotify('editor.action.organizeImports')<cr>",
      { desc = "Organize Imports" }
    )

    -- Go to problems
    keymap("n", "]d", "<cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<cr>", { desc = "Prev Diagnostic" })
    keymap("n", "[d", "<cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<cr>", { desc = "Next Diagnostic" })

    -- Buffers
    keymap(
      "n",
      "<leader>e",
      "<cmd>call VSCodeNotify('workbench.explorer.fileView.focus')<cr>",
      { desc = "Focus explorer view" }
    )
    keymap(
      "n",
      "<leader>,",
      "<cmd>call VSCodeNotify('workbench.action.quickOpen', 'edt active ')<cr>",
      { desc = "Focus active editors" }
    )

    -- Search symbol by type
    keymap("n", "<leader>ss", "<cmd>call VSCodeNotify('workbench.action.quickOpen', '@:')<cr>")
    keymap("n", "<leader>sS", "<cmd>call VSCodeNotify('workbench.action.showAllSymbols')<cr>")

    -- Files
    keymap("n", "<leader>fo", "<cmd>call VSCodeNotify('workbench.action.files.openFile')<cr>", { desc = "Open File" })
    keymap(
      "n",
      "<leader>fn",
      "<cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<cr>",
      { desc = "New File" }
    )
    keymap("n", "<leader>fp", function()
      vscode.action("workbench.action.openRecent")
    end, { desc = "Open Recent Projects" })
    keymap("n", "<leader>fr", function()
      vscode.action("workbench.action.openRecent")
    end, { desc = "Open Recent Projects" })

    -- Git
    keymap("n", "<leader>gs", function()
      vscode.action("workbench.view.scm")
    end, { desc = "Open source control" })
    keymap("v", "gS", function()
      vscode.action("git.stageSelectedRanges")
    end, { desc = "Stage selected lines" })
    -- Go to hunks
    keymap("n", "]h", function()
      vscode.action("workbench.action.compareEditor.nextChange")
      vscode.action("workbench.action.editor.nextChange")
    end, { desc = "Next hunk" })
    keymap("n", "[h", function()
      vscode.action("workbench.action.compareEditor.previousChange")
      vscode.action("workbench.action.editor.previousChange")
    end, { desc = "Previous hunk" })

    -- Zen mode
    keymap("n", "<leader>uz", function()
      vscode.action("workbench.action.toggleZenMode")
    end, { desc = "Toggle Zen mode" })

    -- Emmet
    keymap({ "n", "v" }, "<leader>xe", function()
      vscode.action("editor.emmet.action.wrapWithAbbreviation")
    end, { desc = "Emmet wrap with abbrevication" })
    keymap({ "n", "v" }, "<leader>xd", function()
      vscode.action("editor.emmet.action.removeTag")
    end, { desc = "Emmet remove tag" })
  end,
})
return {}
