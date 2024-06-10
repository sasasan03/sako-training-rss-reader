//
//  YahooRSSFeedRepository.swift
//  TrainingRSSReader
//
//  Created by sako0602 on 2024/06/09.
//

import Foundation

final class YahooRSSFeedRepository {
    let dataStore: RSSFetcherProtocol?
    
    init(rssFetcherProtocol: RSSFetcherProtocol? = RSSFeedFetcher()) {
        self.dataStore = rssFetcherProtocol
    }
    
    func fetchFeed() async throws -> RSSFeed? {
        guard let dataStore else {
            throw RSSFeedError.rssFetchError
        }
        return try await dataStore.fetchFeed()
    }
}
