---
title: 'Tutorial - 1D Curvature Flow'
date: 2015-05-29T11:43:47+00:00
categories:
  - DiscreteDifferentialGeometry
---
Caltechで開講されていた"Discrete Differential Geometry"という講義の中で，Homeworkとして提示されていたものだが，curvature flow(曲率フロー）の良いチュートリアルでもあるので全訳する．
  
original URL: [http://brickisland.net/cs177fa12/?p=320](http://brickisland.net/cs177fa12/?p=320)

適宜理解が進むように内容をプラスしながら説明しているので，必ずしも原本通りではない上に，一部理解しきれずに訳している部分がある．また，**Remarks**はすべて，訳者によるものである．

## **Curvature Flow**

今回のホームワークでは，曲率フロー(curvature flow)$$^{*1}$$について詳しく見ていこう．
実はPoisson方程式について学んでいる時に出てきた平均曲率フロー(mean curvature flow)も曲率フローの一種である．
ジオメトリ$$^{*2}$$の滑らかさを図る指標としてエネルギー$$E$$を定義し，各点おいて定義された最急降下方向を指すベクトル場に沿って$$E$$を減らせるというふうに考えることで曲率フローを考察しよう．
$$E$$をある種のポテンシャルであると考えるとイメージが掴みやすいだろう．
すなわち，たくさんのエネルギーを持った”しわしわな”曲面のエネルギーを減少させることにより，より滑らかな曲面を得るというものである．このような考え方は，「エネルギー分布」として捉えるとより鮮明になる．すなわち，エネルギーの高い部分はしわしわな曲面を表し，低い部分は滑らかな曲面を表す．下図は２次元の場合のエネルギー分布の例である．
  
![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_energy_landscape.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_energy_landscape.svg)
  
ジオメトリを滑らかにするためには，より滑らかな形状を発見しながらこのエネルギー分布上で下に向かってスキーのように滑走していけばよい．言うなれば，焼きたてのパンの上に載せたひとかけのバターが溶けていく様子や，水滴が落ちるときに完全な球形になっていくことを想像するとわかりやすいだろう．

数式を使ってより具体的に見ていこう．$$f$$を多様体$$M$$（曲線や曲面）からユークリッド空間へのはめ込み(immersion)$$^{*3}$$であるとしよう．
$$E$$を$$f$$の実数値関数としよう．このとき，曲率フローは以下の偏微分方程式 \\[ \dot{f} = \frac{\partial f}{\partial t} = - \nabla E(f) \\] の解である．
ここで，$$f_0$$を初期解とする．この偏微分方程式は，曲面上のある点が微小時間に動く変位は，その点がエネルギーを最も効率よく小さくしようとした時に動く変位であると解釈できる．

曲面において，最もよく使われるのがDirichletエネルギー$$^{*4}$$ \\[ E_D (f) = \frac{1}{4} \int_M \|\nabla f\|^2 dA \\] とWillmoreエネルギー \\[ E_W (f) = \frac{1}{4} \int_M (\kappa_1 - \kappa_2)^2 dA = \int_M H^2 dA - \int_M K dA \\] である．ここで，$$ \kappa_1, \kappa_2 $$はそれぞれ$$f$$によって定まる主曲率を表す．これら２つのエネルギーはともに曲面のシワシワ度合いを測るものであるのだが，一体これらの間にはどういった関係があるのだろうか．

> Exercise 4.1  
> $$M$$を境界を持たない曲面であるとする．このとき，Willmoreエネルギーは \\[ E_W = \int_M H^2 dA + \mbox{const.} \\] とかけることを示せ．また，この定数は曲率フローを考える際にはあまり意味を持たないことを説明せよ．（ヒント：Gauss-Bonnetの定理によれば，閉曲面のガウス曲率の積分はいくつになっただろうか．また，平坦なエネルギー場に魅力はあるだろうか？）

Willmoreエネルギーの定義は平均曲率の$$L^2$$ノルム（の２乗）を表している一方で，Dirichletエネルギーは勾配の$$L^2$$ノルム（の２乗）を表していると解釈できる．これらの量は見かけ上異なっているように見えるが，実はとても似通った性質を持った量なのだ．

> Exercise 4.2  
> $$M$$を境界を持たない曲面であるとする．このとき，DirichletエネルギーとWillmoreエネルギーはそれぞれ，\\[ E_D = \langle \Delta f, f \rangle + \mbox{const.} \\] \\[ E_W = \langle \Delta^2 f, f\rangle + \mbox{const.} \\] とかけることを示せ．（ヒント：Greenの第一恒等式（Green's first identity)と平均曲率ベクトルの定義を思い出そう．）

これらの表式から，DirichletエネルギーとWillmoreエネルギーはともにとてもよい性質を持った$$f$$の２次式であることがわかるだろう．しかし，ここで注意しなければならないのは，Laplace-Beltrami作用素$$\Delta$$が$$f$$自身の関数であるので，これの勾配フローはむしろうんざりするような非線形式になる．後ほど，この非線形性を対処する方法について見ていこう．

---

### **Remarks**

$$^{*1}$$ フロー: 多様体の言葉では，1径数変換群(1-parameter transformation group)と呼ばれるものである．
少し解説すると，コンパクトな多様体$$M$$においては，任意のベクトル場が完備であるので，$$M$$の任意の点$$p$$を初期値とする積分曲線$$c(t,p)$$が$$t\ \in (-\infty, \infty)$$で定義できる．
このことから，実数$$t$$を一つ固定した写像$$\varphi\_t:M \to M$$を考え，$$M$$の各点$$p$$に対して点$$c(t,p)$$を対応させる写像が群をなす（例えば，$$\varphi_{t+s} = \varphi_t \circ \varphi_s$$）とき， $$\{\varphi_t\}_{t \in \mathbb{R}}$$を$$M$$の1径数変換群（フロー）という．
このように，多様体$$M$$上の完備なベクトル場と1径数変換群が一対一に対応しており，ベクトル場が「流れ」のような速度ベクトル場の場合には，$$\{\varphi_t\}_{t\in \mathbb{R}}$$は「流れそのもの」を表すものであると解釈できる（松本，多様体の基礎，pp247に詳しい）．
より簡単な解釈としては，形状を表現する写像$$f$$に時間の変数を付加して時変なものとした$$f(t)$$として考えても良いだろう．

$$^{*2}$$ ジオメトリ: 幾何学的に解析・操作する対象のこと．

$$^{*3}$$ はめ込み: $$C^{\infty}$$-級関数$$f:M \to N$$が，任意の点$$p \in M$$において$$f$$の微分 $$f_{*}: T_p M \to T_{f(p)} N$$ が単射であるとき，$$f$$をはめ込み(immersion)という（森田，微分形式の幾何学）．
埋め込み(embedding)ではなく，はめ込みとしたのはおそらく，曲線自身が交わることを許容することを強調しているのではないかと思う．

$$^{*4}$$: Dirichletエネルギーの表式の中で，通常スカラー値関数に対して定義される勾配がベクトル値関数に対して作用しているので戸惑ったかもしれないが，これはJacobianに他ならないことに気がつけば大丈夫だろう．
あるいは写像の微分として理解してもよい．
( [http://math.stackexchange.com/questions/222720/gradient-of-a-vector-valued-function](http://math.stackexchange.com/questions/222720/gradient-of-a-vector-valued-function) )


---

今２つのエネルギーを定義したが，一体どうやってこの勾配フローを求めるのだろうか？関数$$\phi : \mathbb{R}^n \to \mathbb{R}$$に対する勾配を思い出してみると，

$$
\begin{align*} 
\nabla \phi = \left( 
\begin{array}{c} 
\partial \phi / \partial x^1 \\
\vdots \\
\partial \phi / \partial x^n
\end{array}
\right)
\end{align*}
$$ 

であった．
$$\mathbb{R}^n$$のような素直な有限次元ベクトルに対して定義された関数の勾配であればこのような定義で十分なのであるが，Willmoreエネルギーのような無限次元の関数空間に対して作用する勾配は一体どのように定義すればよいのだろうか．
一般的に，関数$$\phi$$の点$$x$$における勾配$$\nabla \phi(x)$$は\\[ \langle \nabla \phi (x), u \rangle = \lim_{h\to 0} \frac{\phi(x+hu) - \phi(x)}{h} \mbox{ ,for all } u \\] として唯一に定義できる$$^*1$$．
ただし，$$\langle \cdot , \cdot \rangle$$はベクトル空間上の内積とする．
言い換えると，勾配との内積をとれば，任意の方向の方向微分を計算できるということである．ここで注目すべきことは，この定義は「微分可能性」の定義としても使えるということである．
すなわち，「ある関数が点$$x$$において微分可能であるための必要十分条件は，任意の方向微分があるベクトル$$\nabla \phi (x)$$によって特徴付けられる」ということである．
幾何的に言うと，微分可能性とは，関数に対して十分に近い距離から観察すると平坦な形状と全く区別がつかないということである．

> Exercise 4.3 
> 勾配は最急降下方向であることを示せ．

> Exercise 4.4  
> 関数$$\phi: \mathbb{R}^2 \to \mathbb{R}; (x_1, x_2) \mapsto x_1^2 - x_2^2$$に対して上述の定義によって導いた勾配が通常の偏微分による勾配と同じものになることを示せ．

> Exercise 4.5  
> $$M$$を境界を持たない曲面であるとする．Laplace-Beltrami作用素は$$f$$に関して一定であることを仮定すると，上述の$$\nabla$$の定義を用いて以下の式が成り立つことを示せ．\\[ \nabla E_D(f) \approx HN \\] Dirichletエネルギーの勾配フローは，前回の宿題で考察した平均曲率フロー$$\dot{f} = - HN$$と似ていることがわかるだろう．

この近似勾配$$HN$$は，真の勾配に対しての線形化(linearization)と呼ばれる．
一般的なテクニックとして，式の中の一部の値を固定して残りが線形性を持つようにすることができる．
これは実応用上非常に重要であるものだが，この近似が最終的な結果にどのように影響するのかを理解することもまた重要である．

最後に，一つ心に留めておかなければならないことは，勾配の定義の左辺に登場する内積$$\langle \cdot, \cdot \rangle$$の取り方によって異なる場合があるということである．
なぜ内積が重要なのだろうか？直感的には，勾配はエネルギーが最も早く大きくなる方向を選べばいいように思える．しかし，ここでいう「最も早く」というのがクセモノなのである．離散曲線の頂点を表現するのに実ベクトル$$\mathbf{x} \in \mathbb{R}^m$$を用いたとすると，我々は曲線の長さに応じて増加する曲線のエネルギーについて関心があるのであって，$$\mathbf{x}$$自身のユークリッド距離に応じて増加するエネルギーについてではないのだ．先ほど考えたエネルギー分布を用いて考えてみよう．左図の矢印はユークリッド空間に自然に入る計量を用いた時のnormが1のベクトルを表す一方で，右図の矢印は離散曲線上の$L^2$ノルムを用いた時のnormが1のベクトルを表す．これらの図からわかるように，勾配に沿った降下は異なる２つの軌跡を取りうるということを示している．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_gradient_metric.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_gradient_metric.svg)

> Exercise 4.6  
> 正定値行列 $$B\in \mathbb{R}^{n\times n}$$ によって定義される $$\mathbb{R}^n$$ 上の内積 $$\langle \mathbf{u},\mathbf{v} \rangle = \mathbf{u}^T B \mathbf{v}$$ を考えよう．
このとき，この内積によって定まる勾配 $$\nabla_B$$ は通常の勾配 $$\nabla$$ と以下の関係式で表されることを示せ．\\[ \nabla_B = B^{-1} T \\]

この行列$$B$$は，各自由度がどの程度全体に影響するかを表す「質量」を意味することから，離散幾何においてしばしば質量行列(mass matrix)と呼ばれる．
離散微分形式(discrete differential form)を用いて定式化している場合は，（適切な定数倍をした）対角Hodgeスター(diagonal Hodge star)をしばしば採用する．
これは，区分定数内挿と通常の$$L^2$$内積を用いることを意味する．区分定数内挿とはどういうことかということを，三角メッシュ面に対するprimal 1-formを例にとって説明すると，各辺に保存された積分値(discrete 1-formと呼ぶのであった）を，その辺に対応するダイヤモンド領域（下図）に割り当てられる値とするということである．
  
![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_piecewise_constant_interpolation.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_piecewise_constant_interpolation.svg)

離散微分幾何において$$*_k$$は，
$$k$$ 次元の単体$$\sigma_i$$それぞれに対して一つの要素を割り当てる実対角行列を表す．
$$ *_k $$ の対角要素は，
  $${({*}_k)}_{ii} = \vert \sigma_i^* \vert / \vert \sigma_i \vert$$ 
である．

ここで$$\sigma_i^*$$は$$\sigma$$の（外心を用いた）双対を表し，$$\vert \cdot \vert$$は体積を表す．
このとき，n次元のprimal discrete k-formに対応する質量行列は，

$$ 
\begin{align*} 
B_k = \left( 
\begin{array}{c} 
n \\ 
k 
\end{array} 
\right) *_k 
\end{align*}
$$ 

となる．また，n次元のdual discrete k-formに対応する質量行列も同様に
  
$$
\begin{align*} 
B_k^* = \left( 
\begin{array}{c} 
n \\ 
k 
\end{array} 
\right) *_{n-k}^{-1} 
\end{align*}
$$ 

となる．
これらの行列は離散曲率フローの方程式を導出する際に役に立つだろう．

---

### **Remarks**

$$^{*1}$$: 無限次元ベクトルに関する微分法の厳密な取り扱いは，関数解析学に属するものである．$$\phi$$は関数というよりも汎関数(functional)と呼ぶべきものであり，ここで与えられている微分の定義も汎関数微分と呼ばれるものである．また，$$u$$のかわりにノルム1の試験関数$$f$$を用いるのが一般的である．ちなみに，勾配フローはBanach空間であるので，この種の微分はFréchet微分と呼ばれる．


## **Flow on Curves**

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_curve_energy.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_curve_energy.svg)
  
ここからは，曲面ではなく平面内の曲線に限定することにしよう．前述したように，曲線のジオメトリははめ込み写像
\\[ \gamma: I=[0,L]\in \mathbb{R} \to \mathbb{R}^2; s \mapsto \gamma(s) \\]
を用いて表せる．
曲線のエネルギーは単純に曲率$$\kappa$$の積分$$E(\gamma) = \int_0^L \kappa^2 ds$$を用いるのが一般的である．
まずは（よくやるように）滑らかな曲線で曲率に対して成り立ついくつかの事実を見ていこう．

> Exercise 4.7  
> 滑らかな曲線$$\gamma$$の接ベクトル場は，$$I$$上の関数$$\theta:I \to \mathbb{R}$$を用いて$$T=(\cos \theta, \sin \theta)$$と表せる．
> この時，法線曲率は，$$X$$を反時計回りを正にとった単位ベクトル場としたとき，\\[ \kappa = d\theta(X) \\] で表される$$^{*1}$$．
> これは，スカラ曲率$$^{*2}$$が接線方向に変化するということを意味している．

 > Exercise 4.8  
 > 閉曲線$$\gamma$$（smooth or discrete)の全曲率(total curvature)は常に$$2\pi$$の整数倍となることを説明せよ．
 > \\[ \int_0^L \kappa ds = 2\pi k, k\in \mathbb{Z}\\]（$$k$$はこの曲線の回転数と呼ばれる量である．）

より強い結果として，曲線の回転数は正則ホモトピー(regular homotopy)$$^{*3}$$な変形を施しても不変であるというWhitney-Grausteinの定理と呼ばれるものがある．
下図に示すものは**正則ではない**変形を施したものである．この図において，変形の途中に曲線の空白領域が潰れてしまっていることにより回転数が2から1に減少していることに着目して欲しい．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_irregular_homotopy.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_irregular_homotopy.svg)

これらの考え方をもとに，曲率フローのアルゴリズムを設計していくことにしよう．

--- 

### **Remarks**

$$^{*1}$$: 接ベクトルのかわりに曲線の法線ベクトルを対応させるものとしてGaussの表示(Gauss map)がある．[小林昭七，曲線と曲面の微分幾何,p7]に詳しい．

$$^{*2}$$: スカラ曲率とは，Riemann多様体の最も基本的な曲率不変量である．高々2次元Riemann多様体においては，他の曲率を完全に特徴づける量であることが知られており，この値が0ならば平坦に近く，大きければ強い曲がり方を持っていると解釈することができる．また，2次元においてはGauss曲率のちょうど２倍になることも知られている．

$$^{*3}$$ 正則ホモトピー：曲線を他の曲線に滑らかに正則性を保ちながら変形できるとき２つの曲線の間のはめ込みは正則ホモトピー(regular homotopy)であるという．正則とは，はめ込み写像の微分の大きさが常に0にならないことをいう．


## **Discrete Curves**

さて，話を離散の世界に持って行こう．$$\gamma_1, \gamma_2, \ldots, \gamma_n \in \mathbb{R}^2$$を頂点として持つような線分の集合として離散曲線$$\gamma$$を定義しよう．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_discrete_curve.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_discrete_curve.svg)

