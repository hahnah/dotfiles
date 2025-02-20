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
      vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat window" })
      vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatReset<CR>", { desc = "Reset Copilot Chat context" })
    end,
  },
}
