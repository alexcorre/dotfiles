export EDITOR='subl'

# grab npm token from ~/.npmrc and export as NPM_TOKEN
export NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')
