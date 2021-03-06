//
//  SearchResultsViewController.swift
//  Bookish
//
//  Created by Ashriel Brian Tang on 22/09/2017.
//  Copyright © 2017 Ashriel Brian Tang. All rights reserved.
//

import UIKit
import Material

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifier = "searchResultsCell"
    var nytBookReviews = [NYTBookReview]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbar.isTranslucent = false
        toolbar.barTintColor = Color.yellow.darken1
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nytBookReviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchResultsCustomCell
        
        cell.bookReview = nytBookReviews[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUrl = nytBookReviews[indexPath.row].reviewUrl
        if let selectedUrl = selectedUrl {
            if let url = URL(string: selectedUrl) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    print ("Could not open Url")
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
