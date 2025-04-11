eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/Applications/GoLand.app/Contents/MacOS"
export WISHLIST_BOT_TOKEN=6746217941:AAHTnbmvw__XKzLQpu91bFIVTeSoZSpvyBY

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias python=python3
alias pip=pip3

alias inv='nvim $(fzf --preview "bat --color=always {}")'

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

export GOPRIVATE=gitlab.com,gitlab.internalabc.xyz,gitlab.com/paycos-tech/*
# export CGO_ENABLED=0
# export CC="gcc" #clang
# export CXX="g++" #clang++
# export CGO_ENABLED="1" #0

# export LIBRARY_PATH="/opt/homebrew/lib"
# export CPATH="/opt/homebrew/include"


export CC="clang"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# zsh extension
eval "$(starship init zsh)"

# Source zsh-autosuggestions

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-syntax-highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# allow fzf commands

eval "$(fzf --zsh)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export PATH="$HOME/Odin:$PATH"

export PATH="$HOME/kafka_2.13-3.9.0/bin:$PATH"

export PATH="$HOME/VulkanSDK/1.4.304.1/macOS/bin:$PATH"

eval "$(zoxide init --cmd cd zsh)"


export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
