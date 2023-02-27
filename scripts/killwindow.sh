#! /bin/sh
kill $(yabai -m query --windows | jq 'map(select(."has-focus" == true))[0].pid')
