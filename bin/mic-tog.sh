if amixer get Capture | grep -q '\[off\]'; then
    echo " "
else
    echo ""
fi
