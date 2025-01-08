return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        model = "claude-3.5-sonnet",
      })
      vim.keymap.set("n", "<leader>cco", "<cmd>CopilotChatOpen<CR>", { desc = "Open Copilot Chat window" })
      vim.keymap.set("n", "<leader>ccx", "<cmd>CopilotChatClose<CR>", { desc = "Close Copilot Chat window" })
      vim.keymap.set("n", "<leader>ccc", "<cmd>CopilotChatReset<CR>", { desc = "Clear Copilot Chat hisory" })
    end,
  },
}
