---
title: 'MacTeX + MacVim-kaoriya on Mac'
date: 2016-05-18T19:18:08+00:00
categories:
  - TeX
  - Vim
  - 未分類
---

# TeXをMac (El Capitan)で，しかもMacVimで編集したい！

って人向け．とにかくコンパイルしてpdfを吐くところまで最短で行きたい人ウェルカム．サクサクやれば全部で1時間30分ぐらいでできる．

_（5/25注記：日本語を含むファイルをコンパイルしようとすると文字化けするエラーを確認．platex周りのエラーだと思われるため，.vimrcを変更すれば対処できるはず（環境自体は変更なしで対処できる）なので近々対応予定．→　5/26 対応．テンプレファイルのエンコーディングとプリアンブルを変更．.vimrcでもplatexのオプションに -guess-input-enc を追加．__）_

* * *

## アウトライン

  1. 周辺環境構築
  2. TeXのインストール
  3. MacVimのインストール
  4. Vim関連の設定（VimへのNeoBundleのインストール，.vimrcファイル等の設定）
  5. Skimのインストール
  6. 動作チェック

この順で進めていきます．

* * *

## 環境

OS: Mac OSX (El Capitan)
  
（注：多分モダンなOSXなら同様の手順でできます．確認はしてません．）

新品のMacを想定しているので，homebrewなどすでに環境導入済みの場合は適宜飛ばしてください．

### 1. 周辺環境構築

ghostscriptを単独でインストールするためにhomebrewを用いる．この方が後で問題が少ないらしい．[1]

<a href="http://brew.sh/index_ja.html" target="_blank">Homebrew</a>に行き，インストールのところにあるシェルをターミナルに貼り付けて実行．

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

アップデートされたEl Capitan等ではパーミッション関連で問題が発生するらしい．

続いてpdf周りのインタプリタなどのパッケージでTeXをpdf化する際に必要なghostscriptをインストール．

``` 
$ brew install Ghostscript
``` 

### 2. TeXのインストール [1]

<a href="https://tug.org/mactex/" target="_blank">MacTeX</a>をインストールする．TeXLiveのMac版．

中段にある MacTeX Download と書いてあるところに行き，MacTeX.pkgをダウンロード．（執筆時最新版は14 June 2015）

インストーラーを起動し，**インストールの種類のところで[カスタマイズ]を選択．**カスタムインストールのところで，Ghostscriptのチェックを外して[インストール]をクリック．

インストールが終了した後は，パッケージを最新版にアップデートする．

```
$ sudo tlmgr update --self --all
``` 

しばらく時間がかかるので，コーヒーでも飲む．（約１時間ぐらい？）

続いて，Macの標準フォントであるヒラギノを使うために以下のコマンドを１行ずつ入力．

**（Yosemite以前のMacOSでヒラギノを使う場合は，例えば以下のリンクを用いてフォントのマッピングや埋め込み等を設定する．**

**<a href="http://osksn2.hep.sci.osaka-u.ac.jp/~taku/osx/embed_hiragino.html" target="_blank">教授でもできる、TeXShop + MacTeX /UpTeX でのヒラギノ フォントの埋め込み</a>**

**[TeX WIki &#8211; 日本語の設定](https://texwiki.texjp.org/?TeX%20Live%2FMac#i9febc9b)**
**）**

``` 
$ cd /usr/local/texlive/2015/texmf-dist/scripts/cjk-gs-integrate
$ sudo perl cjk-gs-integrate.pl --link-texmf --force
$ sudo mktexlsr
$ sudo kanji-config-updmap-sys hiragino-elcapitan-pron
``` 

### 3. MacVimのインストール

本家MacVimに日本語パッチなどいろいろあててある便利なMacVim-Kaoriyaを使う．

[githubのリリースページ](https://github.com/splhack/macvim-kaoriya/releases/tag/20160325) 
の
[MacVim-KaoriYa-20160325.dmg](https://github.com/splhack/macvim-kaoriya/releases/download/20160325/MacVim-KaoriYa-20160325.dmg) 
からダウンロードしてインストールする．特に設定は必要なし．

### 4. Vim関連の設定（VimへのNeoBundleのインストール，.vimrcファイル等の設定）

Vimer必携のパッケージ管理ソフトNeoBundleをインストールする．（最近は<a href="http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542?utm_content=buffer1bafe&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer" target="_blank">dein.vimって奴</a>がオススメらしい．NeoBundleの作者自身が乗り換えを進めているらしい．）

以下のコマンドを実行する．

```
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
$ sh ./install.sh
$ rm -rf install.sh
```

ホームディレクトリ直下の~/.vimにbundleというフォルダが生成されていることを確認．

続いてvimの設定ファイルを作成する．

Macvim-Kaoriya特有のVim-latex使用時に日本語入力が中段するエラーがあるらしく，それを回避するコードを.gvimrcに埋め込んである．

.vimrcと.gvimrcは以下のものをダウンロードし，リネームしてホーム直下，.vimと同じ階層に保存．

[vimrc.txt](to be placed) → .vimrc ( ~/.vimrc)

[gvimrc.txt](to be placed) → gvimrc (~/.gvimrc)

このvimrcでは，vim-latexというパッケージを使用する．
  
（参考URL: 
[https://texwiki.texjp.org/?Vim-LaTeX#eb85b35a](https://texwiki.texjp.org/?Vim-LaTeX#eb85b35a) ）

TeXではコマンドを指定する際にバックスラッシュ(`\`)を多用するが，Macでは`<Option> + ¥`としなければ入力できないため面倒．なので，Vimの入力モードの時に¥を押すと，`\`が入力されるようにマッピングしている．

### 5. Skimのインストール

TeXファイル中のどの部分がpdfファイルのどの部分に対応するのかというマッピングをplatexで生成することができる機能がある(syncTeX)のだが，この機能を使用するためには対応するpdf viewerが必要．
Macでは [Skim](http://skim.softonic.jp/mac) がデファクトなのでそれをインストールする．

コンパイルしたpdfファイルに変更があった場合に自動でリロードしてくれる機能もあるので非常に便利．

Skim → 環境設定より，

  * 「一般」タブで「開く：合わせる」に変更する．
  * 「同期する」タブで，ファイルの変更をチェックにチェック．
  * PDF-TeX同期サポートをMacVimに設定．

### 6. 動作チェック

まず，MacVimを起動．初回起動時は各種パッケージがインストールされていない状態なので，インストールを促すポップアップが出てくるので，yesをクリックする．

[俺お手製の便利TeXテンプレート]({{ "/assets/documents/template-for-brief-report.zip" | absolute_url }})をダウンロード．（簡単なレポート，技術報告に使えて便利！）

これを展開し，report.texをMacVimで開く．

`¥ll`を素早く入力し，コンパイル！ 続いて，`¥lv`を入力しpdfがSkimで開ければOK！

* * *

参考にしたリンクなど

[1] [OS X El CapitanでTeX環境をゼロから構築する方法](http://qiita.com/hideaki_polisci/items/3afd204449c6cdd995c9)

[2] <http://mmi.hatenablog.com/entry/2015/01/02/003517>