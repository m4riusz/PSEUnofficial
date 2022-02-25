//
//  SummaryView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct SummaryView: View {
    let summary: PSESummary

    var body: some View {
        VStack {
            Text("LOAD [MW]: \(summary.load)")
            Text("GENERATION [MW]: \(summary.generation)")
            Text("FREQUENCY [Hz]: \(summary.frequency)")
            Text("Thermal: \(summary.thermal)")
            Text("Water: \(summary.water)")
            Text("Wind: \(summary.wind)")
            Text("Solar: \(summary.solar)")
            Text("other: \(summary.other)")
        }
    }
}
