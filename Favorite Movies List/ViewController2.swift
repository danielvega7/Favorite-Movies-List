//
//  ViewController2.swift
//  Favorite Movies List
//
//  Created by Daniel Vega on 10/18/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var movieLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        movieLabelOutlet.text = "movie: \(staticVariables.selectedMovie)"
        
    }
    

}