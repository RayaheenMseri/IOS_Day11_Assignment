//
//  LogInPageView.swift
//  Day11_Assignment
//
//  Created by Rayaheen Mseri on 16/09/1446 AH.
//
import SwiftUI

struct LogInPageView: View {
    @State var email: String = ""  // State variable to store email input
    @State var password: String = ""  // State variable to store password input
    @State var rememberMe: Bool = false  // State for "Remember Me" checkbox
    @State var isSecurePassword: Bool = false  // State to toggle password visibility
    @ObservedObject var viewModel: UserViewModel = UserViewModel() // View model for checking user

    var body: some View {
        NavigationStack { // NavigationStack to support navigation to other views
            ZStack {
                // Background color for the whole screen
                Color("BeigeColor").ignoresSafeArea(edges: .all)
                
                VStack {
                    // ZStack to overlay a circle and image
                    ZStack {
                        Circle()
                            .frame(width: 150, height: 150) // Circle size
                            .foregroundColor(Color.white) // Circle color
                        
                        Image("pic1.2") // Image inside the circle
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250) // Image size
                            .animation(.easeOut(duration: 0.3), value: isSecurePassword) // Smooth animation when scale changes
                            .transition(.scale) // Animated transition for the image
                    }
                    .padding(.bottom, 10) // Add padding below the circle
                    
                    // ZStack for the main login section
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea() // Fill the screen with a rectangle
                            .foregroundColor(.brown.opacity(0.5)) // Background color
                            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous) // Rounded corners for the background
                                .path(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
                        
                        // VStack to arrange elements vertically
                        VStack(spacing: 10) {
                            Text("Welcome Back!") // Welcome message
                                .font(.system(size: 30, weight: .bold, design: .default)) // Text styling
                                .padding()
                            
                            // Input fields for email and password
                            VStack(alignment: .leading, spacing: 10) {
                                // Email input field
                                TextField("Email", text: $email)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.white.opacity(0.7)) // Background color
                                    .cornerRadius(10) // Rounded corners
                                
                                // Password input field with secure toggle
                                ZStack(alignment: .trailing) {
                                    if isSecurePassword {
                                        // Show text field if password is not secure
                                        TextField("Password", text: $password)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    } else {
                                        // Show secure field for password
                                        SecureField("Password", text: $password)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.white.opacity(0.7))
                                            .cornerRadius(10)
                                    }
                                    
                                    // Button to toggle password visibility
                                    Button("\(isSecurePassword ? Image(systemName: "eye") : Image(systemName: "eye.slash"))") {
                                        isSecurePassword.toggle() // Toggle the password visibility
                                    }
                                    .padding(.trailing, 10)
                                }

                                // "Forgot password" link
                                Text("Forget passWord?")
                                    .foregroundColor(Color("BeigeColor"))
                                    .fontWeight(.bold)
                                    
                                // "Remember me" checkbox
                                HStack {
                                    Image(systemName: rememberMe ? "checkmark.square" : "square") // Checkbox icon
                                        .foregroundColor(.white)
                                    Text("Remember me") // Text for the checkbox
                                        .foregroundColor(.white)
                                }
                                .onTapGesture {
                                    rememberMe.toggle() // Toggle "Remember Me" state
                                }
                                .padding()

                                // Divider with "Or" in between
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

                            }

                            // Social media login buttons (Facebook, Apple, Google)
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
                            .padding(.bottom, 5) // Padding for the social login buttons

                            // Log In button
                            NavigationLink(destination: SignUpPageView()) {
                                Text("Log In")
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(Capsule().fill(Color("BeigeColor")))
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        // Check user credentials before proceeding
                                        if !viewModel.checkUser(email: email, password: password) {
                                            return // If the user is not found, return early
                                        }
                                    }
                            }

                            // Link to the Sign Up page for users without an account
                            HStack {
                                Text("Don't have an account?")
                                NavigationLink(destination: SignUpPageView()) {
                                    Text(" Sign Up")
                                        .foregroundColor(Color("BeigeColor"))
                                }
                            }
                            .padding()
                        }
                        .padding() // Padding around the VStack to ensure proper spacing
                    }
                }
            }
        }
    }
}

#Preview {
    LogInPageView() // Preview of the LogInPageView
}
