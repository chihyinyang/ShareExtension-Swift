//
//  ViewController.swift
//  ShareExtensionExample
//
//  Created by 楊智茵 on 2022/11/3.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 20
        let width = (UIScreen.main.bounds.width - 4 * 20) / 3
        let height = width * 1.6
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = space
        layout.minimumLineSpacing = space
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return collectionView
    }()
    
    private let model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - collection data source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        // ensure model images has the right index for images
        if model.images.indices.contains(indexPath.item) {
            let image = model.images[indexPath.item]
            // put the image into imageView in cells
            cell.imageView.image = image
        }
        return cell
    }
}
