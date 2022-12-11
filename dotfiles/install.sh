#!/bin/zsh

# link
basename -a "$PWD"/dotfiles/.??* | xargs -I{} ln -sfv "$PWD"/dotfiles/{} ~/{}

# Zinit (Zsh plugin manager)
sh -c "$(curl -fsSL https://git.io/zinit-install)"
echo ". $PWD/dotfiles/.plugins.zsh" >> ~/.zshrc

# Delete .DS_Store
echo "alias dsstore=\"find . -name '*.DS_Store' -type f -ls -delete\"" >> ~/.zshrc

echo "👍 dotfiles link is done!"