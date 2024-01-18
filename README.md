# Dotfiles

This project aims to capture all configuration files I use and centralise them, with common tooling for easily transferring and deploying config to new machines.

## Stow 

The top level `stow` folder contains config that can be 'stowed' directly into
your machine using `stow`. The intended directory structure is symlinked exactly.

### Using `stow` 

To deploy this to a new machine, run 

```
stow --target ~ -vv --stow stow
```

To redeploy changes to this machine, run 

```
stow --target ~ -vv --restow stow
```

