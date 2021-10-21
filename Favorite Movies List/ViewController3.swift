//
//  ViewController3.swift
//  Favorite Movies List
//
//  Created by DANIEL VEGA on 10/20/21.
//

import UIKit

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticVariables.moviesNew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = staticVariables.moviesNew[indexPath.row].name
        return cell
    }

    @IBAction func itemInfoAction(_ sender: UIButton) {
        
    performSegue(withIdentifier: "infoModal", sender: nil)
        
    }
    


}
