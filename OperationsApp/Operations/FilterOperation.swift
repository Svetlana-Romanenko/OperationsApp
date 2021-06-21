//
//  FilterOperation.swift
//  OperationsApp
//
//  Created by Светлана Романенко on 10.06.2021.
//

import UIKit

class FilterOperation: Operation {
    
    var outputImage: UIImage?

    private let _inputImage: UIImage?
    
    init( _ image: UIImage?) {
        _inputImage = image
        
        super.init()
    }
    
    var inputImage: UIImage? {
        var image: UIImage?
        if let inputImage = _inputImage {
            image = inputImage
        } else if let dataProvider = dependencies
                    .filter( { $0 is ImageOutput } )
                    .first as? ImageOutput {
            image = dataProvider.image
        }
        return image
    }
    
    override func main() {
        if isCancelled { return }
        outputImage = filterImage(image: inputImage)
    }
    
    private func filterImage(image: UIImage?) -> UIImage? {
        guard let image = image else {
            return nil
        }
        return image.resized(toWidth: 60)
    }
}
