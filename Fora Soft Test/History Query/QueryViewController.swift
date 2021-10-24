//
//  QueryViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit


protocol QueryViewProtocol {
    var interactor: QueryInteractorProtocol? { get set }
}

final class QueryViewController: UIViewController, QueryViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {

    var interactor: QueryInteractorProtocol?

    var queryText: String = ""

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/2.1, height: view.frame.width/2.1)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(AlbumsCollectionViewCell.self))

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()

    }
}

extension QueryViewController {
    func collectionSetup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(AlbumsCollectionViewCell.self), for: indexPath) as! AlbumsCollectionViewCell
        
        return cell
    }
}
