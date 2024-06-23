return {
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      local peek = require("peek")
      peek.setup({
        theme = "dark",
      })
      vim.api.nvim_create_user_command("PeekToggle", function()
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end, {})
      vim.keymap.set("n", "<leader>md", "<cmd>PeekToggle<CR>", { desc = "Toggle markdown preview" })
    end,
  },
}