配布したコードでは，曲線は1つのポリゴンを持つハーフエッジメッシュとして表現しているため，曲線上で繰り返し処理を行う際には下記のようにすればよいだろう．

```cpp
FaceIter gamma = mesh.faces.begin();
HalfEdgeIter he = gamma->he;
do {
   // do something interesting here!
   he = he->next;
}
while( he != gamma->he );
``` 

曲面の場合と同様に，曲線におけるprimal, dual「メッシュ」を考えることができる．ここでは，primalにおける頂点に対して，その頂点と隣接する辺の中点を結んだ辺上領域をdualとして割り当て，また，primalにおける辺に対して，その中点の頂点をdual割り当てよう．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_simplicial_dual_1d.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_simplicial_dual_1d.svg)

Discrete exterior calculusの言葉を借りれば，$$\gamma \in (\mathbb{R}^2)^n$$は$$\mathbb{R}^2$$を吐き出すようなprimal 0-formである．
（すなわち，各頂点に対して$$\mathbb{R}^2$$を割り当てるようなものである．）

> Exercise 4.9  
> primal 0-formの対角Hodgeスターの非ゼロ要素は，$$L_i = \frac{1}{2}(\vert\gamma_{i+1} - \gamma_i \vert + \vert \gamma_i - \gamma_{i-1} \vert)$$ を用いて， $$ (*_0)_{ii} = L_{ii} $$ となることを示せ．

