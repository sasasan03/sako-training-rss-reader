//
//  YhahooRSSTest.swift
//  TrainingRSSReader
//
//  Created by sako0602 on 2024/06/07.
//

import SwiftUI

struct YhahooRSSTest: View {
    @State private var feed: RSSFeed?
    var body: some View {
        NavigationStack {
            VStack {
                if let feed {
                    Text("\(feed.channel.title)")
                } else {
                    Text("news feedを取得できませんでした")
                }
            }
            .task {
                do {
                    let rssFetcher = try await RSSFeedFetcher().fetchFeed()
                    feed = rssFetcher!
                } catch {
                    print("#miss fetch")
                }
            }
        }
    }
}

#Preview {
    YhahooRSSTest()
}
