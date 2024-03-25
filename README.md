# neodent.nvim
Neodent is a very simple Neovim plugin that allows you to set and manage indentation of a specific file extension without writing verbous commands. it still follows the original commands like tabstop, softtabstop. 
shiftwidth, expandtab, smarttab. 

I also want to add that this is my first neovim plugin and I hope I can go further.

`
note: situation like (expandtab | noexpandtab) it must be implemented this way (expandtab = true | false).
`

## Quickstart
### Example for Lazy:
``` lua
{
  "ochi12/neodent.nvim",
  config = function()
    require("neodent").setup({
      ["js,lua] = {
        tabstop    = 10,
        shiftwidth = 10,
        expandtab  = true,
      },
    })
  end
}
```
### Example for packer:
``` lua
use {
  "ochi12/neodent.nvim",
  config = function()
    require("neodent").setup({
      ["js,lua"] = {
        tabstop    = 10,
        shiftwidth = 10,
        expandtab  = true,
      },
    })
  end
}
```
