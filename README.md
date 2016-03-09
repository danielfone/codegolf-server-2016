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


## Workflow

  0. Check the .config
  0. bin/setup_course
  0. bin/git_server
  0. bin/web_server


## TODO

  * [ ] Mirror ruby docs
  * [x] Web: pull course details from BASE_DIR/results
  * [x] bin: setup course with results/ and course/
  * [x] Web: pull team details from BASE_DIR/results
  * [x] web: create new team
  * [x] web: create new team repo

  * [ ] git hook: score holes and write to results
  * [ ] new holes!
