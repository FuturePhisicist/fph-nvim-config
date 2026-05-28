return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
      lombok = {
        enable = false,
      },
    })
    vim.lsp.enable('jdtls')
  end,
}
