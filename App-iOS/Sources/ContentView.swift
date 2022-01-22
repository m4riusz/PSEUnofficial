//
//  ContentView.swift
//  PSEUnofficial
//
//  Created by Mariusz Sut on 08/01/2022.
//

import SwiftUI
import Combine
import Core

struct ContentView: View {

    @ObservedObject var viewModel = SampleViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.values, id: \.self) { text in
                Text(text)
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}

class SampleViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published private(set) var values: [String] = []

    private lazy var repository = PSERepository(service: PSERequestService(baseUrl: "https://www.pse.pl", jsonDecoder: JSONDecoder(), urlSession: URLSession.shared))

    func load() {
        repository.getStatus()
            .receive(on: DispatchQueue.main)
            .sink { _ in

            } receiveValue: { status in
                self.values = status.data.flows.map { "\($0.direction.rawValue): \($0.value)"}
            }
            .store(in: &subscriptions)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
