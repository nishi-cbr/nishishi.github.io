Dim objIE		'IE
Dim objPulls	'optionタグ一覧
Dim Pull		'optionタグ

'文字コードはUTF-16 LEで保存　※UTF-8だと文字列の日本語が文字化けする

'IEオブジェクトを指定
Set objIE = CreateObject("InternetExplorer.Application")

'IEを表示させる。Trueで表示
objIE.Visible = True 

'IEでURLを開く
objIE.Navigate2 "https://nishi-cbr.github.io/nishishi.github.io/"

'ページが読み込まれるまで待機
Do While objIE.Busy = True Or objIE.readyState <> 4
     WScript.Sleep 100        
Loop

set objPulls = objIE.document.getElementsByTagName("option")
'optionのValue値で選択するケース
for each Pull in objPulls				'objPullsからoptionタグを１つずつPullへ格納し処理
	if Pull.value = "12345002 GC" then	'optionタグ内のvalue値が 12345002 GC の場合
		objPulls(Pull.index).selected="selected"			'objIE.document.getElementsByTagName("option")(通番)のプルダウンを選択
		msgbox Pull.innerText								'<option>タグに囲まれた文字列を出力
		exit for
	end if
next

set Pull = Nothing

'optionタグに囲まれた値を選択するケース
for each Pull in objPulls								'objPullsからoptionタグを１つずつPullへ格納し処理
	if Pull.innerText = "東京04" then					'<option>タグに囲まれた文字列が 東京04 の場合
		objPulls(Pull.index).selected="selected"
		msgbox Pull.innerText							'<option>タグに囲まれた文字列を出力
		exit for	
	end if
next