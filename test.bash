#!/bin/bash -xv

out=$(seq 5 | ./plus_stdin)
[ "${out}" = 15 ] || ng "$LINENO"


out=$(seq あ | ./plus_stdin)
[ "$?" = 1 ]         || ng "$LINENO"
[ "${out}" = "" ]    || ng "$LINENO"

out=$(echo | ./plus_stdin)
[ "$?" = 1 ]         || ng "$LINENO"
[ "${out}" = "" ]    || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
