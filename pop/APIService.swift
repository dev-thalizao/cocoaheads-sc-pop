//
//  APIService.swift
//  pop
//
//  Created by Thales Frigo on 12/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case failed
}

struct APIService {
    
    typealias Handler = (Outcome) -> Void
    
    func login(username: String, password: String, completion: @escaping Handler) {
        if username == "admin" && password == "admin" {
            completion(.success)
        } else {
            completion(.failure(APIServiceError.failed))
        }
    }
    
    func getTalks(completion: ([Talk]) -> Void) {
        completion([.xcodeBugs, .firebase, .venice, .pop, .architecture])
    }
}
