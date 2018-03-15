---
title: How to make a HTML5-based presentation
date: 2015-06-02T01:40:49+00:00
categories:
  - Presentation
---

HTML5ベースのプレゼンがはやってるみたいなので，どうやって実現しているか（とそのフレームワーク）を調査．

HTML5-based presentationならアニメーションをAdobe Edge Animateで簡単に作れる．(<a href="http://therichwebexperience.com/blog/terry_ryan/2012/10/add_edge_animate_compositions_to_reveal_js" target="_blank">http://therichwebexperience.com/blog/terry_ryan/2012/10/add_edge_animate_compositions_to_reveal_js</a>

CSS3アニメーションの参考サイト
  
(<a href="http://webkikaku.co.jp/staff/htmlcss/css3animation/" target="_blank">http://webkikaku.co.jp/staff/htmlcss/css3animation/</a>)

Animate.css
  
(<a href="http://daneden.github.io/animate.css/" target="_blank">http://daneden.github.io/animate.css/</a>)

reveal.jsを使ったプレゼンの簡単なイントロ
  
(<a href="http://webbeginner.hatenablog.com/entry/2014/03/30/012720" target="_blank">http://webbeginner.hatenablog.com/entry/2014/03/30/012720</a>)

日本語フォントの設定例
  
(<a href="http://g-azami.tumblr.com/post/76447906591/a-2014-edition-japanese-css-font-family-set" target="_blank">http://g-azami.tumblr.com/post/76447906591/a-2014-edition-japanese-css-font-family-set</a>)

ちなみに，reveal.jsで日本語をメイリオ，英語をMyriad Proにしたいなら，使用しているテーマ（例えば，css/theme/black.css)でfont-familyを検索して，
  
 `font-family: 'Source Sans Pro', Helvetica, sans-serif;` 
  
のところを
  
 `font-family: Myriad Pro, Meiryo, Verdana, "游ゴシック", YuGothic, "Hiragino Kaku Gothic ProN", sans-serif;` 
  
に書き換えると良い．（2箇所）
