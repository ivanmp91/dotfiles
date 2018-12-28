# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc" ; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/ivan.mora/google-cloud-sdk/completion.zsh.inc" ]; then source '/Users/ivan.mora/google-cloud-sdk/completion.zsh.inc'; fi

# Initialize antigen
if [[ -f $HOME/.zsh/antigen.zsh ]]; then
    source $HOME/.zsh/antigen.zsh
else
    printf "Installing antigen..."
    mkdir -p $HOME/.zsh/
    curl -sS -L git.io/antigen > $HOME/.zsh/antigen.zsh
    source $HOME/.zsh/antigen.zsh
    printf " done.\n"
fi
cd ~
antigen init .antigenrc
autoload -Uz compinit
compinit
cd -

clear

# Useful aliases
alias kpush='file=$(mktemp) && cp $KUBECONFIG $file && export PUSHED_KUBECONFIG=$KUBECONFIG && export KUBECONFIG=$file'
alias kpop='export KUBECONFIG=$PUSHED_KUBECONFIG'

# K8S stuff
export KUBECONFIG=$HOME/.kube/config
source <(kubectl completion zsh)

# Terraform setup
alias terraform='docker run -v ~/.terraform:/root/.terraform -v ~/.terraform.d:/root/.terraform.d -v `pwd`:/docker -v ~/.config:/root/.config -w /docker --rm -it hashicorp/terraform:0.11.11'

# Spaceship zsh theme stuff
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="at "
SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_TIME_FORMAT=false
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR="yellow"

# Path configuration
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
