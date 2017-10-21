//
//  BaseRequest.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 19.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest<T:Any>: NSObject {
    
    var url:String!
    var bodyParams:[String:Any]! = [:]
    var method:HTTPMethod! = .get
    var parametersEncoding:Alamofire.ParameterEncoding! = URLEncoding.default
    
    // Some of the requests has default responseHandlers
    var successResponseHandler:((DataResponse<T>) -> Void)?
    var failureResponseHandler:((DataResponse<T>?, _ errorCode:APIErrorCode?) -> Void)?
    
    var type = Posts.self
}
