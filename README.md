# project.nvim
Project management using Ido.

## Install
Make sure [ido-nvim/ido.nvim](https://github.com/ido-nvim/ido.nvim) is installed.

Use your plugin manager of choice to install this plugin

| Plugin manager                                    | Command                                    |
| ------------------------------------------------- | ------------------------------------------ |
| [Vim Plug](https://github.com/junegunn/vim-plug)  | `Plug 'ido-nvim/project.nvim'`             |
| [Vundle](https://github.com/VundleVim/Vundle.vim) | `Plugin 'shoumodip/project.nvim'`          |
| [Dein](https://github.com/Shougo/dein.vim)        | `call dein#add('ido-nvim/project.nvim')`   |
| [Minpac](https://github.com/k-takata/minpac)      | `call minpac#add('ido-nvim/project.nvim')` |

Or use the builtin packages feature

```console
$ cd ~/.config/nvim/pack/plugins/start
$ git clone https://github.com/ido-nvim/project.nvim
```

## Usage
Set the root directory where projects will be searched. Default is `~/code`.

```lua
require("ido.project").root = "~/programming"
```

| Command                   | Description                                    |
| ------------------------- | ---------------------------------------------- |
| `:Ido project.open`       | Open a project                                 |
| `:Ido project.find_files` | Find files recursively in the current project  |
| `:Ido project.buffer`     | Switch buffers in the current project          |
| `:Ido project.select`     | Select a project                               |
