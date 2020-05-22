---
title: "Nox App Player を最適化する"
date: 2020-01-10T20:00:00+09:00
draft: false
slug: "debloat-optimize-nox"
categories: [ "Tech" ]
tags: [ "Nox", "Windows", "Android" ]
---

スマホゲームを大画面やコントローラで遊びたいので、Android エミュレータが重宝している。
Nox は Android エミュレータとして素晴らしい機能を持っている反面、広告やスパムの問題に直面する。
私が Nox を利用する際に行っている最適化(高速化)を紹介する。本変更を行うことでアプリの起動を速めたり、ディスクの肥大化を遅らせることができる。

<!--more-->
___
[免責事項](/page/terms-of-use)に記載の通り、可能な限り正確な情報を掲載するよう努めていますが、誤情報が入り込んだり、情報が陳腐化することもあります。必ずしも正確性を保証するものではありません。また合法性や安全性なども保証しません。
また、掲載された内容によって生じた損害等の一切の責任を負いかねますので、ご了承ください。
___

EDIT: 
MEmu 利用者は、[MEmu Play を最適化する](/post/optimize-memu/) 記事も併せて確認してほしい。

本記事は、Nox 6.5.0 でのみ動作確認をしている。
本記事投稿時の最新バージョン Nox 6.6.0 や過去のバージョンの動作確認はしていない。

Nox を最適化(高速化)するには多少の段階を踏む必要がある。

1. Android(Nox) の Launcher の変更
2. Android(Nox) の hosts ファイルの修正
3. Windows の hosts ファイルの修正 および Windows Firewall の追加
4. Nox の設定ファイルの修正

##### 1. Android(Nox) の Launcher の変更

まず、Nox のデフォルトの Launcher を任意の Launcher の変更する。私は、"Nova Launcher" を採用した。これは各所で紹介されているため、実施済みの場合は後項以降を実施。

* Nox を Root モードで起動させるため、Nox の設定メニューの `Startup items` の項目にある `Root` のチェックボックスを有効後、再起動(もしくは、後述する `conf.ini` ファイルを `root=true` に変更後、再起動)。
* Nox が起動後、Google Play ストアから任意の Launcher をインストールし、デフォルトの Launcher に変更する "Nova Launcher" の場合、"Nova の設定" というアプリから設定が可能。
* Nox にプリインストールされている `ファイルマネージャー` を起動し、`/system/app/Launcher` をフォルダーを開く。`launcher_x.x.x_en_signed.apk` というファイルが存在しているので、長押しして出てくるメニューから削除、またはリネーム(拡張子の変更等)する。
* Nox を再起動。後項 "Android(Nox) の hosts ファイルの修正" を実施した後でも可。

{{% google-adsense %}}
##### 2. Android(Nox) の hosts ファイルの修正

次に、Nox の hosts ファイルの修正を行うことで、Nox が不審なホストとの通信を無効化することができる。

