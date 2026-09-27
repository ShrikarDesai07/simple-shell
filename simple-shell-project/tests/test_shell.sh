#!/usr/bin/env bash
set -euo pipefail

SHELL_BIN=${1:-./simple-shell}
PASS=0
FAIL=0
TMP_DIR=$(mktemp -d /tmp/simple-shell-test-XXXXXX)
trap 'rm -rf "$TMP_DIR"' EXIT

run_test() {
    local name=$1
    local input=$2
    local expected=$3
    local actual
    actual=$(printf '%s' "$input" | "$SHELL_BIN" 2>/dev/null)
    if [[ "$actual" == "$expected" ]]; then
        printf 'PASS: %s\n' "$name"
        PASS=$((PASS + 1))
    else
        printf 'FAIL: %s\n' "$name"
        printf '  expected: %q\n' "$expected"
        printf '  actual:   %q\n' "$actual"
        FAIL=$((FAIL + 1))
    fi
}

run_test "echo builtin" $'echo hello\nexit\n' "hello"
run_test "quoted echo" $'echo "hello world"\nexit\n' "hello world"
run_test "external command" $'printf hi\nexit\n' "hi"
run_test "help builtin" $'help\nexit\n' $'Simple Shell - supported commands:\n  cd [DIR]       Change current directory\n  pwd            Print current directory\n  echo [TEXT...] Print text\n  help           Show this help message\n  exit           Exit the shell\n\nExternal commands, pipes (|), redirection (<, >, >>),\nand background execution (&) are supported.'

printf 'redirection-input\n' > "$TMP_DIR/in.txt"
input=$'cat < '"$TMP_DIR"$'/in.txt\nexit\n'
run_test "input redirection" "$input" "redirection-input"

input=$'echo output > '"$TMP_DIR"$'/out.txt\ncat '"$TMP_DIR"$'/out.txt\nexit\n'
run_test "output redirection" "$input" "output"

input=$'echo second >> '"$TMP_DIR"$'/out.txt\ncat '"$TMP_DIR"$'/out.txt\nexit\n'
run_test "append redirection" "$input" $'output\nsecond'

run_test "pipeline" $'printf "a\\nb\\nc\\n" | wc -l\nexit\n' "3"

pwd_before=$(pwd)
run_test "invalid command" $'definitely-not-a-command\nexit\n' ""

# cd is checked by creating a command sequence and filtering prompt on stderr.
actual=$(printf 'cd /tmp\npwd\nexit\n' | "$SHELL_BIN" 2>/dev/null)
if [[ "$actual" == "/tmp" ]]; then
    printf 'PASS: cd builtin\n'; PASS=$((PASS + 1))
else
    printf 'FAIL: cd builtin (actual=%q)\n' "$actual"; FAIL=$((FAIL + 1))
fi

# Parser error should not crash the shell.
actual=$(printf 'echo "unterminated\nexit\n' | "$SHELL_BIN" 2>/dev/null)
if [[ -z "$actual" ]]; then
    printf 'PASS: malformed input handling\n'; PASS=$((PASS + 1))
else
    printf 'FAIL: malformed input handling\n'; FAIL=$((FAIL + 1))
fi

printf '\nTotal: %d passed, %d failed\n' "$PASS" "$FAIL"
[[ $FAIL -eq 0 ]]
