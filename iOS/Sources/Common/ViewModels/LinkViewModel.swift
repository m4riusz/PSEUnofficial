//
//  LinkViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Foundation

struct LinkViewModel {
    let text: String?
    let url: URL
    let tap: () -> Void

    init(text: String? = nil, url: URL, tap: @escaping () -> Void) {
        self.text = text
        self.url = url
        self.tap = tap
    }
}

// MARK: - Equatable
extension LinkViewModel: Equatable {
    static func==(lhs: LinkViewModel, rhs: LinkViewModel) -> Bool {
        lhs.text == rhs.text && lhs.url == rhs.url
    }
}
