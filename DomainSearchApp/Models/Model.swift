//
//  Model.swift
//  DomainSearchApp
//
//  Created by Zain Ali on 27/04/2025.
//

import Foundation

struct DomainResponse: Codable {
    let domains: [DomainAPI]
}

struct DomainAPI: Codable, Identifiable {
    var id: String { domain }
    let domain: String
    let isDead: String
    var availabilityFlag: Bool
    {
        isDead.lowercased() == "true"
    }
}
