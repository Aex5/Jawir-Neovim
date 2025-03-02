return {
  {
    "junegunn/vim-easy-align",
    config = function()
      -- Keymap untuk align "="
      vim.api.nvim_set_keymap("x", "ga=", "<Plug>(EasyAlign)=", { noremap = false, silent = true })
    end
  }
}

