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
        container.register(PowerStatusViewModel.self) { r in
            PowerStatusViewModel(useCase: r.resolve(PSEGetStatusUseCaseProtocol.self)!,
                                 noFractionDigitsFormatter: r.resolve(DoubleValueFormatter.self,
                                                                      name: "NoFractionDigitsValueFormatter")!,
                                 frequencyDoubleFormatter: r.resolve(DoubleValueFormatter.self,
                                                                     name: "FrequencyDigitsValueFormatter")!)
        }
    }
}
