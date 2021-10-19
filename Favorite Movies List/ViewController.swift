//
//  ViewController.swift
//  Favorite Movies List
//
//  Created by Daniel Vega on 10/18/21.
//

import UIKit

class staticVariables {
    static var movies = [String]()
    static var selectedMovie = ""
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        staticVariables.movies.append("Avengers: Endgame")
        staticVariables.movies.append("Cars")
        staticVariables.movies.append("Cars 2")
        staticVariables.movies.append("The Polar Express")
        staticVariables.movies.append("Star Wars")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticVariables.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = "\(staticVariables.movies[indexPath.row])"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let jamal = tableViewOutlet.cellForRow(at: indexPath)?.textLabel?.text{
            staticVariables.selectedMovie = jamal
            
                performSegue(withIdentifier: "firstMovieInformation", sender: nil)
            
        }
        
    }

}

