### $ flutter doctor  
Flutter開発に必要なツール類をチェックし、  
開発の準備が整っているか判定してくれるコマンド


### $ flutter create プロジェクト名  
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