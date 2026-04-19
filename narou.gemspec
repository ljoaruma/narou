# -*- mode: ruby -*-
# -*- coding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "version"
require "fileutils"
module Narou
  def self.create_git_commit_version
    File.write("commitversion", `git describe --always`.strip)
    "commitversion"
  end
end
at_exit do
  if File.exist?("commitversion")
    FileUtils.rm("commitversion")
  end
end
Encoding.default_external = Encoding::UTF_8
Gem::Specification.new do |gem|
  gem.name          = "narou-ljoaruma"
  gem.version       = ::Narou::VERSION
  gem.license       = "MIT"
  gem.authors       = ["ljoaruma"]
  gem.email         = ["ljoaruma@users.noreply.github.com"]
  gem.homepage      = "https://github.com/ljoaruma/narou"
  gem.summary       = %q{Narou.rb ― 小説家になろうダウンローダ＆縦書用整形スクリプト(個人パッチ版)}
  gem.description   = %q{
小説家になろうで公開されている小説の管理、及び電子書籍データへの
変換を支援します。縦書用に特化されており、横書き用に特化されたWEB小説
を違和感なく縦書で読むことが出来るようになります。
本モジュールは http://whiteleaf.hatenablog.com/ のnarou.rbをベースに個人的なパッチを加えたものです。
}.split("\n").join
  install_message = <<-EOS
#{"*" * 60}

3.9.1-ljoaruma-p5 : 2026-04-19
-----------------
- 小説の指定範囲を切り出す設定 `segment_by_range` が追加されました。segment_by_range で指定した範囲の話数で小説を分割します。
- slice_sizeを指定した小説の1つ目のファイル名に"_1"がつかない問題の修正
- slice_size指定時、2つ目以降のファイルの目次が不正になる問題の修正

3.9.1-ljoaruma-p4: 2025-10-02
-----------------
- カクヨム 構造変更修正 #452 @kita77777

3.9.1-ljoaruma-p3: 2025-10-02
-----------------
- ノクターン/ムーンライト/ミッドナイトノベルズ 作品情報 取得修正 #446 @etg-lt
- 小説家になろう 作品情報 取得修正 #446 @etg-lt

3.9.1-ljoaruma-p2: 2025-03-20
-----------------
- 電書協最小対応版 取り込み #439 @rogenobl

3.9.1-ljoaruma-p1: 2025-03-10
-----------------
- ノクターン/ムーンライト/ミッドナイトノベルズ 作品情報 取得修正
- バージョン情報を2.1に仮指定
- 小説家になろう 作品情報 取得修正
- Replace Erubis by Erubi

3.9.1: 2024-09-19
-----------------
#### 修正内容
- 小説家になろうの目次修正に対応 #432 @etg-lt

#{"*" * 60}
  EOS
  gem.post_install_message = install_message.gsub("\t", "  ")

  gem.required_ruby_version = ">=2.3.0"

  gem.files = `git ls-files`.split("\n").reject { |fn| fn =~ %r!^spec/|^"spec! } << Narou.create_git_commit_version
  gem.executables = gem.files.grep(%r!^bin/!).map { |f| File.basename(f) }

  gem.add_runtime_dependency 'termcolorlight', '~> 1.0', '>= 1.1.1'
  gem.add_runtime_dependency 'rubyzip', '~> 2.0', '>= 2.0.0'
  gem.add_runtime_dependency 'mail', '~> 2.6.0', '>= 2.6.6'
  gem.add_runtime_dependency 'pony', '~> 1', '>= 1.11'
  gem.add_runtime_dependency 'diff-lcs', '~> 1.2', '>= 1.2.5'
  gem.add_runtime_dependency 'sinatra', '~> 2.0', '>= 2.0.8.1'
  gem.add_runtime_dependency 'sinatra-contrib', '~> 2.0', '>= 2.0.8.1'
  gem.add_runtime_dependency 'tilt', '~> 2.0', '>= 2.0.10'
  gem.add_runtime_dependency 'sassc', '~> 2.4'
  gem.add_runtime_dependency 'ffi', '~> 1.4', '>= 1.4.2'
  gem.add_runtime_dependency 'haml', '>= 5.1.2', '< 6'
  gem.add_runtime_dependency 'memoist', '~> 0.11.0'
  gem.add_runtime_dependency 'systemu', '~> 2.6', '>= 2.6.5'
  gem.add_runtime_dependency 'erubi', '~> 1.13'
  gem.add_runtime_dependency 'open_uri_redirections', '~> 0.2', '>= 0.2.1'
  gem.add_runtime_dependency 'activesupport', '>= 6.1', '< 8.0'
  gem.add_runtime_dependency 'unicode-display_width', '~> 1.4'
  gem.add_runtime_dependency 'webrick', '~> 1.7'
  gem.add_runtime_dependency 'psych', '~> 4.0'
  gem.add_runtime_dependency 'ostruct', '~> 0.6.3'
  gem.add_runtime_dependency 'csv', '~> 3.3', '>= 3.3.5'
  gem.add_runtime_dependency 'base64', '~> 0.3.0'
  gem.add_runtime_dependency 'nkf', '~> 0.2.0'

  gem.add_development_dependency 'rspec', '~> 3.10'
  gem.add_development_dependency 'rspec-retry', '~> 0.6'
  gem.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  gem.add_development_dependency 'timecop', '~> 0.9'
  gem.add_development_dependency 'pry', '~> 0.12'
  gem.add_development_dependency 'pry-byebug', '~> 3.8'
  gem.add_development_dependency 'awesome_print', '~> 1.8'
  gem.add_development_dependency 'simplecov', '~> 0.20'
end

