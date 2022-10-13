## 開発環境
- Ruby 3.1.2
- Ruby on Rails 6.1.7

## ローカル環境での実行方法
```
$ git clone https://github.com/poko-1951/problem_server_side_A.git
$ bundle install
$ rails db:migrate
```

以下のエラーが表示された場合には、Webpackerの再インストールを実行

`Webpacker::Manifest::MissingEntryError`

（対処）以下を実行
```
bundle rails webpacker:install
bundle rails webpacker:compile
```