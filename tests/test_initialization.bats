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
	[ "${status}" -eq 0 ]
}

@test 'fails to override the existing hook' {
	git init

	run init-git-commit-message-prefix-hook
	[ "${status}" -eq 0 ] # now it's ok

	run init-git-commit-message-prefix-hook
	[ "${status}" -eq 1 ] # now it should fail
}
