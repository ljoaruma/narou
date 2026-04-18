Narou.rbを変更する際の手引き
=====================================

クローンからbundlerのセットアップまで
----------------------------------

```bash
git clone https://github.com/whiteleaf7/narou.git
cd narou
bundle config set path 'vendor/bundle'
bundle install
```

変更後のテスト実行
----------------

```bash
bundler exec rake spec
```

バージョンの更新
--------------

以下のファイルを変更
+ [ChangeLog.md](ChangeLog.md) 更新履歴
+ [lib/version.rb](lib/version.rb) バージョン番号更新
+ [narou.gemspec](narou.gemspec) バージョン番号更新


Gemの作成からローカルインストール
------------------------------

```bash
gem build
gem install ./narou-*.*.*.gem
```
