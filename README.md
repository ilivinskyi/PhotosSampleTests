# PO for photos removal test (default photos app)
Tests adapted to both, iPad and iPhone

![alt text](https://github.com/ilivinskyi/snippets-and-media/blob/main/run2.gif)

### Installation
Clone or download the repository 

    git clone https://github.com/ilivinskyi/PhotosSampleTests.git

### Running tests
switch to the cloned folder 

	cd PhotosSampleTests/TestApp

run tests (tests will run on both, iPhone and iPad)

	xcodebuild test -scheme TestAppUITests -destination "platform=iOS Simulator,name=iPhone 11 Pro" -destination "platform=iOS Simulator,name=iPad (9th generation)"  -testPlan PhotoOperations -resultBundlePath result.xcresult

Also, tests can be run directly from the Xcode
