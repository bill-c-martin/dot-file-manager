# dot-files

Track and manage Linux dot-files and aliases across computers.

Features:

- Group your aliases into group files in `includes/aliases/`
- List these aliases using the `a` pretty-print command
- Customize `~./bashrc` by adding to `config/bashrc-addons` file
- Setup dot file symlinks from your `~` into this repo using `setup.sh`

## Setup

```bash
cd ~
git clone git@github.com:bill-c-martin/dot-files.git
chmod +x dot-files/setup.sh
./dot-files/setup.sh
```

The setup script ask if it can point your `~` dot files to the versions in this repo:

- `.gitconfig`
- `.vimrc`
- `.bashrc`

And will offer to append an include in `~/.bashrc` for this repo's aliases.

Then, refresh bash:

```bash
. ~/.bashrc
```

Install `bat`:

```bash
sudo apt install bat
```

## Usage

Aliases are grouped in files under `~/.dotfiles/bash/aliases/*`.

Print alias groups:

```bash
a
```

Example output:

```bash
Usage: a <alias-group>

Where <alias-group> is one of: 

alias-browser
arch
aws
disk
docker
files
general
git_aliases
gnome
gw
network
pacman
permissions
server
```

View aliases for a particular `<alias-group>` from above output:

```bash
a <alias-group>
```

Example:

```bash
a pacman
```

Example output:

```bash
Aliases in /home/bill/dot-files/includes/aliases/pacman:

───────┬────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: /home/bill/dot-files/includes/aliases/pacman
───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ # Install/uninstall
   2   │ alias pacman-install='sudo pacman -Syu'   # append package name
   3   │ alias pacman-uninstall='sudo pacman -Rsc' # append package name
   4   │ 
   5   │ # What do I have?
   6   │ alias pacman-installed='pacman -Q'
   7   │ alias pacman-installed-info='pacman -Qi'  # append package name
   8   │ alias pacman-orphaned='pacman -Qdt'
   9   │ 
  10   │ # Finding packages
  11   │ alias pacman-search='pacman -Ss'          # append package name
  12   │ alias pacman-search-info='pacman -Si'     # append package name
  13   │ 
  14   │ # Update/upgrade
  15   │ alias pacman-update='sudo pacman -Syy'
  16   │ alias pacman-upgrade='sudo pacman -Syu'
  17   │ 
  18   │ # Cache
  19   │ alias pacman-clean-cache='pacman -Sc'
```