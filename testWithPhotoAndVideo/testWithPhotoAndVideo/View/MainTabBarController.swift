//
//  MainTabBarController.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let photosTitle = "Photos"
    private let videosTitle = "Videos"
    private let photosIcon = "photo.on.rectangle"
    private let videosIcon = "film"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoLayout = UICollectionViewFlowLayout()
        let photosVC = PhotoCollectionViewController(collectionViewLayout: photoLayout)
        let photosNavVC = UINavigationController(rootViewController: photosVC)
        photosNavVC.tabBarItem = UITabBarItem(title: photosTitle, image: UIImage(systemName: photosIcon), tag: 0)
        
        let videosVC = VideoTableViewController()
        let videosNavVC = UINavigationController(rootViewController: videosVC)
        videosNavVC.tabBarItem = UITabBarItem(title: videosTitle, image: UIImage(systemName: videosIcon), tag: 1)
        
        viewControllers = [photosNavVC, videosNavVC]
    }
}
