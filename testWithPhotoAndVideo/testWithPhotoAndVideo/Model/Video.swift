//
//  Video.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation

struct Video: Decodable {
    let id: Int
    let width: Int?
    let height: Int?
    let url: String
    let image: String
    let duration: Int?
    let user: User?
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, url, image, duration, user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
}

struct User: Decodable {
    let id: Int
    let name: String
    let url: String
}

struct VideoFile: Decodable {
    let id: Int
    let quality: String
    let fileType: String
    let width: Int?
    let height: Int?
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id, quality
        case fileType = "file_type"
        case width, height, link
    }
}

struct VideoPicture: Decodable {
    let id: Int
    let picture: String
    let nr: Int
}

struct PexelsVideoResponse: Decodable {
    let page: Int
    let perPage: Int
    let totalResults: Int
    let url: String
    let videos: [Video]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url, videos
    }
}
