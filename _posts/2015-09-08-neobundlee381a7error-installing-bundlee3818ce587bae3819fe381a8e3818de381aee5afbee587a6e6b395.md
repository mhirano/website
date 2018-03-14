---
title: NeoBundleでError Installing Bundleが出たときの対処法
date: 2015-09-08T15:53:50+00:00
categories:
  - Vim
---
例えば，新しい環境で新しいプラグインをNeoBundleを使って導入しようとした時に嵌まりがちなところ． NeoBundleはgitで管理されているプロジェクトを自動的にインストールするものなので，システムのPathにgitが通っていないとうまく動かない． Gitをインストールし，環境変数に以下を使いすればよい. `C:\Program Files\Git\cmd`    
