#!/usr/bin/env bash

POMODORO_TIME=25
BREAK_TIME=5
TIMER_FILE="/tmp/pomodoro_timer"

start_timer() {
  pomodoro "$POMODORO_TIME" "$BREAK_TIME" >"$TIMER_FILE" 2>/dev/null &
  echo $! >/tmp/pomodoro_pid
}

stop_timer() {
  if [ -f /tmp/pomodoro_pid ]; then
    kill "$(cat /tmp/pomodoro_pid)" 2>/dev/null
    rm -f /tmp/pomodoro_pid
  fi
  echo "Stopped" >"$TIMER_FILE"
}

get_status() {
  if [ -f "$TIMER_FILE" ]; then
    cat "$TIMER_FILE"
  else
    echo "Stopped"
  fi
}

case "$1" in
toggle)
  if pgrep -f "pomodoro $POMODORO_TIME $BREAK_TIME" >/dev/null; then
    stop_timer
  else
    start_timer
  fi
  ;;
*)
  get_status
  ;;
esac
