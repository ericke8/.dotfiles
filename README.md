# .dotfiles

## Setup
```
git init --bare "$HOME/.dotfiles"
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
dotfiles config --local status.showUntrackedFiles no
```

## Replication
Destructive! Make sure to backup existing dotfiles first!

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ericke8/.dotfiles.git $HOME/dotfiles-tmp
rsync --recursive --verbose --exclude '.git' $HOME/dotfiles-tmp/ $HOME/
rm --recursive $HOME/dotfiles-tmp/
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
dotfiles config --local status.showUntrackedFiles no
```

Without rsync
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ericke8/.dotfiles.git $HOME/dotfiles-tmp
rm $HOME/dotfiles-tmp/.git
cp -irv $HOME/dotfiles-tmp/. $HOME/
rm --recursive $HOME/dotfiles-tmp/
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
dotfiles config --local status.showUntrackedFiles no
```

## Usage
```
dotfiles status
dotfiles add ~/.bashrc
dotfiles commit -m 'Update bashrc'
dotfiles push
```
