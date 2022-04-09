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
    let launchEnvironment: LaunchEnvironment

    init(container: Container, launchEnvironment: LaunchEnvironment) {
        self.container = container
        self.launchEnvironment = launchEnvironment
    }

    var assemblies: [ModuleAssembly] = [
        CoreAssembly(),
        iOSAssembly()
    ]

    func assembly() -> Container {
        assemblies.forEach { $0.assemble(container: container, launchEnviroment: launchEnvironment) }
        return container
    }
}
