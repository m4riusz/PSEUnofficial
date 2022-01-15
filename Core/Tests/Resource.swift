//
//  Resource.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

struct Resource {
    let bundleForClass: AnyObject.Type
    let file: String

    init(bundleForClass: AnyObject.Type, file: String) {
        self.bundleForClass = bundleForClass
        self.file = file
    }

    var bundle: Bundle? {
        Bundle(for: bundleForClass)
    }

    var url: URL? {
        bundle?.url(forResource: file, withExtension: nil)
    }

    var data: Data? {
        guard let url = url, let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
}
