//
//  AlamoHelper.swift
//  iss
//
//  Created by Lawrence Edmondson on 1/23/18.
//  Copyright © 2018 Lawrence Edmondson. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


open class AlamoHelper {
    
    /**
         getJSON gets a JSON string by posting the given url and parameters to Alamofire
         - parameter url : the url to issue the request to
         - parameter parameters: an array of parameters which will get url encoded by Alamofire
         - parameter completionHandler: a completion handler to call once done
         - returns: void
     */

    func getJSON (_ url:String, parameters: [String: AnyObject]?, completionHandler:@escaping (JSON)-> Void) {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        manager.request(url, parameters: parameters).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let dataSource = JSON(value)
                    //print("dataSource: \(dataSource)")
                    completionHandler(dataSource)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