> Coding 4.1  
> primal辺の長さを返すメソッド`Edge::length()`と外心dual辺の長さを返すメソッド`Vertex::dualLength()`をそれぞれ実装せよ．（後者は，前者を呼び出すだけなので一行で済むはず！）
> 続いてprimal 0-formの対角Hodgeスターを構成するメソッド`IsometricWillmoreFlow1D::buildMassMatrix()`を実装せよ．

> Exercise 4.10  
> 離散曲線において，dual辺 $$e_{ij}^*$$ に沿った全曲率は対応する頂点における外角$$\varphi_{ij} \in \mathbb{R}$$，すなわち連続する線分のなす角度と等しいことを示せ．（Stoke's theorem!）
> \\[ \varphi_{ij} = \theta_j - \theta_i = \int_{e_{ij}^*} \kappa ds \\]

この事実は，外角 $$\phi$$ は「積分された」曲率を表わすことに他ならない．外角に離散Hodgeスターを適用することによって，各点ごとの曲率 $$\kappa$$ が得られる．\\[ \kappa = *\varphi\\] この値は数値的に曲率フローを構成する際に自由度として用いることができることを追って確認しよう．

> Coding 4.2  
> 上記で適宜した各点ごとの曲率$$\kappa$$を返すメソッド`Vertex::curvature()`を実装せよ．（$$\varphi$$はDECの言葉で表すと何に相当するだろうか．また，$$\kappa$$は？）

