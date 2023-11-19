FROM ruby:3.2.2

RUN mkdir /mental_barometer_page
WORKDIR /mental_barometer_page

# COPY：コピー元とコピー先を指定
# ホストのGemfileをコンテナ内の作業ディレクトリにコピー
COPY Gemfile /mental_barometer_page/Gemfile
COPY Gemfile.lock /mental_barometer_page/Gemfile.lock

# Bundlerの不具合対策(1)
# RubyGemsをアップデート
RUN gem update --system
# bundlerをアップデート
RUN bundle update --bundler

RUN bundle install
# ホストのファイルをコンテナ内の作業ディレクトリにコピー
COPY . /mental_barometer_page

# Add a script to be executed every time the container starts.
# entrypoint.shをコンテナ内の作業ディレクトリにコピー
COPY entrypoint.sh /usr/bin/
# entrypoint.shの実行権限を付与
RUN chmod +x /usr/bin/entrypoint.sh
# コンテナ起動時にentrypoint.shを実行するように設定
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# コンテナ起動時に実行するコマンドを指定
CMD ["rails", "server", "-b", "0.0.0.0"]