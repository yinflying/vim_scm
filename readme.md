# vim-scm(Simple Configuration Manager)
`vim-scm` is a vim plugins collction and configuration for different vim
versions and platforms. It keeps simple frame nearly do nothing! (:D)

`vim-scm` consists of a series of vim scripts, these scripts contains the plugins
 that to be installed and corresponding configuration. These configuration are 
wortten by functions to be more clear.

Anyway, `vim-scm` is simple vim configuration manager, and users could use subsets
directly, it is both simple to use and share your configuration.

Only linux/vim8.1 are well tested(becase it's my platform, and I use the the
configuration daily), if the repo configuration do not meet your requirement
(of course, almost not) you may create your personal configuration under scm frame.
(it is a simple thing), and commit Pull request.

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
NOTE: If you have some own configuration under `~/.vimrc`, you'd better remove
them all(And then add them after scm script working).

And then open the vim(some error will appear, ignore them) and type:
```
:PlugInstall
```
it will load `scm_config_simple.vim` , `scm_core.vim` and `scm_basic.vim` and
then install some plugins with configuration.

## linux user(vim)
As a linux user, you only need to run command as fellow:
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ cd ~/.vim
$ git clone https://github.com/yinflying/vim_scm.git
```
and then put the configration as fellow to `~/.vimrc`:
```
let g:mapleader=','
source ~/.vim/vim_scm/scm.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_config_simple.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_core.vim
Scmsource ~/.vim/vim_scm/linux/vim81/scm_basic.vim
call scm#plug('~/.vim/plugged')
```

## linux user(neovim)
As a linux user, you only need to run command as fellow:
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ cd ~/.config/nvim
$ git clone https://github.com/yinflying/vim_scm.git
```
and then put the configration as fellow to `~/.config/nvim/init.vim`:
```
let mapleader = ','

source ~/.config/nvim/vim_scm/scm.vim
Scmsource ~/.config/nvim/vim_scm/linux/vim81/scm_core.vim
Scmsource ~/.config/nvim/vim_scm/personal/condy_nvim/scm_simple_config.vim
Scmsource ~/.config/nvim/vim_scm/personal/condy_nvim/scm_basic.vim
Scmsource ~/.config/nvim/vim_scm/personal/condy_nvim/scm_cpp.vim
Scmsource ~/.config/nvim/vim_scm/personal/condy_nvim/scm_rust.vim

call scm#plug('~/.config/nvim/plugged')
```

# Install Personal plugins(or create personal layer scripts)
If you want to install your own plugins. you could create a vim script file 
such as: `~/.vim/vim_scm/bob_own.vim`, and then put two functions under the file
:
```
function bob_own#install()
    "Use Plug to install plugin `plugin1` and `plugin2`
    Plug 'own1/plugin1'
    Plug 'own2/plugin1'
endfunction

function bob_own#config()
    "Put your configuration for the plugin
endfunction
```
And then you should add `Scmsource ~/.vim/vim_scm/bob_own.vim` before 
`Call scm#plug('~/.vim/plugged')` in vim config file `~/.vimrc`.

After do that, reopen your vim and Type `:PlugInstall` to install the plugin 
with your own configuration

# End
Actullay, `vim-scm` is inspired by the `layer` concept of `Spacevim`, however,
`SpaceVim` is too complicated to configure. so I create a a simple `layers`
manager for `vim` and share configuration