次の問題は，いままで定義してきたがどのように役立つかといったことや，作用素がどの空間からどの空間へ連れて行ってくれるのかを理解する良い練習となるだろう．

> Exercise 4.11  
> 曲率に対して区分定数内挿を施した時，離散曲線に対して，$$E(\gamma)$$は\\[ E(\gamma) = \sum_{i} \varphi_i^2 / L_{i} \\]と表せることを示せ．

これにより，離散曲率エネルギーがどのように表されるかがわかった．次に勾配を表わす公式を導出しよう．

> Exercise 4.12  
> $$\varphi$$を$$u,v \in \mathbb{R}^2$$のなす角とする．$$u$$に関する$$\varphi$$の勾配は\\[ \nabla_u \varphi = - \frac{v_{\perp u}}{2A}\\] と表される事を示せ．
> ただし，$$v_{\perp u}$$は$$u$$に直交する$$v$$の成分を表し，$$A$$を$$u$$と$$v$$のなす三角形の面積であるとする．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_angle_gradient.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_angle_gradient.svg)

> Exercise 4.13  
> $$a,b$$を$$\mathbb{R}^2$$の点とする．
> $$L$$をベクトル$$u=b-a$$の長さとするとき，\\[ \nabla_a L = - \hat{u} \\] と \\[ \nabla_b L = \hat{u} \\]が成り立つことを示せ．

