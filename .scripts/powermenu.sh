case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
    -nb "${COLOR_BACKGROUND:-#313244}" \
    -nf "${COLOR_DEFAULT:-#cdd6f4}" \
    -sf "${COLOR_HIGHLIGHT:-#89b4fa}" \
    -sb "#585b70" \
     -p \
    "Power Menu:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) kill -HUP $XDG_SESSION_PID;;
        Suspend) exec systemctl suspend;;
        Lock) exec slock;;
esac
