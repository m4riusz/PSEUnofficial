xcodebuild \
	-project PSEUnofficial.xcodeproj \
	-scheme UnitTests \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone SE (3rd generation),OS=17.2' \
	test

