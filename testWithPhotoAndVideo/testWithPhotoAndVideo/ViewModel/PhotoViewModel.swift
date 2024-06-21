//
//  PhotoViewModel.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import Foundation
import RxSwift
import RxCocoa

final class PhotoViewModel {
    
    private let unsplashService: UnsplashService
    
    let disposeBag = DisposeBag()
    let photos = BehaviorRelay<[Photo]>(value: [])
    
    init(unsplashService: UnsplashService) {
           self.unsplashService = unsplashService
           fetchRandomPhotos()
    }
    
    func fetchRandomPhotos() {
        unsplashService.fetchRandomPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos.accept(photos)
            case .failure(let error):
                print("Error fetching photos: \(error)")
            }
        }
    }
}
