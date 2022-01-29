//
//  DtoExtension.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

extension PSEStatusDto {
    var asDomain: PSEStatus {
        .init(status: status,
              date: date,
              data: data.asDomain)
    }
}

extension PSEDataDto {
    var asDomain: PSEData {
        .init(flows: flows.map { $0.asDomain },
              summary: summary.asDoimain)
    }
}

extension PSEFlowDto {
    var asDomain: PSEFlow {
        .init(direction: direction.asDomain,
              value: value,
              parallel: parallel,
              planned: planned)
    }
}

extension PSEDirectionDto {
    var asDomain: PSEDirection {
        switch self {
        case .sweden: return .sweden
        case .germany: return .germany
        case .czech: return .czech
        case .slovakia: return .slovakia
        case .ukraine: return .ukraine
        case .lithuania: return .lithuania
        }
    }
}

extension PSESummaryDto {
    var asDoimain: PSESummary {
        .init(water: water,
              wind: wind,
              solar: solar,
              thermal: thermal,
              other: other,
              frequency: frequency,
              load: load,
              generation: generation)
    }
}
