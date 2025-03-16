//
//  ContentView.swift
//  Day11_Assignment
//
//  Created by Rayaheen Mseri on 16/09/1446 AH.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack { // Wrap the view in a NavigationStack for navigation support
            ZStack {
                // Background color for the view
                Color("BeigeColor").ignoresSafeArea(edges: .all)
                
                VStack {
                    // Spacer to push the circle and image up
                    Spacer().frame(height: 50)

                    // ZStack to overlay the circle and image
                    ZStack {
                        Circle() // Draw a circle
                            .frame(width: 200, height: 200) // Set circle size
                            .foregroundColor(Color.white) // Set the color of the circle
                        
                        // Image inside the circle
                        Image("pic1.1")
                            .resizable() // Make the image resizable
                            .scaledToFit() // Maintain image aspect ratio
                            .frame(width: 300, height: 300) // Set the image size
                            .transition(.scale.animation(.easeOut)) // Animate the image with a scale effect
                    }
                    .padding(.bottom, 40) // Add padding below the ZStack to create space

                    // VStack for the text and buttons below the circle and image
                    VStack(spacing: 20) {
                        Text("Welcome To")
                            .font(.system(size: 30, weight: .bold, design: .default)) // Style for welcome text
                        
                        Text("My start the journey to a healthy life!")
                            .padding(.bottom, 40) // Add space below the text
                        
                        // NavigationLink for Sign Up button
                        NavigationLink(destination: SignUpPageView()) {
                            Text("Sign Up")
                                .padding(.vertical, 10) // Vertical padding inside the button
                                .frame(maxWidth: .infinity) // Make the button take full width
                                .background(Capsule().stroke(.brown, lineWidth: 3)) // Styling with capsule shape and border
                                .foregroundColor(.black) // Set text color
                        }
                        
                        // NavigationLink for Log In button
                        NavigationLink(destination: LogInPageView()) {
                            Text("Log in")
                                .padding(.vertical, 10) // Vertical padding inside the button
                                .frame(maxWidth: .infinity) // Make the button take full width
                                .background(.brown) // Set background color
                                .cornerRadius(20) // Rounded corners
                                .foregroundColor(.white) // Set text color to white
                        }
                    }
                    .padding() // Add padding around the VStack to ensure proper spacing
                    
                    Spacer() // Add space at the bottom to avoid items being stuck to the screen's edge
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
