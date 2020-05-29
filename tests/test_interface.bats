#!/usr/bin/env bats

setup() {
	. hook/init.sh

	export workdir=$(mktemp -d)
	cd ${workdir}
}

teardown() {
	rm -rf ${workdir}
}

@test 'does nothing for unintialized repository' {
	run init-git-commit-message-prefix-hook
	[ "${status}" -eq 1 ]
}

@test 'initializes hook for existing directory' {
	git init
	run init-git-commit-message-prefix-hook
	echo "Status ${status} and ${output}"
	[ "${status}" -eq 0 ]
}
