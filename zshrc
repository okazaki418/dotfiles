ZSH_DIR="${HOME}/.zsh_user"

# .zsh_userがディレクトリでrx可能なとき
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in ${ZSH_DIR}/**/*.zsh; do
    # 読み取り可能ならば実行する
    [ -r $file ] && source $file
  done
fi

# cdの後にls
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        exa --icons
    fi
}

# 履歴の保存場所とサイズ
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# cargo用のPATH
export PATH=$PATH:~/.cargo/bin

# starship
eval "$(starship init zsh)"

#shaldon
eval "$(sheldon source)"

# zoxide
eval "$(zoxide init zsh)"
