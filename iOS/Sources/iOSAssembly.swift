//
//  iOSAssembly.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import Core
import Swinject
import UIKit

final class iOSAssembly: ModuleAssembly {

    func assemble(container: Container) {
        container.register(UrlHandlerProtocol.self) { _ in
            UIApplication.shared
        }
        container.register(AboutViewModel.self) { r in
            AboutViewModel(appInfoProvider: r.resolve(AppInformationProviderProtocol.self)!,
                           urlHandler: r.resolve(UrlHandlerProtocol.self)!)
        }

        container.register(PowerStatusViewModel.self) { r in
            PowerStatusViewModel(useCase: r.resolve(PSEGetStatusUseCaseProtocol.self)!,
                                 noFractionDigitsFormatter: r.resolve(DoubleValueFormatter.self,
                                                                      name: "NoFractionDigitsValueFormatter")!,
                                 frequencyDoubleFormatter: r.resolve(DoubleValueFormatter.self,
                                                                     name: "FrequencyDigitsValueFormatter")!)
        }

    }
}
