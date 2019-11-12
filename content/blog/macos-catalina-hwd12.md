---
title: "MacOS Catalina 10.15 で au HWD12 を使う方法"
date: 2019-11-12T21:12:48+09:00
draft: false
slug: "macos-catalina-hwd12"
---

MacOS Catalina から 32bit アプリケーションが利用できなくなった。
au HWD12 のアプリケーションが 32bit のため、インストールおよび起動ができない。
au 側が対応してくれれば良いのだが、2019/11/12 現在まだ未対応の様子なので、何とかできないか試行錯誤を行った。

まずは、au HWD12 の元になっている Huawei E3276 の Catalina 用の 64bit アプリケーションをダウンロードする。  
[Hilink products tool, support MAC 10.15](https://consumer-tkb.huawei.com/tkbapp/downloadWebsiteService?websiteId=1697201)  
この HiLink.app をインストールすることで、ドライバー(kext)を導入するのだが、少なくとも私の環境では HWD12 は動かなかった。
dat ファイルを下記のように書き換える必要があった。  
`HiLink.app/Contents/Resources/mbbserviceSetup.pkg/Contents/Resources/ArConfig.dat`

<pre><code class="html">
[INSTALL]
service_name=USB STICK LTE setting tool
service_desc=USB STICK LTE setting tool

[PRODUCT_ID]
pid=14db,1f01;14dc,1f01;14db,1f03

[OPENBR_TIME]
wait_time=1

[OPEN_URL]
domain=http://au.home/
url=http://192.168.1.1
auto_open_url=1
</code></pre>

なお、`[OPEN_URL]` などの一部のパラメータは元々の HWD12 に合わせる形に変更した。
書き換えた上で、HiLink.app をインストールして、Mac を再起動後、HWD12 を接続すると `[OPEN_URL]` で指定した URL が開く。
私の環境での IP address のため、修正が必要になる場合もある。
URL が開いた際に "再セットアップが必要です!" というメッセージが出るが、無視して "ホームに戻る" ことでこれまで通り接続することができる。