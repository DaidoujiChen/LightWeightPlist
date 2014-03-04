LightWeightPlist
================

It is a lightweight tool allows you to easily access plist files in document / resource folder

DaidoujiChen

daidoujichen@gmail.com

總覽
======
這是一個方便而且輕量的工具, 幫助存取, 並使用 plist 檔案.

支援
======
- 只支援 ARC.

簡易使用
======
- 將 LightWeightPlist 資料夾下的檔案複製至專案內.
- import LightWeightPlist.h 到需要使用的地方.
- 只有四個 method 需要使用
  - LWPArray, 讀取 plist 檔案作 nsmutablearray 使用.
  - LWPDictionary, 讀取 plist 檔案作 nsmutabledictionary 使用.
  - LWPDelete, 刪除某個名稱的檔案, 及其快取.
  - LWPForceWrite, 強制寫回 device.
  
讀取機制
======
讀取的順序為, 快取 -> document folder -> resource folder, 如果皆無內容, 則返回空 array / dictionary,
之後, 將其置入快取內, 成為全專案可共享的內容.

快取機制
======
所有的內容會暫時保留在 nscache 內, 減少與 device 寫入及讀取的時間.

寫入機制
======
寫入的管道有二, 一是自動由系統通知寫入, 可能是在使用者按 Home 鍵, 或是收到 memory warning 時觸發, 二是直接 call LWPForceWrite 強制釋放 nscache 以做寫入動作.

須知
======
如果 app 異常 crash 時, cache 無法觸發釋放行為, 因此資料會無法回寫, 因此, 如果有需要記錄較為重要的數據時, 請直接下 LWPForceWrite 以防萬一.