* 前項 "Android(Nox) の Launcher の変更" と同様に Root モードの Nox で、`ファイルマネージャー` を起動し、`/system/etc` フォルダーを開く。`hosts` というファイルが存在しているので、長押しして出てくるメニューから `プロパティ(Properties)` > `権限(Permissions)` を選択し、 `グループ` の `書き込み権限(W)` にチェックを入れる。
* そのまま `hosts` ファイルを開き、下記内容をコピペする。
{{< highlight "linenos=table" >}}
127.0.0.1 api.bignox.com
127.0.0.1 tracking.trnox.com
127.0.0.1 bi.yeshen.com
127.0.0.1 launcher.us.yeshen.com
127.0.0.1 pubstatus.sinaapp.com
127.0.0.1 noxagile.duapp.com
127.0.0.1 common.duapps.com
127.0.0.1 pasta.esfile.duapps.com
127.0.0.1 api.mobula.sdk.duapps.com
127.0.0.1 hmma.baidu.com
127.0.0.1 nrc.tapas.net
127.0.0.1 au.umeng.com
127.0.0.1 www.yeshen.com
127.0.0.1 www.yeshen.com.w.kunlungr.com
127.0.0.1 hm.e.shifen.com
127.0.0.1 tdcv3.talkingdata.net
127.0.0.1 alog.umeng.com
127.0.0.1 sdk.open.inc2.igexin.com
127.0.0.1 androiden.duapp.com
127.0.0.1 attitude.applinzi.com
127.0.0.1 launcher-us.yeshen.com
127.0.0.1 tracking.apptrackerlink.com
127.0.0.1 res.noxmobi.com
127.0.0.1 res09.bignox.com
127.0.0.1 noxagile.bceapp.com
127.0.0.1 bignox.com
127.0.0.1 8.bignox.com
127.0.0.1 id.bignox.com
127.0.0.1 res02.bignox.com
127.0.0.1 res.bignox.com
127.0.0.1 passport-us.bignox.com
127.0.0.1 passport.bignox.com
127.0.0.1 res05.bignox.com
127.0.0.1 bbs.bignox.com
127.0.0.1 ru.bignox.com
127.0.0.1 t.bignox.com
127.0.0.1 cn.bignox.com
127.0.0.1 phone.bignox.com
127.0.0.1 res09.bignox.com
127.0.0.1 de.bignox.com
127.0.0.1 sj.bignox.com
127.0.0.1 st.bignox.com
127.0.0.1 log.bignox.com
127.0.0.1 gift.bignox.com
127.0.0.1 vip.bignox.com
127.0.0.1 unauthorized.bignox.com
127.0.0.1 tw.bignox.com
127.0.0.1 pt.bignox.com
127.0.0.1 www.bignox.com
127.0.0.1 es.bignox.com
127.0.0.1 android.bignox.com
127.0.0.1 app.bignox.com
127.0.0.1 sns.bignox.com
127.0.0.1 tui.bignox.com
127.0.0.1 my.bignox.com
127.0.0.1 fr.bignox.com
127.0.0.1 api.bignox.com
127.0.0.1 wap.bignox.com
127.0.0.1 group.bignox.com
127.0.0.1 ms.bignox.com
127.0.0.1 download.bignox.com
127.0.0.1 mis.bignox.com
127.0.0.1 res12.bignox.com
127.0.0.1 union.bignox.com
127.0.0.1 sdk.bignox.com
127.0.0.1 app.test.bignox.com
127.0.0.1 survey.bignox.com
127.0.0.1 plat-api.bignox.com
127.0.0.1 app.static.bignox.com
127.0.0.1 ph.bignox.com
127.0.0.1 res11.bignox.com
127.0.0.1 gray.bignox.com
127.0.0.1 game.bignox.com
127.0.0.1 user.bignox.com
127.0.0.1 kr.bignox.com
127.0.0.1 tl.bignox.com
127.0.0.1 tv.bignox.com
127.0.0.1 dev.bignox.com
127.0.0.1 news.bignox.com
127.0.0.1 res06.bignox.com
127.0.0.1 api-new.bignox.com
127.0.0.1 info.bignox.com
127.0.0.1 mobile.bignox.com
127.0.0.1 en.bignox.com
127.0.0.1 player.bignox.com
127.0.0.1 feed.bignox.com
127.0.0.1 mail.bignox.com
127.0.0.1 shouyou.bignox.com
127.0.0.1 pop3.bignox.com
127.0.0.1 ios.bignox.com
127.0.0.1 image.bignox.com
127.0.0.1 open.bignox.com
127.0.0.1 pay.bignox.com
127.0.0.1 jp.bignox.com
127.0.0.1 api.noxinfluencer.com
{{< / highlight >}}
* Nox を再起動。

{{% google-adsense %}}
##### 3. Windows の hosts ファイルの修正 および Windows Firewall の追加

続いて、Nox をインストールした Windows 側の hosts ファイルの修正と、Windows Firewall の追加を行う。ただし、新しいバージョンを利用したい場合にダウンロードもできなくなるので、注意が必要。新しいバージョンを利用する場合は、一時的に本項の設定を削除する。
Anroid と同様に hosts ファイルの修正を行うことで、Nox が不審なホストとの通信を無効化することができる。また、念の為 Windows Firewall で Nox 関連の通信を遮断する。なお、Nox のネットワークがブリッジを採用している場合は、本項の効果がない可能性がある。前項の設定が反映されていれば不要。  

