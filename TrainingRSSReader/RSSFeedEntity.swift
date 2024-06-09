//
//  RSSFeedEntity.swift
//  TrainingRSSReader
//
//  Created by sako0602 on 2024/06/09.
//

import Foundation

// RSSフィード全体を表すモデル
struct RSSFeed: Codable {
    let channel: Channel
}

// チャンネルを表すモデル
struct Channel: Codable {
    let title: String
    let link: String
    let description: String
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case title
        case link
        case description
        case items = "item"
    }
}

// 各記事（アイテム）を表すモデル
struct Item: Codable, Hashable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
