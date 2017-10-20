//
//  APIClient.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 19.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import Alamofire

import UIKit
import Alamofire

class APIClient: NSObject {
    let kServerInformationFileName = "ServerInformations"
    
    var apiKey:String!
    var baseURL: String!
    
    static var sharedInstance:APIClient = {
        return APIClient()
    }()
    
    // MARK: - Initialization -
    
    override init() {
        super.init()
        setupBasicServerInformations()
    }
    
    private func setupBasicServerInformations() {
        if let path = Bundle.main.path(forResource: kServerInformationFileName, ofType: "plist") {
            if let serverData = NSDictionary(contentsOfFile: path) as? [String : AnyObject] {
                baseURL = serverData["baseURL"] as! String
                apiKey = serverData["apiKey"] as! String
            }
        }
    }
    
    // MARK: - Sending Requests -
    
    func sendRequest(request:BaseRequest) {
        guard var fullURL = baseURL else {
            request.failureResponseHandler?(nil, .Unknown)
            return
        }
        
        fullURL.append(request.url)
        request.bodyParams = ["api_key":apiKey]
        
       // if checkIfInternetIsAvailable() {
            Alamofire.request(fullURL, method: request.method, parameters:request.bodyParams, encoding: request.parametersEncoding, headers:nil ).responseJSON { response in
                if response.result.isSuccess {
                    request.successResponseHandler?(response)
                    
                } else if response.result.isFailure {
                    
                    if let urlResponse = response.response, 200...299 ~= urlResponse.statusCode {
                        request.successResponseHandler?(response)
                    } else {
                        request.failureResponseHandler?(response, nil)
                    }
                }
            }
        //} else {
        //    request.failureResponseHandler?(nil, .NoInternetConnection)
        //}
        
    }
    
    // MARK: - Alerts -
    
/*    func checkIfInternetIsAvailable() -> Bool {
        guard let reachability = Reachability() else {
            return false
        }
        return reachability.isReachable
    }*/
    
}
