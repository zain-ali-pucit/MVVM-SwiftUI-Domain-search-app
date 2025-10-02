//
//  DomainSearchView.swift
//  DomainSearchApp
//
//  Created by Zain Ali on 27/04/2025.
//

import SwiftUI

struct DomainSearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                  
                    Text(viewModel.searchStr.isEmpty ? "Search Domain" : viewModel.searchStr)
                        .font(.largeTitle.bold())
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                    
                    TextField("Enter domain...", text: $viewModel.searchStr)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .onChange(of: viewModel.searchStr) { _ in
                            Task {
                                await viewModel.searchDomains()
                            }
                        }
                    
                    if viewModel.loadingFlag {
                        ProgressView()
                            .padding()
                        Spacer()
                    } else if let error = viewModel.errorMsg {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(viewModel.domainsArray) { domain in
                                    NavigationLink(destination: PurchaseView(domain: domain)) {
                                        HStack {
                                            Text(domain.domain)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                                        .padding(.horizontal)
                                    }
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    DomainSearchView()
}
