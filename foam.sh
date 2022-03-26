#!/usr/bin/env bash

readonly EXIT_USAGE=64

readonly PROGPATH="$0"
readonly PROGNAME="$(basename "$PROGPATH")"
readonly REALPROGPATH="$(realpath "$PROGPATH")"
readonly PROGDIR="$(dirname "$REALPROGPATH")"


##### messages #####

### help text

help::print_usage() {
  echo "usage: $PROGNAME COMMAND [OPTIONS]..."
}

### errors

error::fatal() {
  echo "fatal error: $*"
  exit $EXIT_USAGE
} >&2

##### main #####

foam::main() {
  local cmd="$1"
  shift
  if [[ ! "$cmd" ]]; then
    help::print_usage
    error::fatal "you must provide a command"
  fi

  case "$cmd" in
    *) error::fatal "unknown command $cmd"
  esac
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  foam::main "$@"
fi