# telescope-send-to-harpoon.nvim

Custom [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) action for sending selections to [harpoon](https://github.com/theprimeagen/harpoon).

## Requirements

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (required)
- [harpoon](https://github.com/theprimeagen/harpoon) (required)

## Setup

```viml
Plug 'asbjornhaland/telescope-send-to-harpoon.nvim'
```

Load the extension by doing:

```lua
require('telescope').load_extension('send_to_harpoon')
```

somewhere after your require('telescope').setup() call.

Add a keyboard shortcut to execute the action call.

```lua
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon
      },
    }
  },
}
```
