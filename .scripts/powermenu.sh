case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
    -nb "${COLOR_BACKGROUND:-#282a36}" \
    -nf "${COLOR_DEFAULT:-#f8f8f2}" \
    -sf "${COLOR_HIGHLIGHT:-#cfc9c2}" \
    -sb "#414869" \
     -p \
    "Power:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) kill -HUP $XDG_SESSION_PID;;
        Suspend) exec systemctl suspend;;
        Lock) exec slock;;
esac
