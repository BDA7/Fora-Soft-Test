//
//  SearchViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

enum SearchViewAction {
    case refresh(newAlbums: [Album])
}

protocol SearchViewControllerProtocol {
    var interactor: SearchInteractorProtocol? { get set }

    func action(with: SearchViewAction)
}

final class SearchViewController: UIViewController, SearchViewControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    var interactor: SearchInteractorProtocol?

// Text for request
    fileprivate var requestText = ""

// Albums array
    var albums: [Album]?

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
    
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        collectionSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.action(with: .requestForHistoryElement)
    }
// Actions this viewController
    func action(with: SearchViewAction) {
        switch with {
        
        case .refresh(let newAlbums):
            refreshTableData(newAlbums: newAlbums)
        }
    }
}
//MARK: - TableView
extension SearchViewController {
// Setup settings for collectionView
    func collectionSetup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
// Updating the table on a new request
    func refreshTableData(newAlbums: [Album]) {
        self.albums = newAlbums
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
// Add element request in cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(AlbumsCollectionViewCell.self), for: indexPath) as! AlbumsCollectionViewCell

        guard let album = albums?[indexPath.row] else { return cell }
        
        cell.configure(nameText: album.collectionName, urlImage: album.artworkUrl100)

        return cell
    }
// Go to the selected album
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let choiceAlbum = albums?[indexPath.row] else { return }
        interactor?.action(with: .routeTracks(album: choiceAlbum))
    }
}

//MARK: - SearchContoller
extension SearchViewController {
// Setup settings searchController and searchBar
    func setupSearchController() {
        self.navigationItem.searchController = searchController
        searchController.searchBar.barTintColor = .black
        searchController.searchBar.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
    }
// Changed text for searchAlbums
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        requestText = searchText
    }
// Text server request (artist name)
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        interactor?.action(with: .searchAlbums(requestText: requestText))
    }
}
