//
//  iOSApp.swift
//  PSEUnofficial
//
//  Created by Mariusz Sut on 08/01/2022.
//

import SwiftUI
import Swinject
import Core

struct iOSApp: App {

    var body: some Scene {
        WindowGroup {
            MainView(container: iOSAssembler(container: Container(),
                                             launchEnvironment: LaunchEnvironment(enviroment: ProcessInfo().environment)).assembly())
        }
    }
}
