//
//  BaseRequest.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 19.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest<T:Any>: NSObject {
    
    var url:String!
    var bodyParams:[String:Any]! = [:]
    var method:HTTPMethod! = .get
    var parametersEncoding:Alamofire.ParameterEncoding! = URLEncoding.queryString
    var keyPath:String?
    
    var successResponseHandler:((DataResponse<T>) -> Void)?
    var failureResponseHandler:((DataResponse<T>?, _ errorCode:APIErrorCode?) -> Void)?
}