![ddg_length_gradient](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_length_gradient.svg){: .center-image }

> Exercise 4.14  
> これまでの練習問題の結果を用いて，曲率エネルギーの$i$番目の項\\[ E_i = \varphi_i^2 \\] の頂点$$\gamma_{i-1}, \gamma_i, \gamma_{i+1}$$に関する勾配は以下のように書けることを示せ．  
> $$
> \begin{align*}
>   \nabla_{\gamma_{i-1}} E_i &= \frac{\varphi_i}{L_i L_{i-1}} \left( \frac{v_{\perp u}}{A_i} + \frac{\varphi_i}{2L_i} \hat{u} \right) \\
>   \nabla_{\gamma_{i+1}} E_i &= \frac{\varphi_i}{L_i^2} \left( \frac{u_{\perp v}-v_{\perp u}}{A_i} + \frac{\varphi_i}{2L_i} (\hat{v}-\hat{u}) \right) \\
>   \nabla_{\gamma_i} E_i &= -\frac{\varphi_i}{L_i L_{i+1}} \left( \frac{u_{\perp v}}{A_i} + \frac{\varphi_i}{2L_i} \hat{v} \right)
> \end{align*}
> $$ 

![ddg_exterior_angle_gradient](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_exterior_angle_gradient.svg)

> ただし，$$\varphi_i$$は頂点$$i$$における外角，$$L_i$$をdual辺の長さ，$$A_i$$を辺$$u=\gamma_i - \gamma_{i-1}$$と辺$$v=\gamma_{i+1} - \gamma_i$$がなす三角形の面積とする．
> （実はこれら以外の$$\gamma_j$$に関する$$E_i$$の勾配は全てゼロになるのだが，なぜだろう？勾配は計量によって変わりうることを思い出そう！）

> Coding 4.3  
> 上の公式を用いて`WillmoreFlow1D::computeGradient()`を実装しよう．与えられた頂点に関するエネルギーの勾配は`Vertex::energyGradient`に格納しよう．
> 離散曲線全体のエネルギーは各項$$E_i$$の和，すなわち各頂点における勾配が及ぼす影響を足しあわせる必要があることに注意しよう．

