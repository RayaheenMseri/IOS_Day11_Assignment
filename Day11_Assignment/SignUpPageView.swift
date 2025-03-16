//
//  SignUpPageView.swift
//  Day11_Assignment
//
//  Created by Rayaheen Mseri on 16/09/1446 AH.
//
import SwiftUI

struct SignUpPageView: View {
    // State variables for user input fields
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var rememberMe: Bool = false
    @State var isSecurePassword: Bool = false
    @ObservedObject var viewModel: UserViewModel = UserViewModel() // ViewModel to handle user data and validation
    
    var body: some View {
        // Main navigation stack to manage navigation between views
        NavigationStack {
            ZStack {
                // Background color for the entire view
                Color("BeigeColor").ignoresSafeArea(edges: .all)
                
                VStack {
                    // Circle and image section for visual appeal at the top
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.white)
                        
                        Image("pic1.3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .animation(.easeOut(duration: 0.3), value: isSecurePassword) // Smooth animation when scale changes
                            .transition(.scale)
                    }
                    .padding(.top, 10)
                    
                    // Rounded rectangle for the form section
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(.brown.opacity(0.5)) // Background color with some opacity
                            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                        
                        VStack(spacing: 5) {
                            // Title for the page
                            Text("Create Account")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .padding()
                            
                            // Form fields for user inputs (Name, Email, Password, Confirm Password)
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Full Name", text: $name)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                TextField("Email", text: $email)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                // Password input field with toggle visibility
                                ZStack(alignment: .trailing) {
                                    if isSecurePassword {
                                        TextField("Password", text: $password)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    } else {
                                        SecureField("Password", text: $password)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    }
                                    
                                    Button("\(isSecurePassword ? Image(systemName: "eye") : Image(systemName: "eye.slash"))") {
                                        isSecurePassword.toggle() // Toggle the visibility of password
                                    }
                                    .padding(.trailing, 10)
                                }
                                
                                // Confirm password input with similar behavior as password field
                                ZStack(alignment: .trailing) {
                                    if isSecurePassword {
                                        TextField("Confirm Password", text: $confirmPassword)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    } else {
                                        SecureField("Confirm Password", text: $confirmPassword)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    }
                                    
                                    Button("\(isSecurePassword ? Image(systemName: "eye") : Image(systemName: "eye.slash"))") {
                                        isSecurePassword.toggle() // Toggle the visibility of confirm password
                                    }
                                    .padding(.trailing, 10)
                                }
                                
                                // Forgot password link
                                Text("Forget passWord?")
                                    .foregroundColor(Color("BeigeColor"))
                                    .fontWeight(.bold)
                                
                                // "Remember me" checkbox
                                HStack {
                                    Image(systemName: rememberMe ? "checkmark.square" : "square")
                                        .foregroundColor(.white)
                                    Text("Remember me")
                                        .foregroundColor(.white)
                                }
                                .onTapGesture {
                                    rememberMe.toggle() // Toggle remember me checkbox
                                }
                                .padding()
                                
                                // Divider with text "Or"
                                HStack {
                                    Divider()
                                        .frame(width: 150, height: 1)
                                        .background(Color.white)
                                    Text("Or")
                                        .foregroundColor(.white)
                                        .padding()
                                    Divider()
                                        .frame(width: 150, height: 1)
                                        .background(Color.white)
                                }
                                .frame(maxHeight: 30)
                            }
                            
                            // Social media login links (Facebook, Apple, Google)
                            HStack(alignment: .center) {
                                Link(destination: URL(string: "https://www.facebook.com/login.php/")!) {
                                    Image("Facebook")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                                Link(destination: URL(string: "https://support.apple.com/en-sa/111001")!) {
                                    Image("apple")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 65, height: 40)
                                        .padding(.leading)
                                }
                                Link(destination: URL(string: "https://myaccount.google.com/?tab=kk")!) {
                                    Image("google")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 65, height: 25)
                                }
                            }
                            .padding(.bottom, 5)
                            
                            // Sign up button
                            NavigationLink(destination: LogInPageView()) {
                                Text("Sign Up")
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(Capsule().fill(Color("BeigeColor")))
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        // Validate inputs before proceeding
                                        if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                                            return // Return if any field is empty
                                        } else if viewModel.isStrongPassword(password: password) == false {
                                            return // Return if password is not strong
                                        } else if password != confirmPassword {
                                            return // Return if passwords do not match
                                        }
                                        
                                        // Add user to the database via viewModel
                                        viewModel.addUser(user: User(name: name, email: email, password: password))
                                    }
                            }
                            
                            // Already have an account link
                            HStack {
                                Text("Already have an account?")
                                NavigationLink(destination: LogInPageView()) {
                                    Text(" Log In")
                                        .foregroundColor(Color("BeigeColor"))
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SignUpPageView()
}