* `コマンドプロンプト` を管理者権限で開き、下記内容をコピペする。
{{< highlight cmd >}}
netsh advfirewall firewall add rule name="Nox Block Inbound" dir=in action=block remoteip=220.181.0.0-220.181.255.255,183.128.0.0-183.143.255.255,182.92.0.0-182.92.255.255,101.200.0.0-101.201.255.255,211.151.0.0-211.151.255.255,198.11.128.0-198.11.191.255,124.160.0.0-124.160.255.255,140.205.0.0-140.205.255.255,110.173.192.0-110.173.223.255,121.52.224.0-121.52.255.255,178.162.216.0-178.162.219.255
netsh advfirewall firewall add rule name="Nox Block Outbound" dir=out action=block remoteip=220.181.0.0-220.181.255.255,183.128.0.0-183.143.255.255,182.92.0.0-182.92.255.255,101.200.0.0-101.201.255.255,211.151.0.0-211.151.255.255,198.11.128.0-198.11.191.255,124.160.0.0-124.160.255.255,140.205.0.0-140.205.255.255,110.173.192.0-110.173.223.255,121.52.224.0-121.52.255.255,178.162.216.0-178.162.219.255
{{< / highlight >}}
* `C:\Windows\System32\drivers\etc\hosts` ファイルをメモ帳等のエディタで開く。変更するために管理者権限で開く必要がある。
* 前項 "Android(Nox) の hosts ファイルの修正" と同様の内容をコピペする。

##### 4. Nox の設定ファイルの修正

最後に、Nox の設定ファイルの修正を行う。これにより、Nox の設定ファイルを修正することで広告の削除やポップアップ間隔を変更する。また、Root モードでの起動を無効にする。加えて、設定ファイルを読み取り専用に変更することで、Nox が設定を元に戻すのを防止する。

* `%LOCALAPPDATA%\Nox` フォルダにある `conf.ini` ファイルをメモ帳等のエディタで開く。マルチインスタンス環境(やクローンをしている場合)は、各インスタンス毎に `conf.ini` ファイルが存在する。私の環境では、`clone_Nox_x_conf.ini` という名前になる。
* 下記内容に修正し、保存する。
{{< highlight "linenos=table" >}}
[setting]
...
collect_behavior_enable=false
collect_behavior_interveral=9223372036854775807
...
root=false

[popads]
...
pop_ads_refresh_time=9223372036854775807
{{< / highlight >}}
* 修正した `conf.ini` ファイルの `プロパティ` から `読み取り専用(R)` にチェックを入れる。
* `%LOCALAPPDATA%\Nox` フォルダにある `Nox_log.conf` ファイルをメモ帳等のエディタで開く。マルチインスタンス環境(やクローンをしている場合)は、各インスタンス毎に `Nox_log.conf` ファイルが存在する。私の環境では、`clone_Nox_x_log.conf` という名前になる。
* 下記内容に修正し、保存する。これは、ログレベルを変更することでログの量を減らし、ローテート間隔を日次から月次に変更する。
{{< highlight "linenos=table" >}}
log4j.rootLogger=ERROR, Nox_log
...
                    log4j.appender.Nox_log.DatePattern='.'yyyy-MM
{{< / highlight >}}
* `コマンドプロンプト` を管理者権限で開き、下記内容をコピペする。これは、ローディング画面の広告を削除し、コマンドで当該ディレクトリおよびサブディレクトリを読み取り専用に変更する。”アクセスが拒否されました。”と出力される場合もあるが、当該ディレクトリのプロパティを確認して"読み取り専用"になっていれば問題ない。
{{< highlight cmd >}}
del /q/f %LOCALAPPDATA%\Nox\loading\*
echo Y|Cacls %LOCALAPPDATA%\Nox\loading /T /D SYSTEM
{{< / highlight >}}

{{% google-adsense %}}
___
参考:  
[Debloating Nox](https://gist.github.com/Log1x/12d330ef7685d6fbc611d1d57efb5c29)  
[Configuring Nox App Player to remove adware, spyware and make it faster. (Ver. 5.0.0 - Windows)](https://www.reddit.com/r/soccerspirits/comments/74flks/configuring_nox_app_player_to_remove_adware/)