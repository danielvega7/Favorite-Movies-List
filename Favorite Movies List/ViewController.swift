//
//  ViewController.swift
//  Favorite Movies List
//
//  Created by Daniel Vega on 10/18/21.
//

import UIKit

class staticVariables {
    static var movies = [String]()
    static var yearMade = [Int]()
    static var selectedMovie = ""
    static var selectedIndex = 0
    
    static var moviesNew = [Movie]()
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var textFieldYearOutlet: UITextField!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        staticVariables.moviesNew.append(Movie(n: "Avengers: Endgame", yM: 2019))
        staticVariables.moviesNew.append(Movie(n: "Cars", yM: 2006))
        staticVariables.moviesNew.append(Movie(n: "Cars2", yM: 2011))
        staticVariables.moviesNew.append(Movie(n: "The Polar Express", yM: 2004))
        staticVariables.moviesNew.append(Movie(n: "Star Wars", yM: 1977))
        
        if let items = UserDefaults.standard.data(forKey: "shoppingList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Movie].self, from: items){
                staticVariables.moviesNew = decoded
               
            }
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticVariables.moviesNew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = "\(staticVariables.moviesNew[indexPath.row].name)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let jamal = tableViewOutlet.cellForRow(at: indexPath)?.textLabel?.text{
            staticVariables.selectedMovie = jamal
            staticVariables.selectedIndex = indexPath.row
                performSegue(withIdentifier: "firstMovieInformation", sender: nil)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            staticVariables.moviesNew.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
        if textFieldOutlet.text == "" || (textFieldYearOutlet.text == "" || Int(textFieldYearOutlet.text!) == nil){
            let alert = UIAlertController(title: "Issue with text field syntax", message: "fix it", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                

            self.present(alert, animated: true)
        }
        
        
        
        
        else{
            
            
            staticVariables.moviesNew.append(Movie(n: "\(textFieldOutlet.text!)", yM: Int(textFieldYearOutlet.text!)!))
           
            tableViewOutlet.reloadData()
            
        
        }
        
    }
   
    @IBAction func saveAction(_ sender: UIButton) {
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(staticVariables.moviesNew) {
            
            UserDefaults.standard.set(encoded, forKey: "shoppingList")
            
        }
    }
    
    
    
    

}

