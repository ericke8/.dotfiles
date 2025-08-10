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
cp -irv $HOME/dotfiles-tmp/. $HOME/
rm --recursive $HOME/dotfiles-tmp/
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
dotfiles config --local status.showUntrackedFiles no
```


## Usage
```
mydotfiles status
mydotfiles add ~/.bashrc
mydotfiles commit -m 'Update bashrc'
mydotfiles push
```
