//
//  DetailViewController.swift
//  Project1
//
//  Created by Vigneshkumar G on 13/03/19.
//  Copyright © 2019 viki. All rights reserved.
//

import UIKit

struct DetailModel {
    let index: Int
    let total: Int
    let selectedImage: String
    
    var title: String
    {
        return "Picture \(index) of \(total)"
    }
}

class DetailViewController: UIViewController {
   
    var selectedModel: DetailModel?
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = selectedModel?.selectedImage {
            imageView.image = UIImage(named: model)
        }
        imageView.clipsToBounds = true
        title = selectedModel?.title ?? "View Picture"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
