//
//  PhotoCollectionViewController.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import SnapKit
import RxSwift
import Kingfisher

final class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = String(describing: PhotoCollectionViewCell.self)
    private let viewModel = PhotoViewModel(unsplashService: UnsplashService())
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModel()
        viewModel.fetchRandomPhotos()
    }
    
    private func setupCollectionView() {
        title = "Photos"
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    private func bindViewModel() {
        collectionView.delegate = nil
        collectionView.dataSource = nil
        
        viewModel.photos
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: PhotoCollectionViewCell.self)) { index, photo, cell in
                cell.configure(with: photo)
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self,
                      let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell,
                      let image = cell.imageView.image else { return }
                self.showFullScreenImage(image: image)
            })
            .disposed(by: disposeBag)
    }
    
    private func showFullScreenImage(image: UIImage) {
        let fullScreenVC = FullScreenImageViewController(image: image)
        fullScreenVC.modalPresentationStyle = .fullScreen
        present(fullScreenVC, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding * 3
        let itemSize = collectionViewSize / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
