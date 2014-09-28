//
//  MovieDetailViewController.swift
//  RottenTomatoes
//
//  Created by lareguna on 9/26/14.
//  Copyright (c) 2014 Smart Kids Inc. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieHighResImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!

    
    @IBOutlet weak var criticsRating: UILabel!
    
    
    @IBOutlet weak var audienceScore: UILabel!
    
    
    @IBOutlet weak var movieSynopsis: UILabel!
    
    
    @IBOutlet weak var movieCast: UILabel!
    
    var index : Int? = nil  // the index into movies; always set by something else
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
