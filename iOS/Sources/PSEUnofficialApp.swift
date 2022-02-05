//
//  PSEUnofficialApp.swift
//  PSEUnofficial
//
//  Created by Mariusz Sut on 08/01/2022.
//

import SwiftUI
import Swinject

@main
struct PSEUnofficialApp: App {

    private lazy var assembler: iOSAssembler = {
        let assembler = iOSAssembler(container: Container())
        assembler.assembly()
        return assembler
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
