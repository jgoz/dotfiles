# Defined in - @ line 1
function abrew --wraps='arch -arm64 /opt/homebrew/bin/brew' --description 'alias abrew=arch -arm64 /opt/homebrew/bin/brew'
  arch -arm64 /opt/homebrew/bin/brew $argv;
end
