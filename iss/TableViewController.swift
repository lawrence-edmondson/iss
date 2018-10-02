//
//  TableViewController.swift
//  iss
//
//  Created by Lawrence Edmondson on 1/23/18.
//  Copyright © 2018 Lawrence Edmondson. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class TableViewController: UITableViewController {
    
    //UI Table elements
    var dataSource:JSON = []

    //Instance variables
    let alamoHelper = AlamoHelper()
    let issEndPoint:String = "http://api.open-notify.org/iss-pass.json"
    var parameters:[String: AnyObject]? = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
         loadTableData loads up the data for table essentially by triggering the getISSLocation call
         - parameter: none
         - returns: void
     */
    func loadTableData() {
            self.getISSLocation{(results,error) in
                if (error != nil) {
                    print("Error with the HTTP request to ISS Endpoint")
                } else {
                    if (results["message"] == "success") {
                        self.dataSource = results["response"]
                        self.renderTableView()
                    } else {
                        print("Error retrieving the results from ISS Endpoint")
                    }
                }
            }
    }
    
    /**
         getISSLocation performs the get request using our AlamoHelper class
         JSON results are returned in a closure
         - parameter: none
         - returns: void
     */
    func getISSLocation(completion:@escaping(JSON, Error?) -> Void) {
            self.alamoHelper.getJSON(self.issEndPoint, parameters: self.parameters, completionHandler: {(results:JSON) ->Void in
                let _:[JSON] = [results]
                completion(results,nil)
            })
    }
    
    /**
         renderTableView renders the results table using a Dispatch queue
         - parameter: none
         - returns: void
     */
    func renderTableView() {
        DispatchQueue.main.async() {
            self.tableView?.reloadData()
        }
    }
    
    //MARK: - Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell:TableCell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)) as? TableCell {
            cell.duration?.text = self.dataSource[indexPath.row]["duration"].stringValue
            
            //format the risetime into a readable date
            let date = NSDate(timeIntervalSince1970: self.dataSource[indexPath.row]["risetime"].double!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd YYYY hh:mm a"
            let dateString = dateFormatter.string(from: date as Date)
            cell.risetime?.text = dateString
            return cell
        } else {
            //an error occured rendering the cells
            let cell:UITableViewCell = UITableViewCell()
            return cell
        }
    }
    
    
}
