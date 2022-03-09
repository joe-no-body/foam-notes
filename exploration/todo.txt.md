# todo.txt

path: /home/joe/Code/cloned/todo.txt-cli

## criticism

not a fan of this at all

### poor code style

- unquoted variables
- no `[[ "$BASH_SOURCE" == "$0" ]]` or `main` function, just a bunch of
  top-level code scattered throughout the script
- color map is always set + has to be overridden in the config if you want to
  use it with a script -- should just use tty detection
- uses gross patterns like `action=$( printf "%s\n" "$ACTION" | tr '[:upper:]' '[:lower:]' )`
  instead of just `"${action,,}"`

### unclear setup process

- if your config file doesn't exist, you'll just get `Fatal Error: Cannot read
  configuration file /home/joe/.todo/config` with no mention of how to create it
  or the fact that you can set `TODOTXT_CFG_FILE` to set a different location
  for it
  - the README doesn't mention this either

## code

### top-level

- version
- script basename + full path

misc functions

- 511: settings
  - env vars
  - getopts
  - defaults
    - should use `: ${TODOTXT_VERBOSE:=1}` instead of `TODOTXT_VERBOSE=${TODOTXT_VERBOSE:-1}`
  - interesting way of exporting all vars: `export "${!TODOTXT_@}"`
  - color codes
  - priority->color map
  - etc.
  - get config file location
  - get actions dir
- source config file
- apply overrides
- get action
- print usage if no action given
- handle setting up todo dir, todo.txt, done.txt, report.txt
- clear colors if `TODOTXT_PLAIN` is set

some misc funcs

- line 1042: handle action
  - custom actions
  - built-in actions
- 1065: main action switch statement