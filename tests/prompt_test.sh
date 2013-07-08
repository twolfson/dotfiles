# Navigate to test directory
_PWD=$PWD
TEST_DIR=$PWD/tests

# Fixture all git directories
echo "Setting up..."
"$TEST_DIR"/utils/fixture_git.sh

# TODO: Write a demo.sh which moves through the test dirs
# TODO This would be practical for demo.sh, a pre-commit hook, and a pre-test command

fixture_dir() {
  TMP_DIR=$(mktemp -d)
  cp -r "$TEST_DIR"/test-files/$1/* $TMP_DIR
  cd $TMP_DIR
}

# Load in bashrc
. .bashrc

# is_on_git

  # in a git directory
  fixture_dir 'git'

    # returns a non-empty string
    test "$(is_on_git)" != "" || echo '`is_on_git` === `false` in git directory' 1>&2

  # in a non-git directory
  fixture_dir 'non-git'

    # returns an empty string
    test "$(is_on_git)" = "" || echo '`is_on_git` === `true` in non-git directory' 1>&2

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

# Unfixture all git directores
cd $_PWD
echo ""
echo "Cleaning up..."
"$TEST_DIR"/utils/unfixture_git.sh
echo ""