//
//  AppAssembler.swift
//  Core
//
//  Created by Mariusz Sut on 04/02/2022.
//

import Foundation
import Swinject

public protocol AppAssembler {
    var container: Container { get }
    var assemblies: [ModuleAssembly] { get }

    func assembly()
}
