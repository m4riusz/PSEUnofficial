//
//  iOSWidgetAssembly.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import Core
import Swinject
import WidgetKit

final class iOSWidgetAssembly: ModuleAssembly {

    func assemble(container: Container, launchEnviroment: LaunchEnvironment) {
        container.register(StatusProvider.self) { r in
            StatusProvider(repository: r.resolve(PSERepositoryProtocol.self)!)
        }
        container.register(SummaryViewModel.self) { r, status in
            SummaryViewModel(noFractionDigitsFormatter: r.resolve(DoubleValueFormatter.self, name: "NoFractionDigitsValueFormatter")!,
                             frequencyDoubleFormatter: r.resolve(DoubleValueFormatter.self, name: "FrequencyDigitsValueFormatter")!,
                             status: status as PSEStatus)
        }
        container.register(ErrorViewModel.self) { _, error in
            ErrorViewModel(error: error as Error)
        }
    }
}
