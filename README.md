# SRAMImportExporter_forMSX

MSX用ROM版「HYDLIDE2」を入手しプレーをするも、このソフトのプレーデータの保存は内蔵のSRAMのみとなっています。  
製品自体が古く、いつ電池が切れて思い出のプレーデータが消えてもおかしくないため、そうなる前にセーブデータを外に出せないかと思い、このプログラムを作成しました。  
  
やっていることは、そんなに難しくなく、メガロム中のSRAMのあるバンクに切り替えて、BASICから読み出しBSAVE、もしくは書き込んでいるだけです。  

仕様前に...  
最低限のCUIは実装していますが、ファイル上書きなど警告なく行います。  
また、SRAMやのSRAM上のデータを壊す可能性もあります。  
くれぐれも、ご注意の上、自己責任でご利用ください。  
当方は、もしものことがあっても責任は持てませんのでご了承ください。  
  
RUNすると、インポートかエクスポートかを聞きますので画面に従って、I（インポート）かE（エクスポート）を選んでください。  
  
エクスポートしたデータは、WebMSX（他のエミュレーターでのSRAMデータは検証していません）で利用することができます。  
ただし、BSAVE形式のファイルになっているので、WebMSXで使う前にBSAVEのヘッダーの7バイトをバイナリエディタ等で削除する必要があります。  
  
またWebMSXで遊んで保存したSRAMデータにはヘッダー等は何もありませんので、インポートする際には以下のBSAVEのヘッダーを先頭に書き足す必要があります。  
FE 00 D0 FF D7 00 D0  
（一時保存用のRAMエリアはD000H～D7FFHを使っています）  
  
本プログラムで、使用するSRAMデータの拡張子は「.srm」となっています。  
  
当方の動作環境は、1ChipMSX(OCM-PLD ver.3.9)で使用しています。  
最後に、  
BASIC中でバンク切り替えを行っていますが、ゲームのメガROMフォーマットに合わせて、切り替えを書き換え、書き出すサイズを変えたら他のゲームでも流用できるかもしれません。  

