#!/bin/bash
set -e # 「エラーが発生するとスクリプトを終了する」オプション

# Remove a potentially pre-existing server.pid for Rails.
# Rails でよくある server.pid のエラーを回避するため、Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /mental_barometer_page/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# コンテナのプロセスを実行。`exec "$@"`で、Dockerfile 内の`CMD ["rails", "server", "-b", "0.0.0.0"]`を実行。(=`rails s`)
exec "$@"