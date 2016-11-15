//
//  SecondViewController.swift
//  pset3
//
//  Created by Jill de Ron on 15-11-16.
//  Copyright © 2016 Jill de Ron. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var search: UISearchBar!
    @IBAction func actionButtonSearch(_ sender: Any) {
        requestHTTPS(title: search.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
        }
        
        task.resume()
    }
    
    // Parse JSON to get dictionary. Cited from Eric Aya: http://stackoverflow.com/questions/30480672/how-to-convert-a-json-string-to-a-dictionary
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
