set -x PATH ~/miniconda3/bin $PATH

# FZF
set -x FZF_DEFAULT_COMMAND "rg --files --no-ignore --hidden --follow --glob '!.git/*'"
set -x FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

# Chruby
source /usr/local/share/chruby/chruby.fish
chruby ruby-2.4
source /usr/local/share/chruby/auto.fish

# Git
alias gst="git status"
alias ga="git add"
alias gc="git commit -v"
alias ggpush="git push origin master"
alias ggpull="git pull origin master"
alias glr="git pull --rebase"
alias gslrp="git stash; git pull --rebase; git stash pop"

# Ruby
alias rspec="rspec --color -fd"
alias be="bundle exec"
alias bi="bundle install"
alias bo="EDITOR=vim bundle open"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache; killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# View files with colourize
alias c="pygmentize -O style=monokai -f console256 -g"
