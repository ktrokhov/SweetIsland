//
//  Stripe.swift
//  SweetIsland
//
//  Created by Kirill on 12.06.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import Foundation
import Stripe
import Alamofire

class StripeClient {
    
    static let sharedClient = StripeClient()
    
    var baseURLString: String? = nil
    
    var baseURL: URL {
        if let urlString = self.baseURLString, let url = URL(string: urlString) {
            return url
        } else {
            fatalError()
        }
    }
    
    func createAndConfirmPayment(_ token: STPToken, amount: Int, completion: @escaping (_ error: Error?) -> Void) {
        
        let url = self.baseURL.appendingPathComponent("charge")
        
        let params: [String : Any] = ["stripeToken" : token.tokenId, "amount" : amount, "description" : Constats.defaultDescription, "currency" : Constats.defaultCurrency]
        
        AF.request(url, method: .post, parameters: params)
            .validate(statusCode: 200..<300)
            .responseData(completionHandler: { (response) in
                
                switch response.result {
                case .success( _):
                    print("Payment successful")
                    completion(nil)
                case .failure(let error):
                    if (response.data?.count)! > 0 {print(error)}
                    completion(error)
                }
            })
    }
}