> Coding 4.4  
> フロー方程式\\[ \dot{\gamma} = - \nabla E(\gamma) \\] を積分するメソッド`WillmoreFlow1D::integrate()`を前進オイラー法(forward(explicit) Eular scheme)によって実装せよ．
（時間に関する積分については前回の宿題の末尾を参照のこと）配布したメッシュデータに対してプログラムを実行し，それぞれのケースについて安定的に積分できる（曲線の平滑化に成功する）最大の時間ステップを報告せよ．（時間ステップは,'-', '=', '\_', '+'キーを使うと変更できる．）

## **Curvature Flow in Curvature Space**

そろそろ宿題にうんざりしてきた頃だろうか．でも君は一人じゃない！微分を手で計算するのはキングオブ面倒くさいことだ．（Newton法なんかを使おうと思ったら２階まで微分を計算しなくちゃならない！）でも人生で一度はこの類の計算を行うことは大事だ．そうすることで今自分が何をやっているかをよく理解できるようになるだろう．実際の現場では，手で計算する代わりに，数値微分(numerical differentiation)や自動化微分(automatic differentiation)，シンボリック微分(symbolic differentiation)などの方法を使える．これらはぞれぞれ，正確性や効率性，コードの複雑さといったようなトレードオフがあるのでケースバイケースで使い分けることが大事だ．
  
コンピュータに微分を計算させるという沼に足を突っ込む前に，検討すべき４つ目の選択肢がある事を覚えておいてほしい．
問題のフォーミュレーション自体を簡単なものにしてしまえばいいんだ．
例えば，凸２次問題なんかに落としこむことに成功すれば，あまりの楽さにドキドキしてしまうかもしれない．
「凸２次」とは，エネルギーを実数値をとる同次２次多項式\\[ E(x) = \langle Ax, x \rangle \\] で表せるようなものだ．
ここで$$A$$は，変数$$x$$に依存しない正定値エルミート線形作用素である．
離散幾何では，系の自由度$$x$$は$$\mathbb{R}^2$$のベクトルとして記述することが出来る．
この時，２次エネルギーは，$$A\in \mathbb{R}^{n\times n}$$をある対称半正定値行列として，\\[ E(x) = x^T A x \\] と書ける．
以前，２次元の場合に正定値性によってエネルギーのグラフがどのように変わるかを確認した．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_definiteness.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_definiteness.svg)

正定値性に依らず，２次形式で表されるエネルギーの勾配は，内積によって定まる行列$$B\in \mathbb{R}^{n\times n}$$を用いて以下のように線形式で書ける．
\\[ \nabla E(x) = 2 B^{-1}Ax \\] このように問題を設計することは微分を簡単にするだけではなく，数値計算を行う上でも非常に有利である．というのも，厄介な非線形解を求めるアルゴリズムを走らせるかわりに，連立線形方程式を解くだけの後進オイラー法(backward Euler method)を使うことが出来るのだ．もっというと，$$A$$は不変であるので，予め前処理を一度施して後退代入(backsubstitution)することが可能になり計算時間を大幅に削減することが出来る．また，凸２次問題は解析的にも良い性質を持っている．凸なエネルギーの局所最適解はまた，大域的最適解になることが保証されている．これは最急降下法を用いることにより最適解が得られるということを意味している．また，線形な偏微分方程式に関する理論はよく整備されており，解の安定性に関する議論が容易になることもメリットの一つである．（非線形偏微分方程式に関する理論は [まるで動物園みたいなもの](http://mathoverflow.net/questions/15292/why-cant-there-be-a-general-theory-of-nonlinear-pde) だ！）

OK，小難しい話はここまでだ．曲率フローに限定して２次問題がもたらす恩恵について見ていこう．
思い出して欲しい．曲率エネルギーは２次エネルギーだったはずだ．
\\[ E(\kappa) = \int\_0^L \kappa^2 ds \\] いままで考察してきたエネルギーとこのフォーミュレーションによるエネルギーとの唯一の違いは，エネルギーがはめ込み写像$$f$$の関数ではなく，曲率$$\kappa$$の関数として表されていることだ．
この$$f$$のかわりに$$\kappa$$を用いるという工夫により面倒な非線形性を回避することが出来るのだ．離散曲率を例にとって具体的に言うと，頂点の座標$$\gamma_i \in \mathbb{R}^2$$の非線形関数として表される曲率のエネルギーを考えるのではなく，各頂点における曲率を直接保存し操作すればよいのだ．

> Coding 4.5  
> （各点ごとの）曲率を計算し，`Vertex::kappa`というメンバに格納するメソッド`IsometricWillmoreFlow1D::getCurvature()`を実装せよ．（`Vertex::curvature()`を呼び出せばよい．）

この問題設定によってもたらされる一つの結論は，勾配が極めて簡単に表現されるということだ．
実際，0-form上$$L^2$$内積の勾配は\\[ \nabla E(\kappa) = -2\kappa \\]と書ける．よって，勾配フローは空間微分を含まない単純な微分方程式に帰着する．
\\[ \dot{\kappa} = -2\kappa \\]

> Coding 4.6  
> 上記の微分方程式を前進オイラー法によって積分するメソッド
> `IsometricWillmoreFlow1D::computeFlowDirection()`と
> `IsometricWillmoreFlow1D::integrate()`を実装せよ．
> 簡単に書けるはず！

曲率しか持たない状況でも簡単に曲線を再構成することが出来る．まずは滑らかな曲線で考えよう．
曲率を積分することにより，接ベクトルがわかる．これをさらに積分することで曲線上の位置が計算できる．
つまり，曲線の始点における接線の傾きを$$\theta_0$$とすると，任意の位置における接線の傾きの角$$\theta$$は，\\[ \theta(s) = \theta_0 + \int_0^s d\theta = \theta_0 + \int_0^s \kappa ds \\] と表される．
接ベクトル自体は$$T(s) = (\cos \theta(s), \sin \theta(s))$$と表される事に注意しよう．
あとはこれを積分することにより，はめ込み写像$$f$$自身を再構成することができる．
\\[ f(s) = f_0 + \int_I T(s) ds \\] ここで，$$f_0$$は曲線の始点の位置を表わしている．
この話を離散曲線に持っていこう．この２つのステップはとてもシンプルに書き直す事ができる．まず，始点における外角の方向$$\varphi_0$$に辺長だけ伸ばした点を次の頂点とし，次はその頂点における外角の方向$$\varphi_1$$に対して辺長だけ同じように伸ばす操作を繰り返せばよいのだ．（下図を見るとより具体的なイメージが分かるだろう）

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_curve_reconstruction.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_curve_reconstruction.svg)

