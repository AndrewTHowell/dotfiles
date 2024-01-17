# Dotfiles

This project aims to capture all configuration files I use and centralise them, with common tooling for easily transferring and deploying config to new machines.

## Structure

The top level folders determine where the directory should live and are intended
to be used with `stow`.

## Deployment

### .config

To deploy this to a new machine, run 

```
# Untested directly inserting to config, but local testing shows it doesn't overwrite other directories in .config, it just writes nvim
stow .config -t ~/.config -vv 
stow .config -t $XDG_CONFIG_HOME/.config -vv 
```

