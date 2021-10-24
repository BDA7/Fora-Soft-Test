//
//  AlbumsCollectionViewCell.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit
import SnapKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
           super.layoutSubviews()
           setupContainer()
           setupImage()
           setupName()
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

       public func configure(nameText: String, urlImage: String) {
           nameOfAlbum.text = nameText
           imageOfAlbum.load(link: urlImage)
       }
}
