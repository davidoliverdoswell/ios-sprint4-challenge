//
//  MyMoviesCell.swift
//  MyMovies
//
//  Created by David Doswell on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMoviesCell: UITableViewCell {

    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var myMovieLabel: UILabel!
    @IBOutlet weak var myMovieButton: UIButton!
    
    private func updateViews() {
        guard let movie = movie else { return }
        
        myMovieLabel.text = movie.title
        
    }
    
    @IBAction func hasWatchedMyMovie(_ sender: Any) {
        if myMovieButton.isSelected {
            let hasNotWatched = "Not Watched"
            let hasWatched = "Watched"
            myMovieButton.setTitle(hasNotWatched ?? hasWatched, for: .normal)
        }
        
    }

}
