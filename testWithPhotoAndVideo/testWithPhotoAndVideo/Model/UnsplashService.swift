//
//  UnsplashService.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation
import Alamofire

final class UnsplashService {
    private let apiKey = "Lr7rk-FjvZl9ZDF9BR45unHt_pWMZ5kHZUacKetzDXI"
    private let baseUrl = "https://api.unsplash.com/"
    
    func fetchRandomPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = "\(baseUrl)photos/random"
        let parameters: Parameters = ["count": 30]
        
        AF.request(url, parameters: parameters, headers: ["Authorization": "Client-ID \(apiKey)"])
            .responseDecodable(of: [Photo].self) { response  in
                switch response.result {
                case .success(let photos):
                    completion(.success(photos))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
