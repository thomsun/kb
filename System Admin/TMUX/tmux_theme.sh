#!/usr/bin/env bash

right_arrow=''
left_arrow=''

default_bg="black"
default_fg="white"
bg1="cyan"
fg1="black"
bg2="brightblack"
fg2="white"
bg3="blue,nobold"
fg3="brightwhite,bold"

# status bar colors
tmux set -g status-bg black
tmux set -g status-fg white

# message colors
tmux set -g message-fg $fg2
tmux set -g message-bg $bg2
tmux set -g message-command-fg $fg2
tmux set -g message-command-bg $bg2

# status size
tmux set -g status-left-length 1000
tmux set -g status-right-length 1000

create_style() {
    local input=("$@")
    local content="${input[0]}"
    local bg_color="${input[1]}"
    local fg_color="${input[2]}"
    local start_separator="${input[3]}"
    local end_separator="${input[4]}"
    local direction="${input[5]}"

    local style_start="#[bg=$bg_color,fg=$default_bg]"
    local style_content="#[bg=$bg_color,fg=$fg_color]"
    local style_end="#[bg=$default_bg,fg=$bg_color]"

    if [[ ! -z "$start_separator" ]] ; then
        local start_section="$style_start$start_separator"   
    fi
    
    local content="$style_content$content"

    if [[ ! -z "$end_separator" ]] ; then
        local end_section="$style_end$end_separator"   
    fi

    if [[ "$direction" == "right_left" ]] ; then
        echo "$end_section$content$start_section"
    else
        echo "$start_section$content$end_section"
    fi
}

# Left side - session name and window list
## session name
session=(" ❐ #S " $bg3 $fg3 "" $right_arrow)
session_format="$(create_style "${session[@]}")"

tmux set -g status-left "$session_format"

## window status
window=(" #I  #W " $bg2 $fg2 $right_arrow $right_arrow)
window_current=(" #I  #W " $bg1 $fg1 $right_arrow $right_arrow)

tmux set -g status-justify left
tmux set -g window-status-separator ""
tmux set -g window-status-format "$(create_style "${window[@]}")"
tmux set -g window-status-current-format "$(create_style "${window_current[@]}")"

# Right side - additional information
## host name
user=$(whoami)
hostname=(" $user@#h  " $bg3 $fg3 "" $left_arrow "right_left")
hostname_format="$(create_style "${hostname[@]}")"

## time
time=(" #(TZ='America/Los_Angeles' date +%%I:%%M\ %%p\ %%Z)   #(date -u +%%I:%%M\ %%p\ %%Z)  " $bg2 $fg2 $left_arrow $left_arrow "right_left")
time_format="$(create_style "${time[@]}")"

## date
date=(" %F  " $bg2 $fg2 $left_arrow $left_arrow "right_left")
date_format="$(create_style "${date[@]}")"

## prefix
prefix=("#{?client_prefix,  ,}" $default_bg $default_fg "" "")
prefix_format="$(create_style "${prefix[@]}")"

tmux set -g status-right "$prefix_format$date_format$time_format$hostname_format"