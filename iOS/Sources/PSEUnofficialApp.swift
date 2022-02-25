//
//  PSEUnofficialApp.swift
//  PSEUnofficial
//
//  Created by Mariusz Sut on 08/01/2022.
//

import SwiftUI
import Swinject
import Core

@main
struct PSEUnofficialApp: App {

    private let container = iOSAssembler(container: Container()).assembly()

    var body: some Scene {
        WindowGroup {
            PowerStatusView(viewModel: container.resolve(PowerStatusViewModel.self)!)
        }
    }
}
