//
//  AppLauncher.swift
//  iOS
//
//  Created by Mariusz Sut on 09/11/2024.
//

import Foundation
import SwiftUI

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

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}
