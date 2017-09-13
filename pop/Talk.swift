//
//  Talk.swift
//  pop
//
//  Created by Thales Frigo on 12/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation

struct Talk {
    let name: String
    let speaker: String
    let available: Bool
}

extension Talk {
    static let xcodeBugs = Talk(name: "Xcode + bugs, como encontrar? ",
                                speaker: "Denis Oliveira - Beblue",
                                available: true)
    
    static let firebase = Talk(name: "iOS Apps Serverless com Firebase",
                               speaker: "Paulo Hecht - Tech Fit",
                               available: true)
    
    static let venice = Talk(name: "Co-rotinas com Venice",
                             speaker: "Ronaldo Faria Lima - Nineteen",
                             available: false)
    
    static let pop = Talk(name: "POP - Programação Orientada a Protocolo",
                          speaker: "Thales Frigo - Tech Fit ",
                          available: true)
    
    static let architecture = Talk(name: "Arquitetura e Qualidade de Software Mobile",
                                   speaker: "Eduardo Lourenço - Token Lab",
                                   available: true)
}

