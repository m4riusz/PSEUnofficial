//
//  CoreAssembly.swift
//  Core
//
//  Created by Mariusz Sut on 04/02/2022.
//

import Swinject
import Foundation

public class CoreAssembly: ModuleAssembly {

    public init() { /*Nop*/ }

    public func assemble(container: Container) {
        container.register(URLSession.self) { _ in
            URLSession.shared
        }.inObjectScope(.container)

        container.register(JSONDecoder.self) { _ in
            PSEJsonDecoder()
        }

        container.register(Bundle.self) { _ in
            Bundle.main
        }

        container.register(AppInformationProviderProtocol.self) { r in
            AppInformationProvider(bundle: r.resolve(Bundle.self)!)
        }
        container.register(PSERequestServiceProtocol.self) { r in
            PSERequestService(baseUrl: "https://www.pse.pl/",
                              jsonDecoder: r.resolve(JSONDecoder.self)!,
                              urlSession: r.resolve(URLSession.self)!)
        }

        container.register(PSEDataSourceProtocol.self) { r in
            PSEDataSourceApi(service: r.resolve(PSERequestServiceProtocol.self)!)
        }

        container.register(PSERepositoryProtocol.self) { r in
            PSERepository(remote: r.resolve(PSEDataSourceProtocol.self)!)
        }

        container.register(PSEGetStatusUseCaseProtocol.self) { r in
            PSEGetStatusUseCase(repository: r.resolve(PSERepositoryProtocol.self)!)
        }

        container.register(DoubleValueFormatter.self, name: "NoFractionDigitsValueFormatter") { _ in
            DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
        }

        container.register(DoubleValueFormatter.self, name: "FrequencyDigitsValueFormatter") { _ in
            DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        }
    }
}
