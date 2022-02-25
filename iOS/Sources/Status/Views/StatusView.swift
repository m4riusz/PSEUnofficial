//
//  StatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct StatusView: View {

    let status: PSEStatus

    var body: some View {
        Text("\(status.date.ISO8601Format())")
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.caption)
        List {
            Section("Flows") {
                ForEach(status.data.flows, id: \.direction) { flow in
                    FlowView(flow: flow)
                }
            }
            Section("Summary") {
                SummaryView(summary: status.data.summary)
            }
        }
        .listStyle(.plain)
    }
}
