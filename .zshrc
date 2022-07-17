# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=random

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Note to future self: remove /usr/local/share/zsh/site-functions/_git because that messes with zsh completions: https://stackoverflow.com/questions/65833258/git-completion-on-zsh-not-listing-ambiguous-options-on-macos
# Some of these plugins are built-in, some are custom (fz installed manually)
plugins=(
    alias-finder            # Finds aliases for commands (configured to automatically trigger)
    common-aliases          # Some aliases for ls and other commands
    git                     # Lots of aliases for git
    gitignore               # Generates gitignores for project type(s)
    macos                   # Commands for interfacing with Finder/controlling spotify
    z                       # autojump command
    zshnotes                # Create quick notes in the terminal
    zsh-autosuggestions     # Generates the grey suggestions based on history/completions
    zsh-syntax-highlighting # Syntax higlights the shell
    fz                      # Enable tab completion with fzf for the z command
    fzf-tab                 # Tab completion uses fuzzy find
    # git-prompt              # Shows git-status summary in prompt (poor integration with themes)
    # gitfast                 # Supposed to have faster git completion, but missing completions
)

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

# Configure autosuggestions to give completion suggestions if no historical command found
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Aliases for commands are suggested
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Disable correction suggestions
unsetopt correct_all

# Use vi command-line editing mode
bindkey -v
bindkey kj vi-cmd-mode

# Enable fzf jump shortcut at the cost of not being able to type that character
bindkey "ç" fzf-cd-widget

# Load secrets, if they exist
if [ -f ~/.secrets.zsh ]; then
    source ~/.secrets.zsh
fi

# Advent of code utilities
py() {
    python3 $1.py $2 $3 $4 $5 $6
}

# Explicitly set my editor as vim
export EDITOR=vim

# Edit vimrc quickly
alias vimrc="vim ~/.vimrc"

# Alias to edit the config and reload it
alias zshrc="vim ~/.zshrc && exec zsh"

# use gsed instead of sed so that zshnotes works
alias sed=gsed

# Override and add some git aliases
alias gc="git commit -m"
alias gpo="git push origin"
alias gpu="git push upstream"

# Use ls with icons!
alias ls='lsd'

# Function to find most common commands (useful for identifying new aliases)
function zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Fuzzy find command to enable keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
