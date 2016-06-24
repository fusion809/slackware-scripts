function push {
  git add --all                                        # Add all files to git
  git commit -m "$1"                                 # Commit with message = argument 1
  git push origin $(git rev-parse --abbrev-ref HEAD)   # Push to the current branch
}
