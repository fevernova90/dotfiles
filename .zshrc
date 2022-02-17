# Created by newuser for 5.8
# User BIN path
export PATH="${HOME?}/bin:${PATH}"

# GPG fix by directing GPG password to the correct TTY
export GPG_TTY=$TTY

# PHPEnv
export PHPENV_ROOT="/home/fevernova90/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# Setting DISPLAY env to WSL2 IP:<width>:<height>
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# Enabling dbus for GUI app inter-communication
# sudo /etc/init.d/dbus start &> /dev/null

# rbenv (Ruby Env Helper)
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# GO PATH
export PATH=$PATH:/usr/local/go/bin
 
 
# Kubectl Autocompletion
# [[ /home/drugz/.cache/cloud-code/installer/google-cloud-sdk/bin/kubectl ]] && source <(kubectl completion zsh)
 
# My aliases
alias zshrc='code ~/.zshrc'
alias dc='docker compose'
alias sail='./vendor/bin/sail'
alias sshconfig='code ~/.ssh/config'
alias pyactivate='source venv/bin/activate'
alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'

# Kubectl aliases
# alias k=kubectl
# complete -F __start_kubectl k
# alias kdr='kubectl --dry-run=client -o yaml'
# alias kap='kubectl apply'
# alias kbb='kubectl run busybox-test --image=busybox -it --rm --restart=Never --'
# alias kdb='kubectl describe'
# alias kl='kubectl logs'
# alias ke='kubectl exec -it'
 
source $HOME/antigen.zsh
 
# Install/update/loading pyenv
# antigen bundle mattberther/zsh-pyenv
# eval "$(pyenv init -)"
# Load the oh-my-zsh's library
antigen use oh-my-zsh
 
# Bundles from default repo
antigen bundle git
antigen bundle pip
antigen bundle docker-compose
antigen bundle command-not-found
# antigen bundle kubectl
 

 
# NVM wrapper.
antigen bundle lukechilds/zsh-nvm
 
# NP_M autocomplete
antigen bundle lukechilds/zsh-better-npm-completion
 
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
 
# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions
 
# Extra zsh completions
antigen bundle zsh-users/zsh-completions
 
# Gcloud autocompletion
antigen bundle littleq0903/gcloud-zsh-completion

# Load the theme
antigen theme robbyrussell

 
# Tell antigen that you're done
antigen apply
 
# Run nvm use automatically on directory that contains .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"
 
    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
 
        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Pyenv autoloader

# eval "$(pyenv init -)"

# fix_wsl2_interop() {
#     for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
#         if [[ -e "/run/WSL/${i}_interop" ]]; then
#             export WSL_INTEROP=/run/WSL/${i}_interop
#         fi
#     done
# }

# fix_wsl2_interop

# WSLHostPatcher - will make wslhost.exe automatically bind port on all interface
if [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
    echo "Detected on WSL, running WSLHostPatcher ..."
    ~/dotfiles/wslhostpatcher/WSLHostPatcher.exe
else
    echo "This is not WSL, skipping WSLHostPatcher"
fi

# Clear screen, comment this to see any errors during shell init
printf "\033c"

echo "Welcome Back Muhaimin" | figlet

