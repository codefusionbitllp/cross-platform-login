//
//  LoginView.swift
//  cross-platform-login
//
//  Created by Hitesh Sapra on 15/07/2025.
//
//  © 2025 CodeFusion Bit LLP. All rights reserved.
//  Website: https://www.codefusionbit.com
//

import SwiftUI

struct LoginView: View {
    var onSuccess: () -> Void = {}
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @State var isPasswordVisible = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header Section - Your original beautiful design
                VStack(spacing: 20) {
                    // Logo Icon
                    Image("app-logo", bundle: .module)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 80)
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Sign in to your account")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 60)
                .padding(.bottom, 20)
                
                // Form Section - Your exact styling
                VStack(spacing: 15) {
                    // Email Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        
                        TextField("Enter your email", text: $email)
                            .platformPadding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                    
                    // Password Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("Enter your password", text: $password)
                                    .textContentType(.password)
                            } else {
                                SecureField("Enter your password", text: $password)
                                    .textContentType(.password)
                            }
                            
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(isPasswordVisible ? "ic-eye-hidden" : "ic-eye", bundle: .module)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 18, height: 18)
                                    .padding(.horizontal, isAndroid() ? 8 : 0)
                            }
                        }
                        .platformPadding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    
                    
                    
                    // Forgot Password - Your exact styling
                    HStack {
                        Spacer()
                        Button("Forgot Password?") {
                            print("Forgot password tapped")
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    }
                    
                    // Sign In Button - Your exact design
                    Button(action: signIn) {
                        HStack {
                            if isLoading {
                                Text("Loading...")
                            } else {
                                Text("Sign In")
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .disabled(isLoading || email.isEmpty || password.isEmpty)
                    .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1.0)
                    
                    // Divider Line with "or" - Platform-aligned
                    HStack(alignment: .center) {
                        Rectangle()
                            .fill(Color.secondary.opacity(0.4))
#if os(Android)
                            .frame(height: 1)
#else
                            .frame(height: 1)
#endif
                            .frame(maxWidth: .infinity)
                        
                        Text("or")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.secondary.opacity(0.4))
#if os(Android)
                            .frame(height: 1)
#else
                            .frame(height: 1)
#endif
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 10)
                    
                    
                    // Social Login Buttons - Beautiful custom styling
                    VStack(spacing: 12) {
                        // Apple Login Button
                        Button(action: { handleSocialLogin("Apple") }) {
                            HStack(spacing: 8) {
                                Image("apple-logo", bundle: .module)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                Text("Continue with Apple")
                                    .fontWeight(.medium)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        
                        // Google Login Button
                        Button(action: { handleSocialLogin("Google") }) {
                            HStack(spacing: 8) {
                                Image("google-logo", bundle: .module)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                Text("Continue with Google")
                                    .fontWeight(.medium)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                        }
                    }
                    
                    // Sign Up Link - Your exact styling
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.secondary)
                        Button("Sign Up") {
                            print("Sign up tapped")
                        }
                        .foregroundColor(.blue)
                        .fontWeight(.medium)
                    }
                    .font(.subheadline)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: 50)
            }
        }
        .background(Color.white)
    }
    
    func signIn() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email.contains("@") && password.count >= 6 {
                print("✅ Login successful for: \(email)")
                onSuccess()
            } else {
                print("❌ Invalid credentials")
            }
            isLoading = false
        }
    }
    
    func handleSocialLogin(_ provider: String) {
        print("🔐 \(provider) login tapped")
    }
}


extension View {
    func platformPadding() -> some View {
#if os(Android)
        return self
            .padding(.horizontal, 0)
            .padding(.vertical, 0)
#else
        return self
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
#endif
    }
    
    func isAndroid() -> Bool {
#if os(Android)
        return true
#else
        return false
#endif
    }
}


//#Preview {
//    LoginView()
//}
