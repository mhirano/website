---
title: WordPress + MathJax
date: 2015-05-20T08:32:20+00:00
categories:
  - WordPress
---
以下のスクリプトをheader.phpの中の<head>~</head>内に追加する．

>     <script type="text/x-mathjax-config">
>       MathJax.Hub.Config({ tex2jax: { inlineMath: [['$','$'], ["\\(","\\)"]] } });
>     </script>
>     <script type="text/javascript"
>       src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML">
>     </script>
>     <meta http-equiv="X-UA-Compatible" CONTENT="IE=EmulateIE7" />

参考：http://genkuroki.web.fc2.com/
