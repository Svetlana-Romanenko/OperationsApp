//
//  NetworkManager.swift
//  OperationsApp
//
//  Created by Светлана Романенко on 10.06.2021.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    public func asyncImageLoad(imageURL: URL, completion: @escaping ((UIImage?) -> Void)) {
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data {
                completion(UIImage(data: data))
            }
        }
        task.resume()
    }
}
