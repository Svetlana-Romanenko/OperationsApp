//
//  ImageLoadOperation.swift
//  OperationsApp
//
//  Created by Светлана Романенко on 10.06.2021.
//

import UIKit

protocol ImageOutput {
    var image: UIImage? { get }
}

class ImageLoadOperation: AsyncOperation {
    var outputImage: UIImage?
    
    private var url: URL?
    
    init(url: URL?) {
        self.url = url
        super.init()
    }
    
    override func main() {
        if self.isCancelled { return }
        if let imageURL = url {
            NetworkManager.shared.asyncImageLoad(imageURL: imageURL) { [weak self] image in
                if self != nil && self!.isCancelled { return }
                self?.outputImage = image
                self?.state = .finished
            }
        }
    }
}

//MARK: - Add dependency

extension ImageLoadOperation: ImageOutput {
    var image: UIImage? {
        return outputImage
    }
}
