#! /bin/sh

# This basic script uses symlinks to install my dotfiles
# on the current session

# To run it, chdir inside the repository, and execute ./install.sh

set -e

# first install fish, fisher, and the tide plugin for fish

cd $HOME
[ ! -d ".vimrc" ] && ln -s $OLDPWD/dotfiles/vimrc .vimrc || echo ".vimrc already exists"
[ ! -d ".vim" ] && ln -s $OLDPWD/dotfiles/vim .vim || echo ".vim already exists"
[ ! -d ".zshrc" ] && ln -s $OLDPWD/dotfiles/zshrc .zshrc || echo ".zshrc already exists"
[ ! -d ".zsh" ] && ln -s $OLDPWD/dotfiles/zsh .zsh  || echo ".zsh  already exists"
[ ! -d ".gitconfig" ] && ln -s $OLDPWD/dotfiles/gitconfig .gitconfig  || echo ".gitconfig  already exists"
[ ! -d ".bashrc" ] && ln -s $OLDPWD/dotfiles/bashrc .bashrc  || echo ".bashrc  already exists"
[ ! -d ".config/nvim" ] && mkdir -p .config && ln -s $OLDPWD/dotfiles/nvim .config/nvim || echo ".config/nvim already exists"
rm -f .config/fish/config.fish && ln -s $OLDPWD/dotfiles/xdg_config/fish/config.fish .config/fish/config.fish
ln -s $OLDPWD/dotfiles/xdg_config/fish/custom .config/fish/custom
