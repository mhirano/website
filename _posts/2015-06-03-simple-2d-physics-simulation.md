---
title: simple 2d physics simulation
date: 2015-06-03T23:32:28+00:00
categories:
  - Physics engine
---
matter-jsというライブラリが良さそうなのでメモ．
  
<a href="http://brm.io/matter-js/" target="_blank">http://brm.io/matter-js/</a>

Gigazineにも紹介されていた．
  
<a href="http://gigazine.net/news/20150122-matter-js/" target="_blank">http://gigazine.net/news/20150122-matter-js/</a>

matter.jsを使った物理シミュレーションの一番シンプルなやり方

1. index.htmlを作成．

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <script src="Matterjs/matter.js"></script>
  </head>
  <body>
    <script type="text/javascript">
       // Matter.js module aliases
       var Engine = Matter.Engine,
       World = Matter.World,
       Bodies = Matter.Bodies;
       // create a Matter.js engine
       var engine = Engine.create(document.body);
       // create two boxes and a ground
       var boxA = Bodies.rectangle(400, 200, 80, 80);
       var boxB = Bodies.rectangle(450, 50, 80, 80);
       var ground = Bodies.rectangle(400, 610, 810, 60, { isStatic: true });
       // add all of the bodies to the world
       World.add(engine.world, [boxA, boxB, ground]);
       // run the engine
       Engine.run(engine);
    </script>
   </body>
 </html>
```

2. index.htmlと同じフォルダに<a href="https://github.com/liabru/matter-js/blob/master/build/matter.js" target="_blank">matter.js</a>を配置．
3. index.htmlをブラウザで開くと長方形が２つ落下するデモが見れる．