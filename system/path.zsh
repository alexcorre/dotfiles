# git path
export PATH="/usr/local/git/bin:$PATH"

export PATH="./bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:$PATH"

# Add iOS tools paths
export PATH="/usr/local/bin:$HOME/Developer/devtools/utilities:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Android
export PATH="/Users/alexcorre/Library/Android/sdk/tools:$PATH"
export PATH="/Users/alexcorre/Library/Android/sdk/platform-tools:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# Add NPM packages to node path
export NODEPATH="/usr/local/lib/node_modules:$NODEPATH"

# Add npm bin
export PATH="$PATH:/usr/local/share/npm/bin"

# Add gcloud
source $HOME/google-cloud-sdk/completion.zsh.inc
source $HOME/google-cloud-sdk/path.zsh.inc
