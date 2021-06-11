//
//  FilteredImageViewController.swift
//  OperationsApp
//
//  Created by Светлана Романенко on 09.06.2021.
//

import UIKit

let imageUrl = URL(string: "https://paris-life.info/wp-content/uploads/2016/11/eiffel-tower-paris-2.jpg")

class FilteredImageViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let operationLoad = ImageLoadOperation(url: imageUrl)
    private let filter = FilterOperation(nil)
    
    //MARK: - IB Outlets
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter.addDependency(operationLoad)

        let queue = OperationQueue()
        queue.addOperations([operationLoad, filter], waitUntilFinished: true)
        
        indicator.isHidden = true
    }
    
    //MARK: - IB Actions
    
    @IBAction func downloadButton(_ sender: Any) {
        if operationLoad.isCancelled { return }
        
        indicator.isHidden = false
        indicator.startAnimating()
        
        sleep(2)
        
        imageView.image = operationLoad.outputImage
        
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    @IBAction func filterImageButton() {
        if filter.isCancelled { return }
        
        sleep(2)
        
        imageView.image = filter.outputImage
    }
    
    @IBAction func cancelButton() {
        operationLoad.cancel()
        filter.cancel()
        imageView.image = nil
    }
}
