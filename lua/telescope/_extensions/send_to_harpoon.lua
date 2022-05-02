local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local has_harpoon_mark, harpoon_mark = pcall(require, "harpoon.mark")
if not has_harpoon_mark then
    error("This plugin requires theprimeagen/harpoon")
end

local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local from_entry = require("telescope.from_entry")

local get_selections = function(prompt_bufnr)
    local picker = actions_state.get_current_picker(prompt_bufnr)
    local selections = {}

    if #picker:get_multi_selection() > 0 then
        selections = picker:get_multi_selection()
    else
        table.insert(selections, actions_state.get_selected_entry())
    end

    return selections
end

local send_selected_to_harpoon = function(prompt_bufnr)
    local selections = get_selections(prompt_bufnr)

    for _, entry in ipairs(selections) do
        local filename = from_entry.path(entry, false, false)

        if filename then
            harpoon_mark.add_file(filename)
        end
    end

    actions.close(prompt_bufnr)
end

return telescope.register_extension({
    exports = {
        actions = {
            send_selected_to_harpoon = send_selected_to_harpoon
        }
    }
})
