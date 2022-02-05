//
//  ModuleAssembly.swift
//  Core
//
//  Created by Mariusz Sut on 04/02/2022.
//

import Foundation
import Swinject

public protocol ModuleAssembly {
    func assemble(container: Container)
}
