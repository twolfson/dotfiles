# TODO: Move this into a Makefile
bash --rcfile .bashrc --noprofile -i -c "./tests/prompt_test.sh" 2> test.stderr

# If there were test failures, fail
STDERR=$(cat test.stderr)
if test -n "$STDERR"; then
  echo "ERRORS OCCURRED. STDERR OUTPUT:" 1>&2
  echo $STDERR 1>&2
  exit 1
fi