case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
     -p \
    "Power Menu:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) kill -HUP $XDG_SESSION_PID;;
        Suspend) exec systemctl suspend;;
        Lock) exec slock;;
esac
