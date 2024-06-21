//
//  VideoViewModel.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation
import RxSwift
import RxCocoa

final class VideoViewModel {
    
    private let pexelsService: PexelsService
    
    let videos = BehaviorRelay<[Video]>(value: [])
    let disposeBag = DisposeBag()
    
    init(pexelsService: PexelsService) {
        self.pexelsService = pexelsService
    }
    
    func fetchVideos() {
        pexelsService.fetchVideos()
            .subscribe(onNext: { [weak self] videos in
                self?.videos.accept(videos)
            }, onError: { error in
                print("Failed to fetch videos: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
