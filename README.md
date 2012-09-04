# MATLABをCUIで人道的に使う


非人道的マットラブに立ち向かう。

## 概要


GUIのマットラブは重すぎで頭が死ぬので、CUIで使いたいけど、そうするなら自分の環境でやりたい。しかしながら、`ssh`や`scp`を繰り替えすのも頭がイカレる。

そこで、**OMake** の力で`ssh`下でのマットラブ実行と、その結果（CUI）の保存、さらにはLaTeXファイルの生成とコンパイルを行うようにした。

## 準備


さくっと準備をまとめる。

### LaTeXを引っ張る


がんばる。Macなら[MacTeX](http://www.tug.org/mactex/)で一発。

### Gitを入れる


がんばる。

### Perlを入れる


Perlが入ってないディストリビューションなど知らぬ。

### OMakeを引っ張る


Macの[Homebrew](http://mxcl.github.com/homebrew/)を使ってる人は、

```
brew install omake
```


でインストール出来る。

### このファイルを引っ張る


```
git clone git@github.com:coins11/introduction-to-numerical-analysis.git
```


で一発。

## 使う


### 最初


`hinagata`フォルダをコピーして、適当なフォルダ名にする。その中の`src`フォルダに`1.m`とか`2.m`とか、そんな感じで`N.m`を作って書く。数字がファイル名になっているが、これは後で`tmp.m`というファイル名で`scp`するので問題ない。

### OMakefile


`./OMakefile`を編集する。`hinagata`をコピーして作ったフォルダにも、_OMakefile_ が存在するが、そっちはノータッチで良い。

_OMakefile_ の中身はこうなっているはず。

```
LATEX        = platex
DVIPDFM      = dvipdfmx
DVIPDFMFLAGS = -p a4

remoteDir = ~/tmp/suchi/
coinsPC   = cosmos25.coins.tsukuba.ac.jp

.SUBDIRS: 1
```


_remoteDir_ は`scp`されるフォルダ、COINSの環境に存在するフォルダにしないと死ぬ。

_conisPC_ は`ssh`、`scp`する先のコンピュータを指定、Macにしておくのが無難。

_.SUBDIRS:_ に、さっき`hinagata`をコピーして作ったフォルダを指定する。複数ある場合は半角スペースで区切る。

### 実行


```
omake
```


または、

```
omake -P
```


でいける。

このリポジトリを引っ張ってきた段階で`omake`すると、`1`というフォルダの中にいくつか物が生み出されるはず。

## 問い合せ


プルリクかイシューでお願いします。

