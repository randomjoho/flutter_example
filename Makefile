# 標記該target只是執行命令，並沒有生成文件
.PHONY: clean podClean deepClean runUnit

# all是直接make的預設行為
all: deepClean buildRunner buildApk

# Generate assets
buildAssets:
	dart bin/build_assets.dart

buildRunner:
	## build .g file
	@echo "build .g file"
	flutter packages pub run build_runner build --delete-conflicting-outputs

clean:
	## flutter clean
	flutter clean
	flutter pub get

podClean:
	## clean pod
	rm -Rf ios/Pods
	rm -Rf ios/.symlinks
	pod cache clean --all
	rm -Rf ios/Flutter/Flutter.framework

# target可以包含其他的target作為前置條件
deepClean: podClean clean
	@echo "DeepClean Finish"


# ||後面為自行定義錯誤信息
runUnit:
	@echo "run unit test"
	flutter test || (echo "▓▓ Error while running tests ▓▓"; exit 1)

# 在打包前執行runUnit,如果報錯不往下執行
buildApk: runUnit
	flutter build apk

buildiOS: runUnit
	flutter build ios

checkUnusedFile:
	flutter pub run dart_code_metrics:metrics check-unused-files lib

