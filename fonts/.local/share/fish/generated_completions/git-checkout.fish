# git-checkout
# Autogenerated from man page /usr/share/man/man1/git-checkout.1.gz
complete -c git-checkout -s q -l quiet -d 'Quiet, suppress feedback messages'
complete -c git-checkout -l progress -l no-progress -d 'Progress status is reported on the standard error stream by default when it i…'
complete -c git-checkout -s f -l force -d 'When switching branches, proceed even if the index or the working tree differ…'
complete -c git-checkout -l ours -l theirs -d 'When checking out paths from the index, check out stage #2 (ours) or #3 (thei…'
complete -c git-checkout -s b -d 'Create a new branch named <new_branch> and start it at <start_point>; see git…'
complete -c git-checkout -s B -d 'Creates the branch <new_branch> and start it at <start_point>; if it already …'
complete -c git-checkout -s t -l track -d 'When creating a new branch, set up "upstream" configuration'
complete -c git-checkout -l no-track -d 'Do not set up "upstream" configuration, even if the branch'
complete -c git-checkout -l guess -l no-guess -d 'If <branch> is not found but there does exist a tracking branch in exactly on…'
complete -c git-checkout -s l -d 'Create the new branch\'s reflog; see git-branch(1) for details'
complete -c git-checkout -s d -l detach -d 'Rather than checking out a branch to work on it, check out a commit for inspe…'
complete -c git-checkout -l orphan -d 'Create a new orphan branch, named <new_branch>, started from <start_point> an…'
complete -c git-checkout -l ignore-skip-worktree-bits -d 'In sparse checkout mode, git checkout -- <paths> would update only entries ma…'
complete -c git-checkout -s m -l merge -d 'When switching branches, if you have local modifications to one or more files…'
complete -c git-checkout -l conflict -d 'The same as --merge option above, but changes the way the conflicting hunks a…'
complete -c git-checkout -s p -l patch -d 'Interactively select hunks in the difference between the <tree-ish> (or the i…'
complete -c git-checkout -l ignore-other-worktrees -d 'git checkout refuses when the wanted ref is already checked out by another wo…'
complete -c git-checkout -l overwrite-ignore -l no-overwrite-ignore -d 'Silently overwrite ignored files when switching branches'
complete -c git-checkout -l recurse-submodules -l no-recurse-submodules -d 'Using --recurse-submodules will update the content of all active submodules a…'
complete -c git-checkout -l overlay -l no-overlay -d 'In the default overlay mode, git checkout never removes files from the index …'
complete -c git-checkout -l pathspec-from-file -d 'Pathspec is passed in <file> instead of commandline args'
complete -c git-checkout -l pathspec-file-nul -d 'Only meaningful with --pathspec-from-file'
complete -c git-checkout -l literal-pathspecs

