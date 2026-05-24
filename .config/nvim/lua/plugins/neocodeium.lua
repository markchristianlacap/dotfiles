local neocodeium = require("neocodeium")
neocodeium.setup()
vim.keymap.set("i", "<C-g>", neocodeium.accept)
