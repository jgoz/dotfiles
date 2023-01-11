# Defined in - @ line 1
function ibrew --wraps='arch -x86_64 /usr/local/bin/brew' --description 'alias ibrew=arch -x86_64 /usr/local/bin/brew'
  arch -x86_64 /usr/local/bin/brew $argv;
end