式で表すと，\\[ \theta_i = \sum_{k=0}^{i} \varphi_k \\] とし，\\[ T_i = L_i (\cos \theta_i, \sin \theta_i)\\]（$$L_i$$は$$i$$番目のprimal辺の長さ）とした時，曲線上の頂点の位置は\\[ \gamma_i = \sum_{k=0}^i T_k \\] となる．連続曲線の場合とよく似ていることが分かるだろう．
（これらの和を区分積分として解釈できることが分かるだろうか．$$(\cos \varphi_i, \sin \varphi_i)$$はどういう量だろう．$$T_i$$は？これら２つの量はどういう関係にある？）

> Coding 4.7  
> $$T_i$$と$$\gamma_i$$をそれぞれ計算するメソッド`IsometricWillmoreFlow1D::recoverTangents()`, `IsometricWillmoreFlow1D::recoverPositions()`を実装せよ．
> ただし！計算量が$$O(n^2)$$となるアルゴリズムを実装した場合は0点とする！
> 各頂点においていちいち全体の和を計算し直すということはしてはならない．もっといい方法があるはずだ．

各辺の長さは構成時の値を使い回せばよい．あとはその辺の長さを使って曲線を再構成していけば良いのだ．数学的に言えば，曲率フローはisometricであるといえる．（滑らかな曲線の場合は，isometricという性質は$$(\cos \alpha, \sin \alpha)$$が常に単位ベクトルになるという事実を反映している．）

ここまで見てきた離散曲率フローの性質はどれも素敵なものばかりだ．
<!-- we simply subtract some fraction of the curvature each vertex, and compute a couple cumulative sums. 多分さっきみた２ステップのことを言っているのだと思うが，"subtract some fraction of the curvature at each vertexの部分がよくわからないので保留とした． -->
ではなぜ，みんなこのようにやらないのだろうか．「うますぎる話にはトゲがある」ということだ．

閉曲線を例にとって説明しよう．閉曲線上の曲率$$\kappa$$を全く任意に変化させてみよう．
この時，閉曲線は閉曲線のまま存在するだろうか．答えはもちろんノーだ．つまり，始点と終点の位置は異なる場所に存在するだろう．

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_loop_closure.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_loop_closure.svg)

新しく定めた曲率を積分して得た接ベクトルは「可積分(integrable)」ではないといえよう．
これらは積分したところで閉曲線にはならないからだ．同様に，曲率自体も可積分ではない．
曲率を積分した関数$$\alpha$$は，，閉曲線の接ベクトルの方向を表さないからだ．
ここで全曲率の定義を思い出そう．任意の閉曲線$$\gamma$$の曲率$$\kappa$$は回転数を$$k\in \mathbb{Z}$$として，\\[ \int_0^L \kappa ds = 2\pi k \\] という関係式があった．
また別の言い方として，始点における接ベクトル$$T(0)$$と終点における接ベクトル$$T(L)$$が一致するともいえる．
$$\kappa$$を任意に変化させてもこの条件が満たされるとは限らないのだ．

