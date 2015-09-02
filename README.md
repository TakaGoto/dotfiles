# Dotfiles

Clone this dotfiles repository, and symlink the various components you wish to use:

### Requirements

* vim

````
$ cd
$ ln -s dotfiles/vim_files .vim
$ ln -s dotfiles/vim_files/.vimrc .vimrc
$ ln -s dotfiles/tmux_files/.tmux.conf .tmux.conf
$ ln -s dotfiles/zsh_files/.zshrc .zshrc
$ cd dotfiles && git submodule update --init
````
