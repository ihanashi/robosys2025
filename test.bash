#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Issei Hanashi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

## ====== TEST 1: 非TTY（パイプ入力）の動作 ======
out=$(echo "dummy" | ./plus)
# 非TTY入力時は以下の2行が出る：
# 「ログ開始（終了するには exit ）」
# 「>」
if [ "$out" != "ログ開始（終了するには exit ）
>" ]; then
    ng "$LINENO"
fi


## ====== TEST 2: 空行を流したとき（非TTY） ======
out=$(echo "" | ./plus)
if [ "$out" != "ログ開始（終了するには exit ）
>" ]; then
    ng "$LINENO"
fi


## ====== TEST 3: 文字入力し exit しない（非TTY） ======
out=$(echo あ | ./plus)
# 非TTYなので exit しない、入力は無視されプロンプトだけ出る
if [ "$out" != "ログ開始（終了するには exit ）
>" ]; then
    ng "$LINENO"
fi


## ====== すべてのテストが通ったら OK ======
if [ "$res" = 0 ]; then
    echo OK
fi

exit $res

