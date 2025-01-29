# org_to_md.nvim

A Neovim plugin that converts text from Org-mode format to Markdown and copies it to the clipboard.

## Installation

### Using Lazy.nvim

```lua
{
    "chutipascal/org_to_md.nvim",
    config = function()
        require("org_to_md").setup()
    end
}
```

### Using Packer.nvim

```lua
use {
    "chutipascal/org_to_md.nvim",
    config = function()
        require("org_to_md").setup()
    end
}
```

### Manual Installation

```sh
git clone https://github.com/chutipascal/org_to_md.nvim ~/.config/nvim/lua/org_to_md
```

Then add to your `init.lua`:

```lua
require("org_to_md").setup()
```

## Usage

1. Select text in Org-mode in **visual mode** (`v`).
2. Run the command:
   ```
   :CopyOrgToMd
   ```
3. The text converted to Markdown will be copied to the clipboard.

## License

MIT License.

