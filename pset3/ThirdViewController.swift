//
//  ThirdViewController.swift
//  pset3
//
//  Created by Jill de Ron on 15-11-16.
//  Copyright © 2016 Jill de Ron. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var data = String()
    var datatitle = String()

    @IBOutlet weak var displayDescription: UITextView!
    @IBOutlet weak var displayTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayTitle.text = data
        displayDescription.text = datatitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
