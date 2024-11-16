//
//  iOSApp.swift
//  PSEUnofficial
//
//  Created by Mariusz Sut on 08/01/2022.
//

import SwiftUI
import Swinject
import Core

@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            iOSApp.main()
        } else {
            TestApp.main()
        }
    }
}

struct iOSApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(container: iOSAssembler(container: Container(),
                                             launchEnvironment: LaunchEnvironment(enviroment: ProcessInfo().environment)).assembly())
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests").foregroundStyle(.red) }
    }
}
