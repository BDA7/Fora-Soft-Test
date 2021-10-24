//
//  TracksTableViewCell.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit
import SnapKit

class TracksTableViewCell: UITableViewCell {

    

    lazy var imageOfAlbum: UIImageView = {
        let image = UIImageView()
        return image
    }()

    lazy var nameOfTrack: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .black
        
        setupImage()
        setupName()
    }

    func setupImage() {
        contentView.addSubview(imageOfAlbum)
        imageOfAlbum.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(2)
            make.bottom.equalTo(contentView.snp.bottom).inset(2)
            make.left.equalTo(contentView.snp.left).inset(2)
            make.right.equalTo(contentView.snp.right).inset(contentView.bounds.width/1.2)
        }
    }

    func setupName() {
        contentView.addSubview(nameOfTrack)
        nameOfTrack.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            make.left.equalTo(imageOfAlbum.snp.right).inset(2)
            make.right.equalTo(contentView.snp.right)
        }
    }

    func configure(nameTrack: String, imageTrack: String) {
        nameOfTrack.text = nameTrack
        if imageTrack != " " {
            imageOfAlbum.load(link: imageTrack)
        } else {
            imageOfAlbum.image = UIImage(named: "nullImage")
        }
    }
}
