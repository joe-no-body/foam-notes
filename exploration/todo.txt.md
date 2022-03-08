# todo.txt

path: /home/joe/Code/cloned/todo.txt-cli

## criticism

not a fan of this at all

### poor code style

- unquoted variables
- no `[[ "$BASH_SOURCE" == "$0" ]]` or `main` function, just a bunch of
  top-level code in the script

### unclear setup process

- if your config file doesn't exist, you'll just get `Fatal Error: Cannot read
  configuration file /home/joe/.todo/config` with no mention of how to create it
  or the fact that you can set `TODOTXT_CFG_FILE` to set a different location
  for it
  - the README doesn't mention this either
