---
layout: page
title: "Options"
date: 2018-05-29 08:08
comments: false
sharing: false
footer: true
---

Railroaderのオプションドキュメント（[OPTIONS.md](https://github.com/presidentbeef/railroader/blob/master/OPTIONS.md)）を翻訳しました。

共同翻訳者は@jnchitoです。

## スキャン関連のオプション

チェック項目のいくつかはデフォルトでは実行されません。すべてのチェックを実行したい場合は次のオプションを使います。

```
railroader -A
```

各チェックはデフォルトで別々のスレッドで実行されます。この振る舞いを無効にしたい場合は次のオプションを使います。

```
railroader -n
```

Railroaderはデフォルトでカレントディレクトリをスキャンします。次のようにして、特定のパスをそのまま引数として渡すこともできます。

```
railroader some/path/to/app
```

しかし、もっと明示的にしたい場合は、`-p`または`--path`オプションが使えます。

```
railroader -p path/to/app
```

警告の出力を抑制し、レポートだけを出力したい場合は次のオプションを使います。

```
railroader -q
```

レポート以外のRailroaderの出力はすべて標準エラー出力に出力されます。ですので、標準出力をファイルにリダイレクトするだけで、レポートを作成することができます。

Railroaderは大きな問題がない限り、セキュリティの脆弱性かスキャンのエラーが見つかったら、0でないエラーを返します。
その動作を無効にするために次のオプションを使ってください：

```
railroader --no-exit-on-warn --no-exit-on-error
```

Rails 3モードで動かしたい場合は次のオプションを使います。

```
railroader -3
```

Rails 4モードであれば次のようになります。

```
railroader -4
```

Railroaderの振る舞いやチェック項目の中には、特定のバージョン名に依存したものがある点に注意してください。とはいえ、`Gemfile.lock`を使っている最近のRailsアプリケーションであれば問題にならないはずです。

Railroaderは以前、`routes.rb`をパースして、コントローラのどのメソッドがアクションとして使われているのかを推測しようとしていました。しかし、この方法は完璧ではありません（特にRails 3/4において）。そのため、現在はすべてのコントローラのメソッドがアクションと見なされます。この振る舞いを無効にしたい場合は次のオプションを使います。

```
railroader --no-assume-routes
```

このオプションはあまり必要ではないかもしれませんが、次のようなオプションを使うと、Railroaderに対して、アプリケーションの出力がデフォルトですべてエスケープされていると伝えることができます。

```
railroader --escape-html
```

もしRailroaderの実行が遅ければ、次のオプションを試してください。

```
railroader --faster
```

上のオプションを使うといくつかの機能が無効になります。そのかわり、ずっと速く実行できるかもしれません（現時点では`--skip-libs --no-branching`を指定したことと同じになります）。 **警告:** このオプションを使うと、Railroaderはいくつかの脆弱性を見逃すかもしれません。

`if`文におけるデータフロー感度（flow sensitivity、経路や順序の解析）を無効にする場合は次のオプションを使います。

```
railroader --no-branching
```

すべて無効にするかわりに、解析する分岐の数を指定することもできます。

```
railroader --branch-limit LIMIT
```

`LIMIT`は整数値を指定してください。`0`は`--no-branching`とほぼ同じなので、`--no-branching`の方がいいでしょう。デフォルト値は`5`です。一般的に数字が小さくなるほどRailroaderの実行が速くなります。`-1`は無制限の意味になります。

特定のファイル、またはディレクトリをスキップする場合は次のオプションを使います。

```
railroader --skip-files file1,/path1/,path2/
```

ディレクトリはアプリケーションのルートパスからの相対パスにマッチします。また、使用しているプラットフォームのパスセパレータ（たとえば`/`）で終わる必要があります。上の実行例は以下ルールでマッチ、スキップします。

- `file1`という名前のあらゆるファイル。`file1`がパスの一部に含まれるファイルはスキャン対象になります。
- `/path1`の中のあらゆるファイル。`/`で始まっているので、アプリケーションのルートディレクトリ以下のディレクトリにだけマッチします。たとえば、`/lib/path1/some_path1_file.rb`はスキャン対象になります。
- `path2`という名前のあらゆるディレクトリ。`/`で始まっていないので、パスの一部に`path2`という名前が含まれるディレクトリがスキップされます。たとえば、`/lib/path2/some_lib_for_testing.rb`はスキャンされません。

Railroaderは「全体プログラム（whole program）」解析を実行する点に注意してください。そのため、ファイルをスキップするとそれ以外のファイルからも警告が出力されるかもしれません。

その反対で、特定のファイルだけを指定する、ちょっと危険なオプションもあります。

```
railroader --only-files file1,/path2/,path2/
```

繰り返しになりますが、Railroaderはプログラム全体を解析します。そのため、ファイルの一部だけをスキャンすると、予期しない動きをするかもしれません。また、特定のファイルが除外されると、Railroaderは正常に機能しないかもしれません。

`lib/`ディレクトリに対する処理をスキップする場合は次のオプションを使います。

```
railroader --skip-libs
```

チェック項目の一部を実行する場合は次のオプションを使います。

```
railroader --test Check1,Check2,etc
```

特定のチェック項目を除外する場合はこうします。

```
railroader --except Check1,Check2,etc
```

チェック項目名の`Check`の部分は省略可能です。たとえば、次の2つのオプションは同じ意味になります。

```
railroader --test CheckSQL
railroader --test SQL
```

## 出力オプション

デバッグ情報をすべて見たい場合は次のオプションを実行します。

```
railroader -d
```

実行結果の出力ファイルを指定する場合は次のオプションを使います。

```
railroader -o output_file
```

出力フォーマットはファイル拡張子、もしくは`-f`オプションによって決まります。現在有効なオプションは、`text`、`html`、`tabs`、`json`、`markdown`、`csv`です。

複数の出力ファイルを指定することもできます。

```
railroader -o output.html -o output.json
```

HTMLレポートには特定のCSSスタイルシートが使えます。

```
railroader --css-file my_cool_styling
```

デフォルトではRailroaderは同じ行にある同じタイプの警告を1個しか出力しません。これを無効にする場合は次のオプションを使います。

```
railroader --no-combine-locations
```

"dangerous"な値や、"user input"による値の警告ハイライトを無効にする場合は次のオプションを使います。

```
railroader --no-highlights
```

コントローラとルーティングの情報を報告する場合は次のオプションを使います。

```
railroader --routes
```

ですが、アプリケーションにどんなルーティングが設定されているか確認したい場合は、次のコマンドを使ってください（訳注: Rails 5以降は`rails routes`になります）。

```
rake routes
```

HTMLレポートのメッセージの長さを制限する場合は、次のオプションを使います。

```
railroader --message-limit LIMIT
```

デフォルトは無制限です。

Railroaderは`attr_accessible`を持たないモデルに対して警告を発します。HTMLレポートでは次のオプションを使って、全モデルの警告を1つの警告にまとめた方が便利かもしれません（訳注: `attr_accessible`はRails 3以前のオプションだったので、最近のRailsアプリケーションでは無関係かもしれません）。

```
railroader --no-separate-models
```

巨大なレポートではなく、サマリーだけを取得したい場合もあるかもしれません。そんな場合は次のオプションを使います。

```
railroader --summary
```

デフォルトではレポートには相対パスが使われます。かわりに絶対パスを使いたい場合は次のオプションを使います。

```
railroader --absolute-paths
```

上のオプションはHTMLとタブ区切りのレポートには影響しません。

Markdown出力時にGitHub上のファイルへリンクを貼りたい場合は、次のオプションを使ってください。

```
railroader --github-repo USER/REPO[/PATH][@REF]
```

次はその使用例です。

```
railroader --github-repo presidentbeef/inject-some-sql
```

前回実行したスキャン結果と今回の結果を比較したい場合は、JSON出力と次のオプションを使ってください。

```
railroader --compare old_report.json
```

上のオプションを付けて実行すると、修正された警告と新しい警告の2種類のリストが出力されます。

デフォルトではRailroaderは`less`ページャー（`less`コマンド）を使って結果を出力します。ターミナルに直接出力したい場合は、次のオプションを使ってください。

```
railroader --no-pager
```

## 無視に関するオプション

Railroaderは設定次第で警告を無視することができます。デフォルトでは`config/railroader.ignore`という設定ファイルが使われます。

設定ファイルを指定したいときは次のオプションを使います。

```
railroader -i path/to/config.ignore
```

このファイルの作成と管理を行う場合は次のオプションを使ってください。

```
railroader -I
```

モデルの属性に関するXSSの疑いを無視する場合は次のオプションを使います。

```
railroader --ignore-model-output
```

Railroaderは`attr_protected`を使っているモデルに対して警告を発します。この警告を抑制する場合は次のオプションを使います（訳注: `attr_protected`もRails 3以前のオプションだったので、最近のRailsアプリケーションでは無関係かもしれません）。

```
railroader --ignore-protected
```

信頼できないデータを扱う未知のメソッドがあった場合、Railroaderは危険な処理と見なします。たとえば、次のコードは警告の対象になります（Rails 2の場合）。

```
<%= some_method(:option => params[:input]) %>
```

信頼できないデータが直接使われている場合のみ警告を出したいときは、次のオプションを使います。

```
railroader --report-direct
```

とはいえ、各チェック項目における上記オプションのサポート状況にはあまり一貫性がありません。

特定のメソッドが適切にエスケープされた値を出力し、そのメソッドがXSSチェックで警告されないようにするためには、次のオプションを使います。

```
railroader --safe-methods benign_method_escapes_output,totally_safe_from_xss
```

Railroaderは`link_to`メソッドを使って作成されたURLにユーザー入力が含まれていると警告を発します。Railsにはこの方法で作成されたURLを安全にする方法がないため（例：プロトコルをHTTP(S)に限定する、など）、安全なメソッドを無視したい場合は次のオプションを使ってください。

```
railroader --url-safe-methods ensure_safe_protocol_or_something
```

## Confidenceレベル（自信レベル）

Railroaderは各警告にconfidenceレベルを設定しています。これは出力された警告がどれくらい問題なのか、大まかに見積もった値です。当然ながら、この値を絶対的なものとして信用するのはよくありません。

confidenceレベルは3段階あります。

- High - 軽微な警告（boolean値）だったり、ユーザー入力が安全でない方法で使われたりしていることを意味する。
- Medium - 主に変数の使い方が安全でないことを示す。しかし、その変数はユーザー入力かどうか定かではない。
- Weak - 主にユーザー入力が、安全性が疑われる方法で間接的に使われていることを意味する。

指定したconfidenceレベル以上の警告だけを受け取りたい場合は、次のオプションを使います。

```
railroader -w3
```

`-w`スイッチには1から3までの数字を指定できます。1は低レベル（全警告を出力）で、3は高レベル（confidenceレベルが最高の警告のみ出力）です。

## 設定ファイル

RailroaderのオプションはYAMLファイルで読み書きできます。設定ファイルを作成する手間を省きたい場合は`-C`オプションを使うと、そこで指定されているオプションを出力することができます。

コマンドラインで指定されたオプションは設定ファイルよりも優先されます。

設定ファイルのデフォルトの場所は`./config/railroader.yml`、`~/.railroader/config.yml`、`/etc/railroader/config.yml`です。

`-c`オプションを使うと、使用する設定ファイルを指定できます。

## その他

利用可能なチェック項目を簡単な説明付きで一覧表示する場合は次のオプションを使います。

```
railroader --checks
```

任意で実行される（デフォルトでは実行されない）チェック項目を表示する場合は次のオプションを使います。

```
railroader --optional-checks
```

Railroaderのバージョンを確認する場合は次のオプションを使います。

```
railroader --version
```

オプションの一覧を見たい場合は次のオプションを使います。

```
railroader --help
```

---

[その他のドキュメント](/docs)
