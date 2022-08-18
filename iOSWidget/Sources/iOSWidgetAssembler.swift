//
//  iOSWidgetAssembler.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import Swinject
import Core

final class iOSWidgetAssembler: AppAssembler {

    let container: Container
    let launchEnvironment: LaunchEnvironment

    init(container: Container, launchEnvironment: LaunchEnvironment) {
        self.container = container
        self.launchEnvironment = launchEnvironment
    }

    var assemblies: [ModuleAssembly] = [
        CoreAssembly(),
        iOSWidgetAssembly()
    ]

    func assembly() -> Container {
        assemblies.forEach { $0.assemble(container: container, launchEnviroment: launchEnvironment) }
        return container
    }
}
