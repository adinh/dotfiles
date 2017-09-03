function frg
  rg --files --no-ignore --hidden --follow --glob '!.git/*' $argv . | fzf --preview "pygmentize -O style=monokai -f console256 -g {}"
end
