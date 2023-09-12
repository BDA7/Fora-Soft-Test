//
//  SpecialViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 13.09.2023.
//

import UIKit
import SnapKit

protocol SpecialViewProtocol: AnyObject {
    var interactor: SpecialInteractorProtocol? { get set }
    func updateCollectionView(newModel: [SpecialObject])
}

class SpecialViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/2.1, height: view.frame.width/2.1)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.register(SpecialCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(SpecialCollectionViewCell.self))

        return collectionView
    }()
    
    var interactor: SpecialInteractorProtocol?
    
    private var currentModel: [SpecialObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getSpecials()
    }
    
    private func collectionSetup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

}

extension SpecialViewController: SpecialViewProtocol {
    func updateCollectionView(newModel: [SpecialObject]) {
        self.currentModel = newModel
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension SpecialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SpecialCollectionViewCell.self), for: indexPath) as! SpecialCollectionViewCell
        
        let model = currentModel[indexPath.row]
        cell.configure(nameText: model.collectionName, urlImage: model.urlString)
        
        return cell
    }
    
}
