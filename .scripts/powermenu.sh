case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
    -nb "${COLOR_BACKGROUND:-#282a36}" \
    -nf "${COLOR_DEFAULT:-#eeeeee}" \
    -sf "${COLOR_HIGHLIGHT:-#bbbbbb}" \
    -sb "#8839ef" \
     -p \
    "Power:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) kill -HUP $XDG_SESSION_PID;;
        Suspend) exec systemctl suspend;;
        Lock) exec slock;;
esac
