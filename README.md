# Commit message prefix hook [![Build Status](https://travis-ci.com/kqf/git-commit-message-prefix-hook.svg?branch=master)](https://travis-ci.com/kqf/git-commit-message-prefix-hook)

A simple git [hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) that adds a prefix to your commit message.

## Why?
Some teams require to prepend all commit messages with the corresponding Jira ticket name. So this nice-looking, self-explanatory and grammatically correct commit message:
```bash
git commit -m "Bug fix"
```
has to be replaced with
```bash
git commit -m "JIRA-137 | Bug fix"
```
This hook should do all the job automatically. The idea is to store the ticket name per branch and modify the message after one commits the changes. As an alternative approach, one can infer the ticket from the branch [name](https://mikemadisonweb.github.io/2018/12/18/git-hook-prepending-commit-message/), but if you like human-readable branch names, you can use this one.

## Installation
The hook comes with an additional initialization script, both are installed with:

1. Check out the code where you want (`~/` was tested)
```bash
git clone https://github.com/kqf/git-commit-message-prefix-hook.git ~/.git-commit-message-prefix-hook
```

2. Add the init script to your shell
```bash
echo -e "if ! which init-git-commit-message-prefix-hook > /dev/null; then\n  . ~/.git-commit-message-prefix-hook/init.sh;\nfi" >> ~/.bash_profile
```
Restart your shell

## How to use
By default, the hook excludes some branches such as `master`, so we need to create a `git` repository, new branch:
```bash
# Initialize the repository first
git init

# Now this will work
init-git-commit-message-prefix-hook

# The branch related to the ticket
git checkout -b new-feature
```
Now when trying to commit with:
```
git commit -m "Some updates"
```
you will be prompted to type the prefix (Jira ticket) for your messages on this branch. All subsequent commits from the same branch will not require additional actions. Note, one branch can have one ticket associated with it, while the converse isn't true.
