local M = {}
local mru = {}

local function track_buf()
    local buf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_get_name(buf):match("%S") then return end
    for i, b in ipairs(mru) do if b == buf then table.remove(mru, i) break end end
    table.insert(mru, 1, buf)
end

vim.api.nvim_create_autocmd("BufEnter", { callback = track_buf })

function M.cycle_mru(dir)
    local cur = vim.api.nvim_get_current_buf()
    for i, b in ipairs(mru) do
        if b == cur then
            local new = mru[(i + dir - 1) % #mru + 1]
            if vim.api.nvim_buf_is_valid(new) then
                vim.api.nvim_set_current_buf(new)
            end
            break
        end
    end
end

return M

