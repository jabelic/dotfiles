#!/bin/sh

set -eu

# brewコマンドがなければインストール
if ! (type brew > /dev/null 2>&1); then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 権限設定
sudo chown -R "$(whoami)":admin /usr/local/*
sudo chmod -R g+w /usr/local/*

# Brewfileを実行
cd "$PWD"/homebrew || exit
brew bundle
cd - || exit

# パスの設定
s_path=""
s_manpath=""

# coreutils
s_path="/usr/local/opt/coreutils/libexec/gnubin:${s_path}"
s_manpath="/usr/local/opt/coreutils/libexec/gnuman:${s_manpath}"

# curl
s_path="/usr/local/opt/curl/bin:${s_path}"

echo "export PATH=\"${s_path}"'$PATH"' >> ~/.zshrc
echo "export MANPATH=\"${s_manpath}"'$MANPATH"' >> ~/.zshrc
. ~/.zshrc

echo "👍 Homebrew setting is done!"