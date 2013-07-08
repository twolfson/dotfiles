# Navigate to test directory
TEST_DIR=$PWD/tests/

# is_on_git

  # in a git directory
  TMP_DIR=$(mktemp -d)
  cp -r $TEST_DIR/test-files/git/* $TMP_DIR
  cd $TMP_DIR
  mv dotgit .git

    # returns a non-empty string
    if test -n "$(is_on_git)"; then
      echo '`is_on_git` === `false` in git directory' 1>&2
    fi

  # in a non-git directory
  TMP_DIR=$(mktemp -d)
  cp -r $TEST_DIR/test-files/non-git/* $TMP_DIR
  cd $TMP_DIR

    # returns an empty string
    if test -z "$(is_on_git)"; then
      echo '`is_on_git` === `true` in non-git directory' 1>&2
    fi

# parse_git_branch

  # on a master branch

    # is 'master'

  # on dev/test branch

    # is dev/test

  # off of a branch

    # is 'no branch'

  # TODO: Should we ever list tag?
  # TODO: What do you think about master~1 as a case?

# git_status

  # on a clean and synced branch

    # is nothing

  # on a dirty branch

    # is an asterisk

  # on an unpushed branch
  # DEV: This covers new branches

    # is an empty up triangle

  # on a dirty and unpushed branch

    # is a filled up triangle

  # TODO: These ones...
  # on an unpulled branch

    # is an empty down triangle

  # on a dirty and unpulled branch

    # is an filled down triangle

  # on an unpushed and an unpulled branch

    # is an empty hexagon

  # on a dirty, unpushed, and unpulled branch

    # is an filled hexagon
