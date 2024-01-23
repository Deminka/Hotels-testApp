//
//  NetworkManager.swift
//  Hotels
//
//  Created by mac on 05.01.2024.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()  
    
    func getFromAPI<T: Decodable>(url: URL, completion: @escaping (T?) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let currentData = try? JSONDecoder().decode(T.self, from: data) {
                completion(currentData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    func loadImages(urls: [URL], completion: @escaping ([UIImage]?) -> Void) {
        var downloadedImages = [UIImage]()
        let downloadGroup = DispatchGroup()
        
        for url in urls {
            downloadGroup.enter()
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                defer { downloadGroup.leave() }
                
                if let error = error {
                    print("Error downloading image: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    downloadedImages.append(image)
                }
            }.resume()
        }
        
        downloadGroup.notify(queue: .main) {
            completion(downloadedImages)
        }
    }
}

