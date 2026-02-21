# muh 'dawts

Some dotfiles.

```sh
$ mkdir $HOME/.logs
$ mkdir -p $HOME/opt/brew && mkdir -p $HOME/opt/bin && mkdir -p $ $HOME/opt/pwsh
$ mkdir $HOME/.config && ln -s $PWD/powershell $HOME/.config/
$ ln -s $PWD/.gitconfig $HOME
$ ln -s $PWD/.gitignore-global $HOME
$ ln -s $PWD/.gemrc $HOME
$ mkdir ~/Library/KeyBindings && ln -s $PWD/DefaultKeyBinding.dict $HOME/Library/KeyBindings/
$ ln -s $HOME/Projects/dawts/ghostty $HOME/.config/
$ ln -s "$HOME/Projects/dawts/.goenv" "$HOME/.config/"

# Back up zsh config and link this one's instead
$ mv ~/.zshrc ~/.zshrc-original && ln -s "$HOME/Projects/dawts/.zshrc" $HOME

# ASDF tools (global):
$ ln -s "$HOME/Projects/dawts/.tool-versions" "$HOME"
```
