//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by lareguna on 9/21/14.
//  Copyright (c) 2014 Smart Kids Inc. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This causes you to register for all the tableView events.
        tableView.delegate = self
        
        tableView.dataSource = self

        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=et5rj7cxytpx9e5faamzxmmv&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
    
            self.movies = object["movies"] as [NSDictionary]
            println("\(self.movies.count)")
            println("object: \(object)")
            self.tableView.reloadData()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("I'm at row: \(indexPath.row), section  \(indexPath.section)")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
      
        var movie = movies[indexPath.row]
        
        cell.movieTitleLabel.text = movie["title"] as?  String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        
        var posters = movie["posters"] as NSDictionary
        var posterUrl = posters["thumbnail"] as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        

        
        
  //      cell.textLabel!.text = "Hello I'm at row: \(indexPath.row), section  \(indexPath.section)"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    */
      override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if segue.identifier == "Detail Segue" {
                var row = self.tableView.indexPathForSelectedRow()?.row
                var detail = segue.destinationViewController as MovieDetailViewController
                detail.index = row
                println("Seque to \(detail.title), setting index to \(row)")
            }
        }

}
