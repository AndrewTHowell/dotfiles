# Dotfiles

This project aims to capture all configuration files I use and centralise them, with common tooling for easily transferring and deploying config to new machines.

## Structure

The top level folders determine where the directory should live and are intended
to be used with `stow`.

## Deployment

### .config

To deploy this to a new machine, run 

```
-- <path-to-config> examples:
-- - ~
-- - $HOME
-- - $XDG_CONFIG_HOME
stow -t <path-to-config>/.config -vv -S .config
```

To redeploy changes to this machine, run 

```
-- <path-to-config> examples:
-- - ~
-- - $HOME
-- - $XDG_CONFIG_HOME
stow -t <path-to-config>/.config -vv -R .config
```

