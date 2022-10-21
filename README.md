# example



-assets 項目內資源調用
-base 基類
-bindings 綁定項目生命週期內的服務 (用戶信息 etc..)
-data 數據源
   -local 本地
   -remove 遠端
-http 網絡相關 
-modules  模塊
   -home 首頁模塊
      -bindings 具體頁面需要綁定的控制器
      -controller 控制器
      -repo repository 數據源
      -widget 模塊內的組件
      -xx_page 具體展示頁
-routes
   -src 分模塊劃分路由
-tools 解決業務的方法 比如勝率的計算/利潤的計算
-utils 代碼層面的工具
-widget 整個應用層面通用的組件


## 运行
1. 下载安装sdk：https://docs.flutter.dev/get-started/install  
   选择 Flutter Version : Channel stable, 3.0.5
2. flutter pub get
3. flutter run (flutter debug模式是JIT流畅度低)

## 打包
flutter build apk --release  (flutter release模式是AOT流畅度高)



## 查找无用代码

flutter pub run dart_code_metrics:metrics check-unused-files lib