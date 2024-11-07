xcodebuild \
	-project PSEUnofficial.xcodeproj \
	-scheme iOSUITests \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone 15,OS=17.2' \
	test
