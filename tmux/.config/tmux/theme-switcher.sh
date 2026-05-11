#!/bin/bash
# Watches macOS appearance via `dark-notify` and points
# ~/.config/tmux/active-theme.conf at the matching kanagawa variant,
# then reloads any running tmux servers so the change is immediate.

set -euo pipefail

THEMES_DIR="$HOME/.config/tmux/themes"
ACTIVE_LINK="$HOME/.config/tmux/active-theme.conf"
DARK_THEME="$THEMES_DIR/kanagawa-wave.conf"
LIGHT_THEME="$THEMES_DIR/kanagawa-lotus.conf"

log() {
    printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

apply() {
    local mode="$1" target="$2"
    ln -sfn "$target" "$ACTIVE_LINK"
    log "mode=$mode -> $(basename "$target")"
    local reloaded=0
    # Reload every running tmux server.
    for socket in $(/usr/bin/find /private/tmp /tmp -maxdepth 2 -type s -name 'default' 2>/dev/null); do
        local tmpdir
        tmpdir="$(dirname "$(dirname "$socket")")"
        if TMUX_TMPDIR="$tmpdir" /opt/homebrew/bin/tmux source-file "$HOME/.tmux.conf" 2>/dev/null; then
            log "  reloaded tmux at $socket"
            reloaded=1
        fi
    done
    if [ "$reloaded" -eq 0 ]; then
        log "  no running tmux server to reload"
    fi
}

log "watcher starting"
/opt/homebrew/bin/dark-notify | while IFS= read -r mode; do
    case "$mode" in
        dark)  apply dark  "$DARK_THEME" ;;
        light) apply light "$LIGHT_THEME" ;;
        *)     log "unexpected dark-notify output: $mode" ;;
    esac
done
