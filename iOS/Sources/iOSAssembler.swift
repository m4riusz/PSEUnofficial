//
//  iOSAssembler.swift
//  iOS
//
//  Created by Mariusz Sut on 04/02/2022.
//

import Swinject
import Core

final class iOSAssembler: AppAssembler {

    let container: Container

    init(container: Container) {
        self.container = container
    }

    var assemblies: [ModuleAssembly] = [
        CoreAssembly(),
        iOSAssembly()
    ]

    func assembly() -> Container {
        assemblies.forEach { $0.assemble(container: container) }
        return container
    }
}
