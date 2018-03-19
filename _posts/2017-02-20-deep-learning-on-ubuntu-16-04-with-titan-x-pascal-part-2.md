---
title: Deep learning on Ubuntu 16.04 with Titan X Pascal (Part 2)
date: 2017-02-20T16:56:15+00:00
categories:
  - DeepLearning
toc: true
---

「コンシューマ向け最強のデュープラーニング用マシンが欲しいんや！」

<a href="http://masahirodll.com/misc/?p=464" target="_blank">Deep learning on Ubuntu 16.04 with Titan X Pascal (Part 1)</a>のつづきです．

GPUが搭載されているUbuntu 16.04がインストールされている計算機にNVIDIA ドライバがインストールされていれば，ここから始めてもOKです．

Dockerのインストールから，JupyterでTensorflowを走らせるところまでを紹介します．

## <span style="font-family: Dosis, sans-serif; font-size: 30px; letter-spacing: -0.4px;">1. Docker のインストール</span>

<a href="https://docs.docker.com/engine/installation/linux/ubuntu/" target="_blank">公式ドキュメント</a>  が非常に親切にまとめられていて，この通りやるとまずつまずくことはないと思います．

やることはすぐ終わるのですが，少し手順が複雑なので公式ドキュメントを参照してください．上記のインストールが終わったら，Dockerを使いやすくするため，<a href="https://docs.docker.com/engine/installation/linux/linux-postinstall/" target="_blank">LInuxインストール後のステップ</a> も行ってください．（この作業をすると，dockerのコマンドを叩く時に毎回sudoする必要が無くなり，起動時に自動的にdockerが走るように設定できます．）

## 2. NVIDIA-Dockerのインストール

このままだとdockerからGPUを活用することができませんので，DockerのプラグインであるNVIDIA-dockerを入れます．（2017/2/18時点でのコマンドですので，バージョンアップ等によって異なる場合があります．<a href="https://github.com/NVIDIA/nvidia-docker#ubuntu-distributions" target="_blank">github:NVIDIA/nvidia-docker</a>を参考にしてください．）

### 2. 1 パッケージのダウンロード

一度 docker daemonを再起動しておきましょう．

```
$ sudo service docker restart
``` 

続いてパッケージをダウンロードします．

``` 
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
```

セキュリティの設定によっては，証明書関連でエラーが出ることがありますので，その際はかわりに以下を実行してください．

```
wget --no-check-certificate -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
```

（なぜかwgetの際にホスト名が解決できないというエラーが出たのですが，上のコマンドを何度も叩いているうちにダウンロードできました．奥が深いです．）

### 2. 2 パッケージのインストール

パッケージをインストールします．

```
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
```

### 2. 3 動作確認

NVIDIA ドライバをインストールした時と同様に，nvidia-smiで動作確認してみましょう．

```
nvidia-docker run --rm nvidia/cuda nvidia-smi
```

実行した結果，以下のようにプロファイルが表示されればインストール成功です．

```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 375.39 Driver Version: 375.39 |
|-------------------------------+----------------------+----------------------+
| GPU Name Persistence-M| Bus-Id Disp.A | Volatile Uncorr. ECC |
| Fan Temp Perf Pwr:Usage/Cap| Memory-Usage | GPU-Util Compute M. |
|===============================+======================+======================|
| 0 TITAN X (Pascal) Off | 0000:02:00.0 On | N/A |
| 23% 28C P8 9W / 250W | 63MiB / 12187MiB | 0% Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes: GPU Memory |
| GPU PID Type Process name Usage |
|=============================================================================|
+-----------------------------------------------------------------------------+
```

## 3. Tensorflowを動かしてみる．

ここまででDocker上でGPUを使うことができるようになりました．

後は好きなようにDockerイメージを作ってrunさせるだけです．

ここでは，TensorFlowの開発チームが提供している出来合いのイメージがありますので，それを使ってTensorFlowを動かしてみます．

### 3. 1 TensorFlowイメージの実行

Docker Hub上のTensorFlowのリポジトリからビルド済みのイメージを使って起動してみます．

```
nvidia-docker run -it -p 8888:8888 gcr.io/tensorflow/tensorflow:latest-gpu
```

すると，

```
masa@hinton:~$ nvidia-docker run -it -p 8888:8888 gcr.io/tensorflow/tensorflow:latest-gpu
[I 01:46:58.799 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[W 01:46:58.815 NotebookApp] WARNING: The notebook server is listening on all IP addresses and not using encryption. This is not recommended.
[I 01:46:58.819 NotebookApp] Serving notebooks from local directory: /notebooks
[I 01:46:58.819 NotebookApp] 0 active kernels
[I 01:46:58.819 NotebookApp] The Jupyter Notebook is running at: http://[all ip addresses on your system]:8888/?token=e1da5e296207ae2f4f1e6787e331174e375b4c674f7f6df7
[I 01:46:58.819 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 01:46:58.819 NotebookApp]

Copy/paste this URL into your browser when you connect for the first time,
 to login with a token:
 http://localhost:8888/?token=e1da5e296207ae2f4f1e6787e331174e375b4c674f7f6df7
``` 

となり，jupyter server が起動したことが確認できます．

jupyterの初回起動時には認証が要求されるようなので，ここで出て来たURLをクリックするかブラウザにコピペすると，jupyter notebookが起動できます．

あらかじめリポジトリで用意してくれているtensorflowのチュートリアルがありますので，それをいじってみてtensorflowがきちんと動いていることを確認して見るとよいでしょう．

## 4. おわりに

ここまでで，Ubuntu上にインストールしたdockerからtensorflowのイメージをrunさせる方法までを紹介しました．

ですが，実際に運用するとなると計算機サーバーとして使いたくなることがあると思います．例えば他のPCからsshで接続したいとか，手元のブラウザからjupyter使いたいとかです．

一応自分が使っている環境ではサーバーとして運用していますので，その方法をDeep learning on Ubuntu 16.04 with Titan X Pascal (Part 3) で紹介します．
