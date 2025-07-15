//
//  RootViewRouter.swift
//  cross-platform-login
//
//  Created by Hitesh Sapra on 15/07/2025.
//
//  © 2025 CodeFusion Bit LLP. All rights reserved.
//  Website: https://www.codefusionbit.com
//


import SwiftUI


struct RootViewRouter: View {
    @State var isLoggedIn = false
    @State var path: [AppRoute] = []
    
    var body: some View {
        if isLoggedIn {
            NavigationStack(path: $path) {
                ContentView(logout: {
                    isLoggedIn = false
                    path = [] // Clear all navigation
                })
                .navigationBarBackButtonHidden(true) // ✅ no back arrow
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .login:
                        LoginView {
                            isLoggedIn = true
                        }
                    case .main:
                        ContentView(logout: {
                            isLoggedIn = false
                            path = []
                        })
                    }
                }
            }
        } else {
            LoginView {
                isLoggedIn = true
            }
        }
    }
}
