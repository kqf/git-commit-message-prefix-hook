function init-git-commit-message-prefix-hook {
	[ -d .git ] || {
		echo "Run this command inside a git repository";
		return 1
	}
	path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
	cp ${path}/hook/prepare-commit-msg .git/hooks/ && echo "Done!"
}

export -f init-git-commit-message-prefix-hook
