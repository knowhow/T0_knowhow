PATH=~/bin:$PATH

#http://osxdaily.com/2006/12/11/how-to-customize-your-terminal-prompt/
export PS1="\u@\h:\w$ "

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# http://hints.macworld.com/article.php?story=20071102084155353
alias openwidth_rebuild="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Show line numbers for Qt function calls in stack traces.
# http://wimleers.com/blog/dyld-image-suffix-causing-havoc-on-mac-os-x-snow-leopard
# export DYLD_IMAGE_SUFFIX=_debug

. /Users/hernad/.asciidoc/docbook-xsl-1.76.0/.profile.incl
