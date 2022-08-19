//
//  StatusProvider.swift
//  Core
//
//  Created by Mariusz Sut on 15/08/2022.
//

import WidgetKit
import Intents
import Core

struct StatusProvider: IntentTimelineProvider {
    private struct Constants {
        static let freshDataDuration: TimeInterval = 5 * 60
    }
    private let repository: PSERepositoryProtocol

    init(repository: PSERepositoryProtocol) {
        self.repository = repository
    }

    func placeholder(in context: Context) -> StatusEntry { .init(result: .success(.placeholder)) }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (StatusEntry) -> Void) {
        completion(.init(result: .success(.placeholder)))
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<StatusEntry>) -> Void) {
        Task {
            do {
                let status = try await repository.getStatus()
                completion(.init(entries: [StatusEntry(result: .success(status))],
                                 policy: .after(status.date.addingTimeInterval(Constants.freshDataDuration))))
            } catch {
                completion(.init(entries: [StatusEntry(result: .failure(error))],
                                 policy: .after(.now.addingTimeInterval(Constants.freshDataDuration))))
            }
        }

    }
}
