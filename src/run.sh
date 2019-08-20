SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# -e: テキストエディタ（対話モード）
#sqlite3
#.once -e
#select 1, 'AAA' union select 2, 'BBB';

# -x: 表計算アプリ（対話モード）
#sqlite3
#.once -x
#select 1, 'AAA' union select 2, 'BBB';

# FILE: ファイル
sqlite3 :memory: \
".once a.csv" \
"select 1, 'AAA' union select 2, 'BBB';" \
".shell cat a.csv"
cat a.csv

# PIPE
sqlite3 :memory: \
".once '| xargs -I@ zenity --info --text \"@\"'" \
"select 1, 'AAA' union select 2, 'BBB';"

# PIPE 複数行
sqlite3 :memory: \
".separator '|' '\\\n' " \
".once '| xargs -I@ zenity --info --text \"`printf \"@\"`\"  '" \
"select 1, 'AAA' union select 2, 'BBB';"

