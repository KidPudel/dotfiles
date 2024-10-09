export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/Applications/GoLand.app/Contents/MacOS"
export WISHLIST_BOT_TOKEN=6746217941:AAHTnbmvw__XKzLQpu91bFIVTeSoZSpvyBY

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias python=python3
alias pip=pip3
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

export GOPRIVATE=gitlab.com,git.bwg-io.site
# export CC="gcc" #clang
# export CXX="g++" #clang++
# export CGO_ENABLED="1" #0

export LIBRARY_PATH="/opt/homebrew/lib"
export CPATH="/opt/homebrew/include"


export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# zsh extension
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export PATH="/Users/iggysleepy/dev/general/odin/Odin:$PATH"


eval "$(zoxide init --cmd cd zsh)"


