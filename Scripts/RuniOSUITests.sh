xcodebuild \
	-project PSEUnofficial.xcodeproj \
	-scheme iOSUITests \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone 8,OS=15.0' \
	test
