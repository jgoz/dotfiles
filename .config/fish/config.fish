# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME "/Users/john/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
