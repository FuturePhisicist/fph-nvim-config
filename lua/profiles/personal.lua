local function set_local(opts)
  for k, v in pairs(opts) do vim.opt_local[k] = v end
end

-- C / C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    set_local({
      expandtab = false,    -- keep real tabs
      tabstop = 4,          -- visual width of a <Tab> (adjust if you prefer 8)
      shiftwidth = 0,       -- use 'tabstop' for indentation width
      softtabstop = 0,      -- keep insert/backspace in full tabs
      fixendofline = true,  -- write a final newline at EOF
    })
  end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    set_local({
      shiftwidth = 4,
      tabstop = 4,
      softtabstop = 4,
      expandtab = true,     -- convert tabs to spaces
      fixendofline = true,  -- write a final newline at EOF
    })
  end,
})

