# エイリアスを補完
setopt completealiases

# 同時に起動しているzshで履歴共有
setopt share_history

# 履歴から余分なスペースを削除
setopt hist_reduce_blanks

# コマンドのスペルミスを指摘
setopt correct

# ワイルドカード等を柔軟に
setopt nomatch

# 大文字小文字無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 矢印有効化
zstyle ':completion:*' menu select
