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
    
    func autorizeAndRegister(email: String, password: String, comletion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/auth") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: ModelUser(email: email, password: password), options: .prettyPrinted)
        } catch {
            comletion(.failure(error))
        }
        
        URLSession.shared.dataTask(with: request) {data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    comletion(.failure(error))
                    return
                }
                guard let data = data else { return }
                
                do {
                    let answer = try JSONDecoder().decode(RequestAuth.self, from: data)
                    comletion(.success(answer.flag))
                } catch {
                    comletion(.failure(error))
                }
                
            }
        }
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
