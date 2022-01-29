//
//  PSERequestStatus.swift
//  Core
//
//  Created by Mariusz Sut on 22/01/2022.
//

import Foundation

struct PSERequestStatus: PSEAbstractRequest {
    typealias Response = PSEStatusDto
    let serviceName = "PSERequestStatus"
    let path = "transmissionMapService"
    let method = HTTPMethod.get
}
