//
//  PexelsService.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation
import Alamofire
import RxSwift

final class PexelsService {
    
    private let apiKey = "R1qWf5iGxOQ6dfFvHgRr8riVQfbXSodA7guXoZOmjo0g9BloE1xSO3Xz"
    private let baseURL = "https://api.pexels.com/videos"
    
    func fetchVideos() -> Observable<[Video]> {
        return Observable.create { observer in
            let url = "\(self.baseURL)/popular"
            let headers: HTTPHeaders = [
                "Authorization": self.apiKey
            ]
            
            AF.request(url, headers: headers).responseDecodable(of: PexelsVideoResponse.self) { response in
                switch response.result {
                case .success(let videoResponse):
                    observer.onNext(videoResponse.videos)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
