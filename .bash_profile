#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# If running from tty1 start sway
if [[ "$(tty)" == "/dev/tty1" ]]; then
    # https://github.com/systemd/systemd/issues/14489
    export XDG_SESSION_TYPE=wayland
    exec systemd-cat -t sway sway
fi

