//
//  VideoTableViewController.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import AVFoundation
import Alamofire
import RxSwift
import RxCocoa

final class VideoTableViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = VideoViewModel(pexelsService: PexelsService())
    private let disposeBag = DisposeBag()
    private let cellId = String(describing: VideoTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.fetchVideos()
    }
    
    private func setupTableView() {
        title = "Videos"
        view.addSubview(tableView)
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.videos
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: VideoTableViewCell.self)) { index, video, cell in
                cell.configure(with: video)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Video.self)
            .subscribe(onNext: { [weak self] video in
                let videoPlayerVC = VideoPlayerViewController(videoURL: video.videoFiles.first?.link ?? "")
                videoPlayerVC.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(videoPlayerVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
