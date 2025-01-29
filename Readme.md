
# org_to_md.nvim

Un plugin para Neovim que convierte texto en formato Org-mode a Markdown y lo copia al portapapeles.

## Instalación

### Usando Lazy.nvim

```lua
{
    "chutipascal/org_to_md.nvim",
    config = function()
        require("org_to_md").setup()
    end
}
```

### Usando Packer.nvim

```lua
use {
    "chutipascal/org_to_md.nvim",
    config = function()
        require("org_to_md").setup()
    end
}
```

### Instalación manual

```sh
git clone https://github.com/chutipascal/org_to_md.nvim ~/.config/nvim/lua/org_to_md
```

Luego en tu `init.lua` agrega:

```lua
require("org_to_md").setup()
```

## Uso

1. Selecciona texto en Org-mode en **modo visual** (`v`).
2. Ejecuta el comando:
   ```
   :CopyOrgToMd
   ```
3. El texto convertido a Markdown se copiará al portapapeles.

## Licencia

MIT License.

