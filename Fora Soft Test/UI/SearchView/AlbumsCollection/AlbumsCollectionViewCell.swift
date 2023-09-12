//
//  AlbumsCollectionViewCell.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit
import SnapKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    public var interactor: SearchInteracrotCellProtocol?
    
    private var collectionName: String = ""
    private var urlString: String = ""
    
    override func layoutSubviews() {
           super.layoutSubviews()
           setupContainer()
           setupImage()
           setupName()
           setupSpecialButton()
       }

       lazy var container: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           view.layer.masksToBounds = true
           view.layer.cornerRadius = 10.0
           view.layer.borderWidth = 1.5
           view.layer.borderColor = (UIColor.gray).cgColor
           view.layer.shadowOpacity = 0.2
           return view
       }()

       lazy var nameOfAlbum: UILabel = {
           let label = UILabel()
           label.text = "HELLO"
           label.textColor = .white
           label.textAlignment = .center
           label.font = UIFont(name: "Helvetica", size: 15)
           
           return label
       }()

       lazy var imageOfAlbum: UIImageView = {
          let image = UIImageView()
           return image
       }()
    
       private let specialButton = UIButton()

//Setups
       func setupContainer() {
           contentView.addSubview(container)
           container.snp.makeConstraints { make in
               make.top.equalToSuperview().inset(10)
               make.right.equalToSuperview().inset(10)
               make.left.equalToSuperview().inset(10)
               make.bottom.equalToSuperview().inset(10)
           }
       }
           
       func setupName() {
           container.addSubview(nameOfAlbum)
           nameOfAlbum.snp.makeConstraints { make in
               make.top.equalTo(imageOfAlbum.snp.bottom)
               make.bottom.equalTo(container)
               make.left.equalTo(container)
               make.right.equalTo(container)
           }
       }

       func setupImage() {
           container.addSubview(imageOfAlbum)
           imageOfAlbum.snp.makeConstraints { make in
               make.top.equalTo(container)
               make.bottom.equalTo(container).inset(contentView.frame.height/3.5-20)
               make.left.equalTo(container)
               make.right.equalTo(container)
           }
       }
       
    private func setupSpecialButton() {
        specialButton.addTarget(self, action: #selector(specialAction), for: .touchUpInside)
        specialButton.tintColor = .yellow
        container.addSubview(specialButton)
        specialButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
        }
    }
//Config Cell
       public func configure(nameText: String, urlImage: String) {
           collectionName = nameText
           urlString = urlImage
           nameOfAlbum.text = nameText
           imageOfAlbum.load(link: urlImage)
           findCell()
       }
    
    @objc
    private func specialAction(_ sender: UIButton) {
        interactor?.addToRealm(collectionName: collectionName, urlString: urlString)
        findCell()
        
    }
    
    private func findCell() {
        guard let flag = interactor?.findSpecial(collectionName: collectionName) else { return }
        specialButton.setImage(
            flag ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"),
            for: .normal)
    }
}
