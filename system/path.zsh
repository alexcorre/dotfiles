# git path
export PATH="/usr/local/git/bin:$PATH"

export PATH="./bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:$PATH"

# Add iOS tools paths
export PATH="$PATH:/usr/local/bin:$HOME/Developer/devtools/utilities"
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# Android
export PATH="$PATH:/Users/alexcorre/Library/Android/sdk/tools"
export PATH="$PATH:/Users/alexcorre/Library/Android/sdk/platform-tools"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# Add NPM packages to node path
export NODEPATH="/usr/local/lib/node_modules:$NODEPATH"

# Add npm bin
export PATH="$PATH:/usr/local/share/npm/bin"

# Add gcloud
source $HOME/google-cloud-sdk/completion.zsh.inc
source $HOME/google-cloud-sdk/path.zsh.inc
