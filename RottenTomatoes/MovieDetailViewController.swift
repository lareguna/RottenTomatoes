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
    
    var movieID: String? = ""
    var index : Int? = 0  // the index into movies; always set by something else
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var apiKey: String = "et5rj7cxytpx9e5faamzxmmv"
        
        var url: String = "http://api.rottentomatoes.com/api/public/v1.0/movies/" + movieID!+".json?apikey=" + apiKey
        var request = NSURLRequest(URL: NSURL(string: url))
        
        println("In detailedMovie Controller movieID \(movieID)")
        println("In detailedMovie Controller index \(index)")
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
            println("object: \(object)")
            self.title = object["title"] as? String
            self.movieName.text = self.title
            println("movie title \(self.title)")
            self.movieSynopsis.text = object["synopsis"] as? String
            
            // setup ratings
            var ratings = object["ratings"] as NSDictionary
            println("ratings: \(ratings)")

            //self.criticsRating.text = ratings["critcs_rating"] as? Int
            self.audienceScore.text = ratings["audience_score"] as? String
        
            
            //self.tableView.reloadData()
        }
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
