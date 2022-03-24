//
//  AboutRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 24/03/2022.
//

import Foundation

enum AboutRowViewModel {
    case header(text: String)
    case description(text: String)
    case link(title: String, linkViewModel: LinkViewModel)
    case version(version: String)
}

// MARK: - Identifiable
extension AboutRowViewModel: Equatable { /*Nop*/ }

// MARK: - Identifiable
extension AboutRowViewModel: Identifiable {
    var id: String {
        switch self {
        case .header(let text): return text
        case .description(let text): return text
        case .link(let title, _): return title
        case .version(let version): return version
        }
    }
}
