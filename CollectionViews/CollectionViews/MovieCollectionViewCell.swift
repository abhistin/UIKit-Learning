//
//  MovieCollectionViewCell.swift
//  CollectionViews
//
//  Created by Abhishek Bhardwaj on 07/01/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(movies: Movie) -> Void {
        movieImageView.image = movies.image
        titleLabel.text = movies.title
    }
}