> Exercise 4.15  
> 時刻0において，上述の全曲率に関する条件を満たす閉曲線$$\gamma$$の曲率関数を$$\kappa$$とする．曲率の時間変化$$\dot{\kappa}$$が定数関数$$1: [0,L] \to \mathbb{R}; s \mapsto 1$$に対して$$L^2$$内積に関して直交すれば，この条件が満たされることを示せ．

また，終点が始点と一致する（$$\gamma(0) = \gamma(L)$$）条件を導いておこう．
ここで導出は行わないが，この条件は以下の様に簡単に書き下せることがわかる．
\\[ \int_0^L \kappa \gamma = 0 \\]
つまり，$$\dot{\kappa}$$は，はめ込み写像$$f$$の$$x-, y-$$両座標関数に関して$$L^2$$直交しなければならない．
要するに，曲率の変化分が曲線の方向によって張られる2次元の線形部分空間への射影が0にならなければいけないということだ．
\\[ \langle \dot{\kappa_1}, 1 \rangle = \langle \dot{\kappa}, \gamma_x \rangle = \langle \dot{\kappa}, \gamma_y \rangle = 0 \\] 
凸２次エネルギーの時と同様に，線形な拘束条件は非常に扱いやすい．今考えている曲率フローの場合においても，$$\dot{\kappa}$$の成分のなかで「禁止された」空間にいるものを排除してやればよいのだ．
すなわち，この空間が直交基底$$\{ \hat{c}_i \}$$によって張られたものであるとすると，以下の式$$^{*1}$$で表される曲率$$\dot{\kappa}_c$$を用いればよいのだ．
\\[ \dot{\kappa}_c = \dot{\kappa} - \sum_1^3 \langle \dot{\kappa}, \hat{c}_i \rangle \hat{c}_i \\] 

![http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_constraint_projection.svg](http://brickisland.net/cs177fa12/wp-content/uploads/2012/12/ddg_constraint_projection.svg)

> Coding 4.8  
> 3つの拘束方向$$1, \gamma_x, \gamma_y$$を縦ベクトルとして構成するようなメソッド`IsometricWillmoreFlow1D::buildConstraints()`を実装せよ．

> Coding 4.9  
> 上記の3つの拘束方向と同じ空間を張る直交基底$$\{ \hat{c}_1, \hat{c}_2, \hat{c}_3 \}$$を構成するメソッド`IsometricWillmoreFlow1D::orthogonalizeConstraints()`を実装せよ．（Gauss-Schmidtによる直交化を使えば良い．ただし，正しい内積を使うことを忘れずに！）

> Coding 4.10  
> 直交基底を用いてフローから禁止された方向を取り除き，上記のプロセスを実行するメソッド`IsometricWillmoreFlow::enforceConstraints()`を実装せよ．
> ここまでくればisometric Willmore flowを試してみることが出来るはずだ．（右クリックからコンテキストメニューで選択するか，'i'キーを押すことでGUIで確認することが出来る．）
> 配布したメッシュにおいてそれぞれで許容される最大の時間ステップはいくつになるだろうか．各入力曲線について回転数を保存するようなフローになっているだろうか．つまり，離散曲線においてもWhitney-Grausteinの定理が成立していることが書くに出来るだろうか．
> `IsometricWillmoreFlow::enforceConstraints`をいじって，拘束がある場合とない場合とでフローを実行して違いを確認してみて欲しい．全ての拘束を取り外した時には何が起きるだろうか．これらの拘束は，閉曲線を保つために全て必要だろうか．あるいは取り除いても良い物があるだろうか．

この新しいフローは確かに曲線を平滑化するが，`WillmoreFlow1D`において実装したものとはまるで違うことに気がつくだろう．この違いは一体なんだろう．どちらの場合でも，同じエネルギーに対して最急降下法したはずだ．ここで以前考察したことを思い出してみよう―そうだ．確かに同じエネルギーを使っているが，勾配を定義する際に用いた計量が違うのだ！（勘の良い人は，どうやって２つ目のフローをいじれば１つ目のフローと同じようにみせることができるかも気がついたかもしれない．）更にいうなれば，離散ラプラシアンやPoisson方程式を含むアルゴリズムの性能を向上させる方法が沢山ある．どういうことだかわかるかい？
  
さあもう十分君は仕事をした！また来年あおう！

---

更新履歴：2015/5/31 第1稿公開
更新履歴：2018/3/17 第2稿公開（kramdownに書き換え）
