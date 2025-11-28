import Foundation

struct Music: Identifiable, Codable {
    let id: String
    let title: String
    let artist: String
    let duration: Int // in seconds
    let url: String
    var isDownloaded: Bool = false
    var downloadedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, title, artist, duration, url, isDownloaded, downloadedAt
    }
}

struct YouTubeVideo: Identifiable, Codable {
    let id: String
    let title: String
    let channel: String
    let thumbnail: String
    let url: String
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, channel, thumbnail, url, duration
    }
}

struct Playlist: Identifiable, Codable {
    let id: String
    var name: String
    var musics: [Music]
    var createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id, name, musics, createdAt
    }
}
