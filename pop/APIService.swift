//
//  APIService.swift
//  pop
//
//  Created by Thales Frigo on 12/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation

struct APIService {
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        if username == "admin" && password == "admin" {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func getTalks(completion: ([Talk]) -> Void) {
        completion([.xcodeBugs, .firebase, .venice, .pop, .architecture])
    }
}
