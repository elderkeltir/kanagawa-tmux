#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
battery="$current_dir/directory.sh"

left_sep=""
right_sep=""

sumilnk2="#2A2A37"
oldWhite="#C8C093"
carpYellow="#E6C384"
boatYellow1="#938056"
winterYellow="#49443C"
katanaGray="#717C7C"
kanagawared="#c34043"
kanagawapink="#d27e99"
kanagawaviolet="#957fb8"
kanagawagreen="#98bb6c"
kanagawaorange="#ffa066"

bar_bg=$sumilnk2
pane_inactive=$bar_bg
text_fg=$sumilnk2

session_bg=$bar_bg
session_fg=$oldWhite
session_active_bg=$kanagawared
session_active_fg=$session_bg

window_active_fg=$text_fg
window_active_bg=$carpYellow
window_last_fg=$text_fg
window_last_bg=$boatYellow1
window_inactive_fg=$oldWhite
window_inactive_bg=$winterYellow

pane_active=$carpYellow

message_fg=$session_bg
message_bg=$session_fg

cpu_bg=$bar_bg
cpu_fg=$kanagawaviolet
ram_bg=$kanagawagreen
ram_fg=$bar_bg
cp_bg=$bar_bg
cp_fg=$kanagawaorange

tmux set-window-option -g window-status-activity-style "bold"
tmux set-window-option -g window-status-bell-style "bold"
tmux set-option -g status-style "fg=$session_fg,bg=${bar_bg},bold,italics"
tmux set-option -g message-style "fg=${message_fg},bg=${message_bg}"
tmux set-option -g pane-active-border-style "fg=${pane_active}"
tmux set-option -g pane-border-style "fg=${pane_inactive}"
tmux set-window-option -g window-status-style "fg=${window_active_fg},bg=${window_active_bg},bold,noitalics"
tmux set-window-option -g window-status-separator ""
tmux set-window-option -g window-status-last-style "fg=${window_last_fg},bg=${window_last_bg}"
tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

flags="#{?window_flags,#{?window_active,#[fg=${window_active_fg}],#{?window_last_flag,#[fg=${window_last_fg}],#[fg=${window_inactive_fg}]}}#{window_flags},}"
tmux set-option -g status-left "#[bg=$session_bg]#{?client_prefix,#[fg=$session_active_fg],}#{?client_prefix,#[bg=$session_active_bg],} "#S"#[fg=${session_bg},bg=${bar_bg}]#{?client_prefix,#[fg=${session_active_bg}],}${left_sep}"
tmux set-window-option -g window-status-current-format "#[fg=${bar_bg}]${left_sep} #I #W ${flags} #[fg=${window_active_bg},bg=${bar_bg}]${left_sep}"
tmux set-window-option -g window-status-format "#[fg=${bar_bg}]#{?window_last_flag,,#[bg=${window_inactive_bg}]}${left_sep}#{?window_last_flag,,#[fg=${window_inactive_fg}]}#{?window_last_flag,,#[bg=$window_inactive_bg,]} #I #{?window_last_flag,#[bold],#[italics,nobold]}#W ${flags} #{?window_last_flag,#[fg=${window_last_bg}],#[fg=${window_inactive_bg}]}#[bg=${bar_bg}]${left_sep}"

tmux set-option -g status-right "#[bg=${bar_bg},noitalics,nobold]"
tmux set-option -ga status-right "#[fg=${cp_bg}]${right_sep}#[fg=${cp_fg},bg=${cp_bg}] #(test "#{pane_current_path}" = "$HOME" && echo '~' || basename "#{pane_current_path}") #[fg=${ram_bg}]${right_sep}#[fg=${ram_fg},bg=${ram_bg}] RAM: #{ram} #[fg=${cpu_bg}]${right_sep}#[fg=${cpu_fg},bg=${cpu_bg}] CPU: #{cpu_percentage} "
