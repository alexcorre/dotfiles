# grab npm token from ~/.npmrc and export as NPM_TOKEN
if [[ -a ~/.npmrc ]]
then
  export NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')
else
fi
