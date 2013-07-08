# is_on_git

  # in a non-git directory

    # returns false

  # in a git directory

    # returns true

# parse_git_branch

  # on a master branch

    # is 'master'

  # on dev/test branch

    # is dev/test

  # off of a branch

    # is 'no branch'

# git_status

  # on a clean and synced branch

    # is nothing

  # on a dirty branch

    # is an asterisk

  # on an unsynced branch

    # is an empty triangle

  # on a dirty and unsynced branch

    # is a filled triangle

  # TODO: These ones...