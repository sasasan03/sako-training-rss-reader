//
//  YahooRSSFeedFetcher.swift
//  TrainingRSSReader
//
//  Created by sako0602 on 2024/06/09.
//

import Foundation
import XMLCoder

protocol RSSFetcherProtocol {
    func fetchFeed() async throws -> RSSFeed?
}

struct RSSFeedFetcher: RSSFetcherProtocol {
    func fetchFeed() async throws -> RSSFeed? {
        do {
            let url = URL(string: "https://news.yahoo.co.jp/rss/categories/world.xml")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedFeed = try XMLDecoder().decode(RSSFeed.self, from: data)
            return decodedFeed
        } catch {
            throw RSSFeedError.rssFetchError
        }
    }
}
