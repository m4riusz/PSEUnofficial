//
//  iOSWidget.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import WidgetKit
import Swinject
import Core
import SwiftUI

@main
struct iOSWidget: Widget {
    private struct Constants {
        static let kind = "SummaryWidget"
    }
    private let container = iOSWidgetAssembler(container: Container(),
                                               launchEnvironment: LaunchEnvironment(enviroment: ProcessInfo().environment)).assembly()

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: Constants.kind,
                            intent: ConfigurationIntent.self,
                            provider: container.resolve(StatusProvider.self)!) { entry in
            SummaryView(viewModel: container.resolve(SummaryViewModel.self, argument: entry.data)!)
        }.supportedFamilies([.systemLarge])
    }
}
