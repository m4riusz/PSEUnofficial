//
//  iOSAssembly.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import Core
import Swinject

final class iOSAssembly: ModuleAssembly {

    func assemble(container: Container) {
        /*Nop*/
        container.register(PSEPowerStatusViewModel.self) { r in
            PSEPowerStatusViewModel(useCase: r.resolve(GetStatusUseCaseProtocol.self)!)
        }
    }
}
