//
//  Photo.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let description: String?
    let urls: Urls?
}

struct Urls: Decodable {
    let small: String
    let full: String
}
