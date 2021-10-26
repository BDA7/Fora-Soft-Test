//
//  TracksViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit
import SnapKit

protocol TracksViewProtocol {
    var interactor: TracksInteractorProtocol? { get set }

    func updateTracks(newTracks: [Tracks])
}

final class TracksViewController: UIViewController, TracksViewProtocol, UITableViewDelegate, UITableViewDataSource {

    let net = Network()
    var interactor: TracksInteractorProtocol?

    var mdl: Album?
//Url of album
    var urlString: String = " "
//Tacks of album
    var tracks: [Tracks]?


    lazy var imageOfAlbum: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        return image
    }()

    lazy var nameOfAlbum: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        return label
    }()

    lazy var nameOfArtist: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 15)
        return label
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TracksTableViewCell.self, forCellReuseIdentifier: "cellTable")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setups()
    }
//Update View
    func updateTracks(newTracks: [Tracks]) {
        self.tracks = newTracks
        tableView.reloadData()
    }
//Closing this view
    override func viewWillDisappear(_ animated: Bool) {
        interactor?.action(with: .goToRootIfViewClosed)
    }
//All Setups
    func setups() {
        setupNavController()
        setupImageOfAlbum()
        setupNameOfAlbum()
        setupNameOfArtist()
        setupTable()
        settingsSetup()
    }

}
//MARK: - Setup Elements View
extension TracksViewController {
    func setupImageOfAlbum() {
        view.addSubview(imageOfAlbum)
        imageOfAlbum.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(view.bounds.height/1.5)
            make.left.equalToSuperview().inset(view.bounds.width/5)
            make.right.equalToSuperview().inset(view.bounds.width/5)
        }
    }

    func setupNameOfAlbum() {
        view.addSubview(nameOfAlbum)
        nameOfAlbum.snp.makeConstraints { make in
            make.top.equalTo(imageOfAlbum.snp.bottom)
            make.bottom.equalTo(imageOfAlbum.snp.bottom).inset(-view.bounds.height/20)
            make.left.equalToSuperview().inset(view.bounds.width/5)
            make.right.equalToSuperview().inset(view.bounds.width/5)
        }
    }

    func setupNameOfArtist() {
        view.addSubview(nameOfArtist)
        nameOfArtist.snp.makeConstraints { make in
            make.top.equalTo(nameOfAlbum.snp.bottom)
            make.bottom.equalTo(nameOfAlbum.snp.bottom).inset(-view.bounds.height/30)
            make.left.equalToSuperview().inset(view.bounds.width/5)
            make.right.equalToSuperview().inset(view.bounds.width/5)
        }
    }

    func settingsSetup() {
        imageOfAlbum.load(link: mdl?.artworkUrl100)
        nameOfAlbum.text = mdl?.collectionName
        nameOfArtist.text = mdl?.artistName
        interactor?.action(with: .getTracks(urlString: urlString))
    }
}
//MARK: - TableView Settings
extension TracksViewController {
    func setupTable() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameOfArtist.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        self.tableView.separatorColor = .black
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! TracksTableViewCell

        let track = tracks?[indexPath.row]
        cell.configure(nameTrack: track?.trackName ?? "none", number: "\(indexPath.row + 1)")

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height/12
    }

}
//MARK: - NavController Settings
extension TracksViewController {
    func setupNavController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
    }
}
