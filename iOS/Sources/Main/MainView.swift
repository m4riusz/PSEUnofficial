//
//  MainView.swift
//  iOS
//
//  Created by Mariusz Sut on 25/02/2022.
//

import SwiftUI
import Core
import Swinject

struct MainView: View {
    private typealias Images = Assets.Images.iOS.Tab
    private typealias Literals = Assets.Strings.iOS.Main
    let container: Container

    var body: some View {
        TabView {
            PowerStatusView(viewModel: container.resolve(PowerStatusViewModel.self)!)
                .tabItem {
                    Text(Literals.PowerStatus.tab)
                    Images.load
                }
            AboutView()
                .tabItem {
                    Text(Literals.About.tab)
                    Images.info
                }
        }
    }
}
