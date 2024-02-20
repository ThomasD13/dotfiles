# Setup fzf
# ---------
# if [[ ! "$PATH" == */home/thomas/projects/fzf/bin* ]]; then
#   PATH="${PATH:+${PATH}:}/home/thomas/projects/fzf/bin"
# fi

# Auto-completion
# ---------------
source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/completion.bash

# Key bindings
# ------------
source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/key-bindings.bash
