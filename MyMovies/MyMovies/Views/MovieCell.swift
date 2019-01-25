//
//  MovieCell.swift
//  MyMovies
//
//  Created by David Doswell on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieButton: UIButton!
    
    @IBAction func addMovie(_ sender: Any) {
        let moc = CoreDataStack.shared.mainContext
        
        guard let movie = movie else { return }
        movieTitle.text = movie.title
        
        do {
            try moc.save()
        } catch {
            NSLog("Could not save movie: \(error)")
        }
    }
    

}
