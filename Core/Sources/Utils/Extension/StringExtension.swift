//
//  StringExtension.swift
//  Core
//
//  Created by Mariusz Sut on 19/02/2022.
//

import Foundation

public extension String {
    static func localized(_ table: String, _ key: String, _ bundle: Bundle) -> String {
        NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
    }

    static func localizedWithArgs(_ table: String, _ key: String, _ bundle: Bundle, _ args: [StringRepresentable]) -> String {
        String(format: NSLocalizedString(key, tableName: table, bundle: bundle, comment: ""), arguments: args.map { $0.string })
    }
}
