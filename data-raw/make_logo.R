# -----------------------------------------------------------------------------#
# Hex sticker
#
# remotes::install_github("GuangchuangYu/hexSticker")
# library(hexSticker)
# library(showtext)
sysfonts::font_add_google("Kneave", "kneave")
sysfonts::font_add_google("Prosto One", "prosto")
sysfonts::font_add_google("Shadows Into Light", "shadows")
painting <- here::here("man", "figures", "painting.jpg")
logo <- here::here("man", "figures", "logo.jpg")

hexSticker::sticker(
  painting,
  s_x = 1.0, s_y = 0.95, s_width = 1.8, asp = 0.8,
  package = "mididrumR", p_x = 1, p_y = 1.3, p_size = 24, p_family = "shadows",
  h_fill = "#000000", h_color = "#000000",
  url = "github.com/florianm/mididrumR",
  u_size = 5, u_color = "#ffffff", u_x = 1.00, u_y = 0.05,
  white_around_sticker = T,
  filename = logo
)
