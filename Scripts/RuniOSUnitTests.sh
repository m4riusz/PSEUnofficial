xcodebuild \
	-project PSEUnofficial.xcodeproj \
	-scheme iOS \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone 15,OS=17.2' \
	test

