# Cool Neovim Things 

<div>
  <img src="https://github.com/olgam4/nvim/blob/main/assets/neovim-logo.png?raw=true" width="180" />
  <img src="https://github.com/olgam4/nvim/blob/main/assets/nvim.png?raw=true" width="700" />
</div>

## Requirements

* [neovim](https://github.com/neovim/neovim) 
* [neovide](https://github.com/neovide/neovide) (Optional)
* [code-minimap](https://github.com/wfxr/code-minimap)
* [neuron](https://github.com/srid/neuron/releases)

## After Cloning

Run :

``` vimscript
" source it :)
:PackerSync
:PackerInstall
```

## Setup your first language server

### First, install the language server

```
:LspInstall <server>
```

From [lspinstall](https://github.com/kabouzeid/nvim-lspinstall)

### Then, install the formatter

```
luarocks install --server=https://luarocks.org/dev luaformatter
```

### And add its run usage

Add it in `lua/plugins/formatter`

## TODO
- [x] snippets -> now using [vsnip](https://github.com/hrsh7th/vim-vsnip)
- [x] look into [neuron](https://github.com/oberblastmeister/neuron.nvim) 
  - [ ] stay up to date with [issue #36](https://github.com/oberblastmeister/neuron.nvim/issues/36)
- [ ] look into [instant](https://github.com/jbyuki/instant.nvim) for LiveSharing
- [ ] look into [dial](https://github.com/monaqa/dial.nvim) for cool incrementing
- [ ] look into [vmenu](https://github.com/nathanielsimard/vmenu) for emac like menu

