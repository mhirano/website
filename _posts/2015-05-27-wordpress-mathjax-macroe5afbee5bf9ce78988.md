---
title: WordPress + MathJax (Macro対応版)
date: 2015-05-27T18:12:47+00:00
categories:
  - WordPress
---
  1. Themeのjsフォルダ(e.g. /var/www/html/wp-content/themes/tikva/js)に&#8221;MathJaxConfig.js&#8221;という下記の内容のファイルを作成する． 
    <pre>MathJax.Hub.Config({
 tex2jax: {
   inlineMath: [ ['$','$'], ["\\(","\\)"] ],
   displayMath: [ ['$$','$$'], ["\\[","\\]"] ]
 },
 TeX: {
   extensions: ["AMSmath.js", "AMSsymbols.js"],
   Macros: {
     C: '{\\mathbb C}',
     R: '{\\mathbb R}',
     Q: '{\\mathbb Q}',
     Z: '{\\mathbb Z}',
     diag: '\\mathop{\\mathrm{diag}}\\nolimits',
     np: ['{#1}#2{#1}', 2],
     vector: ['\\boldsymbol{#1}',1]
   }
 }
});</pre>

  2. header.phpの<head>ブロック内に下記の内容を追加． 
    <pre>&lt;script type="text/javascript"
   src="&lt;?php echo get_stylesheet_directory_uri() . '/js/MathJaxConfig.js'; ?&gt;"&gt;
 &lt;/script&gt;</pre>

  3. functions.phpの末尾に下記の内容を追加． 
    <pre>function my_scripts(){
 wp_enqueue_script('MathJaxConfig', get_stylesheet_directory_uri() . '/js/MathJaxConfig.js', array(), false, false);
 wp_enqueue_script('MathJaxConfig2', 'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML',
array(), false, false);
}
add_action( 'wp_enqueue_scripts', 'my_scripts');</pre>

これで，MathJaxConfig.js内で定義した$\TeX$のマクロが使えるようになる．

参考URL：

<a href="http://genkuroki.web.fc2.com/" target="_blank">http://genkuroki.web.fc2.com/</a>
  
<a href="http://docs.mathjax.org/en/latest/tex.html" target="_blank">http://docs.mathjax.org/en/latest/tex.html</a>
  
<a href="http://d.hatena.ne.jp/yascentur/20111215/1323879218" target="_blank">http://d.hatena.ne.jp/yascentur/20111215/1323879218</a>

MathJaxで使えるコマンドは
  
<a href="http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm" target="_blank">http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm</a>に詳しい．
