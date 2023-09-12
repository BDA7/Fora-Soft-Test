//
//  Network.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

class Network {
// request albums for artist
    func request(urlString: String, completion: @escaping (Result<ModelAlbum, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let albums = try JSONDecoder().decode(ModelAlbum.self, from: data)
                    completion(.success(albums))
                } catch  let jsonError {
                    print("Faled Decode \(jsonError)")
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
// request tracks for album
    func requestTracks(urlString: String, completion: @escaping (Result<ModelTracks, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(ModelTracks.self, from: data)
                    completion(.success(tracks))
                } catch  let jsonError {
                    print("Faled Decode \(jsonError)")
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
// image download by url
extension UIImageView {
    func load(link: String?) {
        if link != " ", link != nil {
            guard let url = URL(string: link! ) else { return }
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            self.image = UIImage(named: "nullImage")
        }
    }
}
// checking spaces
extension String {
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
extension Optional where Wrapped == String {
    var isBlank: Bool {
        if let unwrapped = self {
            return unwrapped.isBlank
        } else {
            return true
        }
    }
}
