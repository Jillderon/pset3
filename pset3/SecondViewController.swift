//
//  SecondViewController.swift
//  pset3
//
//  Created by Jill de Ron on 15-11-16.
//  Copyright © 2016 Jill de Ron. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // make an array and dictionary with the movie titles and moviedescriptions added to watchlist
    var movietitles = [String]()
    var moviedescriptions = [String: String]()
    
    // remembers the movies in the watchlist after closing app
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tableviewWatchlist: UITableView!
    @IBOutlet weak var search: UISearchBar!
    
    // Make a HTTPS request. Cited from: Code Different (http://stackoverflow.com/questions/38292793/http-requests-in-swift-3)
    func requestHTTPS(title: String){
        let newTitle = title.components(separatedBy: " ").joined(separator: "+")
        let url = URL(string: "https://omdbapi.com/?t="+newTitle+"&yplot=short&r=json")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                // pas aan met een alert voor de user
                print(error!)
                return
            }
            guard let data = data else {
                // pas aan met een alert voor de user
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
            
            // add movies to array
            self.movietitles.append(json["Title"] as! String)
            self.moviedescriptions[json["Title"] as! String] = json["Plot"] as? String
            
        }
        task.resume()
        // Reload view after adding movie
        tableviewWatchlist.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaults.set(movietitles, forKey: "Title")
        defaults.set(moviedescriptions, forKey: "Plot")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movietitles.count
    }
    
    // Reuse the cells in table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomMovieCell
        cell.nameMovie.text = movietitles[indexPath.row]
        
        if let description = moviedescriptions[movietitles[indexPath.row]] {
            cell.descriptionMovie.text = description
        } else {
            cell.descriptionMovie.text = ""
        }
        
        return cell
        
    }
    
    // request information after add is clicked
    @IBAction func addToWatchlist(_ sender: Any) {
            requestHTTPS(title: search.text!)
    }

    // send information to third view controller after the movie is clicked
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdVC = segue.destination as! ThirdViewController
        thirdVC.data = self.movietitles[self.tableviewWatchlist.indexPathForSelectedRow!.row]
        thirdVC.datatitle = self.moviedescriptions[self.movietitles[self.tableviewWatchlist.indexPathForSelectedRow!.row]]!
    }
        
}


