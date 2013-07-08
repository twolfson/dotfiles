# Navigate to test directory
TEST_DIR=$PWD/tests/

# not_on_git

  # in a non-git directory
  cd $TEST_DIR/test-files/non-git

    # returns true
    test $not_on_git || echo '`not_on_git` !== `true` in non-git directory' 1>&2

  # in a git directory

    # returns true

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
