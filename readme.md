# vim-scm(Simple Configuration Manager)
`vim-scm` is a vim plugins collction and configuration for different vim
versions and platforms. It keeps simple frame nearly do nothing! (:D)

`vim-scm` consists of a series of vim scripts, these scripts contains the plugins
 that to be installed and corresponding configuration. These configuration are 
wortten by functions to be more clear.

Anyway, `vim-scm` is simple vim configuration manager, and users could use subsets
directly, make vim configuration more simple

Only linux/vim8.1 are well tested(becase it's my platform), so I can't not
provide other configration

# install and usage
`vim-scm` use [vim-plug](https://github.com/junegunn/vim-plug) as vim plugin
manager. we should install it first.

Then donwload the whole repo, and put it under a local direcotry, for example:
`~/.vim/vim_scm`, and then put fellowing in your `vimrc`:
```
let g:mapleader=','
source ~/.vim/vim_scm/scm.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_config_simple.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_core.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_basic.vim
call scm#plug('~/.vim/plugged')
```
And then open the vim(some error will appear, ignore them) and type:
```
:PlugInstall
```
it will load `scm_config_simple.vim` , `scm_core.vim` and `scm_basic.vim` and
then install plugin and some configuration

# End
Actullay, `vim-scm` is inspaired by the `layer` concept of `Spacevim`, however,
`SpaceVim` is too complicated to configure. so I create a a simple `layers`
manager for `vim`.
