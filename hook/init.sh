INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

function init-git-commit-message-prefix-hook {
	[ -d .git ] || {
		echo "Run this command inside a git repository";
		return 1
	}

	[ -f .git/hooks/prepare-commit-msg ] && {
		echo \
			"You have an active prepare-commit-msg hook.
			Consider adding this manually or you can append
			the existing configuration (on your own risk)
			${INSTALL_DIR}/prepare-commit-msg >> .git/hooks/prepare-commit-msg"
			return 1
	} || {
		cp ${INSTALL_DIR}/prepare-commit-msg .git/hooks/
	}
}

export -f init-git-commit-message-prefix-hook
