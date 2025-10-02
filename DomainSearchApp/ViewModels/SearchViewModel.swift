//
//  SearchViewModel.swift
//  DomainSearchApp
//
//  Created by Zain Ali on 27/04/2025.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchStr: String = ""
    @Published var loadingFlag: Bool = false
    @Published var domainsArray: [DomainAPI] = []
    @Published var errorMsg: String? = nil
    
    func searchDomains() async {
        guard searchStr.count >= 3 else {
            domainsArray = []
            errorMsg = "Please enter at least 3 characters."
            return
        }
        
        loadingFlag = true
        errorMsg = nil
        
        let query = searchStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? searchStr
        let urlStr = BASE_URL + "\(query)&zone=com"
        print("urlStr", urlStr)
        guard let url = URL(string: urlStr) else {
            errorMsg = "Please enter a valid URL."
            loadingFlag = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(DomainResponse.self, from: data)
            
            if decodedResponse.domains.isEmpty {
                errorMsg = "No domain found."
            }
            domainsArray = decodedResponse.domains
        } catch {
            errorMsg = "Something went wrong. Please try again."
        }
        
        loadingFlag = false
    }
}

