//
//  StatusEntryView.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 18/08/2022.
//

import SwiftUI
import Swinject

struct StatusEntryView: View {
    let container: Container
    let entryData: StatusProvider.Entry

    var body: some View {
        switch entryData.result {
        case .success(let status):
            SummaryView(viewModel: container.resolve(SummaryViewModel.self, argument: status)!)
        case .failure(let error):
            ErrorView(viewModel: container.resolve(ErrorViewModel.self, argument: error)!)
        }
    }
}
