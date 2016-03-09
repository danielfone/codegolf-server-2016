railscamp-codegolf
==================

This project

  bin/          # Handy scripts
  course/       # The course design
  git_hooks/    # Scripts to score teams when they push
  web/          # Small rails app that sets up teams and shows scores


BASE_DIR:

  course/       # Master repository that team repos are cloned from
  results/      # Database of scores. Written by post-receive hooks and read by the web app

REPO_DIR:
  codegolf/*.git # Repos for each tem
