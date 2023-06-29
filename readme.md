# dotfiles

![neofetch](https://github.com/pdtxie/dotfiles/assets/65262710/00b63c5e-f08e-42f5-911e-21e3f004eb54)

![nvim](https://github.com/pdtxie/dotfiles/assets/65262710/504339c6-2024-4224-aff1-3aae8834a46c)

- colour scheme: blazer (theme files for nvim, sway, foot, gtk, etc were created manually)
- font: IBM Plex Mono [(patched nerd font)](https://github.com/ryanoasis/nerd-fonts)
- cursors: [macos monterey cursors (white)](https://github.com/ful1e5/apple_cursor)

(old dotfiles [here](https://github.com/pdtxie/dotfiles-old))

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
