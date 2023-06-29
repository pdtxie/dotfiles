# dotfiles

![swappy-20230628_204141](https://github.com/pdtxie/dotfiles/assets/65262710/00b63c5e-f08e-42f5-911e-21e3f004eb54)

- colour scheme: blazer (theme files for nvim, sway, foot, gtk, etc were created manually)
- font: IBM Plex Mono [(patched nerd font)](https://github.com/ryanoasis/nerd-fonts)
- cursors: [macos monterey cursors (white)](https://github.com/ful1e5/apple_cursor)


### config files
- zsh
  - use .zsh/plugins/... for plugins
- sway
- foot
- fontconfig
- firefox (userchrome + about:config settings)
- neovim
- gtk3 blazer theme

#### requires:
- bemenu
- grim, slurp, wl-copy
- clipman
- fzf
- tere
- jq

for screensharing:
- xdg-desktop-portal-wlr (and a pipewire launcher, eg: `gentoo-pipewire-launcher`)

for airplay server:
- uxplay (needs mdns)
- avahi

for screenshots & screen recording:
- swappy
- wf-recorder
- hwaccel/vaapi/vdpau USE flags + vaapi
