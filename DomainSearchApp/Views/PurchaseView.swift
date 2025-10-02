//
//  PurchaseView.swift
//  DomainSearchApp
//
//  Created by Zain Ali on 27/04/2025.
//

import SwiftUI

struct PurchaseView: View {
    var domain: DomainAPI
    
    @State private var years = 1
    @State private var showSuccess = false
    
    var totalPrice: Int {
        return 100 * years
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(domain.domain)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .padding(.top, 60)
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Text("Registration price")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("$100")
                            .font(.system(size: 36, weight: .bold))
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Years to register")
                            .foregroundColor(.gray)
                        Spacer()
                        HStack(spacing: 10) {
                            Button(action: {
                                if years > 1 { years -= 1 }
                            }) {
                                Image(systemName: "minus.square")
                                    .font(.title2)
                            }
                            
                            Text("\(years) year\(years > 1 ? "s" : "")")
                                .font(.headline)
                            
                            Button(action: {
                                years += 1
                            }) {
                                Image(systemName: "plus.square")
                                    .font(.title2)
                            }
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Domain privacy")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Included")
                            .font(.headline)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("SSL certificate")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Included")
                            .font(.headline)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Total")
                            .font(.title3.bold())
                        Spacer()
                        Text("$\(totalPrice)")
                            .font(.title3.bold())
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        showSuccess = true
                    }) {
                        Text("Purchase domain")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(40)
                            .padding(.horizontal)
                    }
                }
                .padding(.bottom)
            }
            .navigationBarBackButtonHidden(false)
            .sheet(isPresented: $showSuccess) {
                SuccessView()
            }
        }
    }
}

struct SuccessView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Purchase Successful!")
                .font(.title.bold())
            
            Text("Thank you for purchasing your domain.")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
