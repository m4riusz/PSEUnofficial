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
struct iOSApp: App {

    private let container = iOSAssembler(container: Container()).assembly()

    var body: some Scene {
        WindowGroup {
            MainView(container: container)
        }
    }
}
