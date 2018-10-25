#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

export BROWSER="google-chrome"
export TERMINAL="termite"

exec i3
