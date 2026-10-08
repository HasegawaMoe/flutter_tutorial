# flutter_tutorial

このプロジェクトには、2026年PSP株式会社のFlutterの入門課題の自分の回答をアップロードしています。

## 課題リスト

### ◼︎ 課題 1-1： レイアウトを変える

- 背景の色を変える（例えばピンク）
- 文字（’You have pushed the button this many times:’）のサイズを大きくする
- 画面の上半分の真ん中に文字、下半分の真ん中に数字が表示されるようにする

<img width="200" alt="Screenshot_20260706-120759" src="https://github.com/user-attachments/assets/0d0d902a-dc00-4c9a-be57-b89275bf5ed2" />

<br><br>
### ◼︎ 課題 1-2： レイアウトを変える

- 文字の部分を入力フォームに変更
- 数字の部分を「次へ」ボタンに変更
- 入力フォームに整数を入力して「次へ」ボタンを押すと、違うページに画面遷移して入力した整数が画面中央に表示されるようにする
- 未入力の時は「入力が必須です」というバリデーションを出す
- 整数以外の文字を入力して「次へ」ボタンを押すと、入力エラーのダイアログを出す
<img width="200" alt="image" src="https://github.com/user-attachments/assets/47ea65f8-4619-4a08-a578-0116fd1f4460" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/12c02ba1-c82d-462a-8f97-a76a91c262c0" />




<br><br>
### ◼︎ 課題 2: データ入力画面を作る
- 氏名(入力フォーム)、性別(ラジオボタン)、出身地(CupertinoPicker)の入力欄と「次へ」ボタンを作成する
- それぞれの情報を入力して「次へ」ボタンを押すと、違うページに画面遷移して入力した情報が全て表示されるようにする
- 氏名、性別、出身地が一つでも選択されていないときはボタンを押しても画面遷移されないようにする
<img width="200" alt="Screenshot_20260716-160639" src="https://github.com/user-attachments/assets/279145b6-f319-4aaf-b304-a99a35e6f12c" />
<img width="200" alt="Screenshot_20260729-140009" src="https://github.com/user-attachments/assets/81bf15a7-9f70-46ff-b184-96ceaf8c5d77" />
<img width="200" alt="Screenshot_20260729-140115" src="https://github.com/user-attachments/assets/c3179157-76bd-4255-ab75-ff2c60d2d771" />

<br><br>
### ◼︎ 課題 3: データ入力画面の値保持
- sharedPreferences ライブラリを使って、入力された情報をスマホに保存できるようにする
- アプリを落としてまた開いたときに保存した情報を取り出して、氏名・性別・出身地の入力欄に表示させる
- sharedPreferences に保存した情報を消せるようにする
- sharedPreferencesを使って保存した情報が、どこに保存されているかを確認する(android端末の場合は実態がある)

<img width="200" alt="Screenshot_20260820-101014" src="https://github.com/user-attachments/assets/1a518ba3-1087-4deb-bf5e-97bbdee57eeb" />



<br><br>
### ◼︎ 課題 4: 一覧・詳細表示画面を作る
- 好きなバンドを３つから４つ挙げ、グループ名のリストを一覧表示する
- それぞれのグループ名をタップすると、画面遷移してそのグループの詳細情報が表示される
- 各グループの詳細表示で表示する情報：
  - グループ名
  - グループの写真
  - 結成年
  - メンバー情報：
    - メンバーの名前
    - 年齢
    - 担当楽器やパート
  - バンドグループとメンバーはそれぞれクラスを作成する
  - Enumクラスを使用して、バンドの役割を定義する
  - 役割ごとに表示を変更する（今回は役割ごとにアイコンをつけた）
 
<img width="200" alt="image" src="https://github.com/user-attachments/assets/78fa91ef-1646-43ce-9d93-bd3bd8828360" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/4ff5b4ae-434f-4ed8-8c9d-2f6113d95809" />

  

<br><br>
### ◼︎　課題 5: 住所検索
- 住所検索API(https://zipcloud.ibsnet.co.jp) を利用する
- 入力フォームに郵便番号を入力して「検索」ボタンを押すと、検索結果の住所が表示される（住所が複数ある場合、全て表示する）
- 未入力や桁が足りないときは入力フォームで入力制限を行う
- 住所がなかったり、数字以外の文字が入力されていたりする場合はエラーコードを表示する

<img width="200" alt="image" src="https://github.com/user-attachments/assets/d7fcb8e9-d46d-4772-ab09-01e01e1455d4" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/01a41a4c-c41d-4e25-82f9-0633b5ca25de" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/eb8ced51-8775-4af5-9ba8-6b2553454b98" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/812db122-48b7-4eb6-95a6-3a80edd5fca7" />


<br><br>
### ◼︎　課題 6: JSONデータを使った一覧・詳細表示
- アプリを開いたときにAPI通信(https://jsonplaceholder.typicode.com/users) を行い、JSONデータを取得して一覧表示をする
- タップして詳細画面へ移動する
- リストにソート機能をつける（ソートの方法やメソッドはEnumクラスで管理する）
<img width="200" alt="image" src="https://github.com/user-attachments/assets/6fa45e4e-d762-4dd9-b4d0-ada6ad3230d9" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/a145eee3-3b2c-41da-9bf2-de24e99f6761" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/7e50370e-d225-4876-afe1-fcf299c9becd" />





<br><br>
### ◼︎　課題 7:　2種類の違うデータを同じような画面でそれぞれ表示させる
- 朝食のメインの派閥を定義したEnumを作成する
- 朝食のメイン派閥の Card を表示するホーム画面（HomeScreen）を作成する
- HTTP 通信を行なって、json データを取得し、リストで表示する画面（BaseDetailScreen）を作成する
  - HTTP通信は朝食のメイン派閥ごとに違うURLを使用する(Modelクラスはそれぞれ作成する) 
    - パン: https://jsonplaceholder.typicode.com/posts
    - ご飯: https://jsonplaceholder.typicode.com/comments
    - 麺: https://jsonplaceholder.typicode.com/albums
    - 芋: https://jsonplaceholder.typicode.com/todos
    - 食べない: https://jsonplaceholder.typicode.com/users
- 親クラス（BaseDetailScreen）を継承して子クラス（〇〇 GroupScreen）を作成する
- 選んだメイン派閥の Card ごとにそれぞれの画面（〇〇 GroupScreen）に遷移できるようにする
- 親クラスをオーバーライドし、子クラスのListで表示する内容を変更する
<img width="200" alt="image" src="https://github.com/user-attachments/assets/3a2dc066-8a1d-45c7-9ea7-5d90161c4dd4" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/b1a1022c-53af-4558-876c-bf383be21791" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/698d1277-96eb-472e-9640-a147e1add29f" />

<br><br>

<br>

