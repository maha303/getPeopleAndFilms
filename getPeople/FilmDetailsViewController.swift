//
//  FilmDetailsViewController.swift
//  getPeople
//
//  Created by Maha saad on 18/05/1443 AH.
//

import UIKit

class FilmDetailsViewController: UIViewController {
    
    var passedFilm : NSDictionary!
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var director: UILabel!
    
    @IBOutlet weak var openingCrawl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLable.text = passedFilm["title"] as? String
        releaseDate.text = passedFilm["release_date"] as? String
        director.text = passedFilm["director"] as? String
        openingCrawl.text = passedFilm["opening_crawl"] as? String

    }
    
}
