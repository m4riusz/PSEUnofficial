//
//  PSEJsonDecoder.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

final class PSEJsonDecoder: JSONDecoder {

    override init() {
        super.init()
        dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.millisecondsSince1970
    }
}
