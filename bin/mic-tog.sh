if pactl list sources | grep -A15 "Name:.*input" | grep -q "Mute: yes"; then
    echo " "
else
    echo ""
fi
