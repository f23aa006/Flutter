>### $ flutter doctor  
Flutter開発に必要なツール類をチェックし、  
開発の準備が整っているか判定してくれるコマンド


>### $ flutter create プロジェクト名  
Flutterプロジェクトを作成するコマンド

---
P50に様々なフォルダやファイルについてのまとめがある

>名前付き引数による実装
``` dart
int a = 5
```
aという名前の引数に5を格納した。これにより、aを打つことで5が呼び出される。

---
>オリジナルのウィジェットを作るときは以下のように作成する
```dart
class クラス名 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ウィジェット;
        }
}
```

title ・・・ 文字列

home ・・・ ウィジェット

>P60~64にステートについてまとめられたものが書かれている

>P68~70に複雑な値の扱いについてまとめられたものが書かれている

___
###　ブラウザ上で簡単にUIが作れる↓

###　[Flutter Studio](https://flutterstudio.app/)

※ページを日本語に翻訳するといくつかの機能が表示されないので翻訳せずに使うこと

>色の指定は16進数で行われている
コマンドけたずつ「A,R,G,B」で指定されているので自身で調整可能
___
#　コード（Ch3）
onPressed : ボタンが押された時の処理
child　: ボタン内に表示するウィジェット

>カスケード記法：式の値を元のオブジェクトにしたまま操作を行う記法。同一のオブジェクトに対して複数の操作を行うことができる

TextField : 自由に文字を入力させたいとき

Checkbox,Switch : 要素に該当するかどうかチェックさせたい時

Radio,Dropdown : 複数の要素から一つだけ選ばせたい時

Slider : 特定の値の範囲で数値を入力させたい時
___
>Null許容　:　値にNULLが代入されるのを許可すること
>>
>非NULL保証　:　値がNULLでないことを保証すること
___
showDialog : 一時的にdialogを表示するメソッド

AlertDialog : アラーム表示をすることのできるdialog

アロー関数　:　無名関数を簡単に書くことができる記法

AppBar : タイトル表示以外にも複数のウィジェットを内包させることができる

BottonNavigation　:　画面下部に表示させるバー。主にアイコンや文字の表示

ListView : 多数の項目を並べるためのウィジェット

Navigator : LIFO式で画面遷移を実現させるための機能

MaterialPageRoute　:　Routeクラスの孫クラス

routes　:　アドレスを事前に決めておくことで、毎回Routeクラスを書かないための設定値