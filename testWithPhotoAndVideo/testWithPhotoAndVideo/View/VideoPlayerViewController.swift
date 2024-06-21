//
//  VideoPlayerViewController.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import AVFoundation
import AVKit

final class VideoPlayerViewController: UIViewController {
    
    private let videoURL: String
    private var player: AVPlayer?
    private var playerViewController: AVPlayerViewController?
    
    init(videoURL: String) {
        self.videoURL = videoURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        guard let url = URL(string: videoURL) else { return }
        player = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
        guard let playerVC = playerViewController else { return }
        
        addChild(playerVC)
        view.addSubview(playerVC.view)
        playerVC.view.frame = view.frame
        playerVC.player?.play()
    }
}
