//
//  DetailViewController.swift
//  CollectionViews
//
//  Created by Abhishek Bhardwaj on 07/01/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var detailImage: UIImage! = nil
    var detailTitleImage: String! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = detailImage
        detailTitle.text = detailTitleImage
        
    }

}
