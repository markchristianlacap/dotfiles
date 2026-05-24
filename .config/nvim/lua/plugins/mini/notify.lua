require("mini.notify").setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
})
