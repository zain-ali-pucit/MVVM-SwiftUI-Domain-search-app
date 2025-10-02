//
//  LaunchView.swift
//  DomainSearchApp
//
//  Created by Zain Ali on 27/04/2025.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color(.systemGray)
                .ignoresSafeArea()
            
            Text("Search for a domain...")
                .foregroundColor(.gray)
                .font(.title2)
                .opacity(0.7)
        }
    }
}

#Preview {
    LaunchView()
}
