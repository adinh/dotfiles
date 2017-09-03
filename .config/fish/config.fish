set -x FZF_DEFAULT_COMMAND "rg --files --no-ignore --hidden --follow --glob '!.git/*'"
set -x FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

# Chruby
source /usr/local/share/chruby/chruby.fish
chruby ruby-2.4
source /usr/local/share/chruby/auto.fish
