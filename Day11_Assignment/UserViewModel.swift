//
//  UserViewModel.swift
//  Day11_Assignment
//
//  Created by Rayaheen Mseri on 16/09/1446 AH.
//

import SwiftUI

class UserViewModel: ObservableObject{
    @Published var users : [User] = []
    
    // add user
    func addUser(user : User){
        users.append(user)
    }
    // delete user
    func deleteUser(at indexSet : IndexSet){
        users.remove(atOffsets: indexSet)
    }
    // check if user existing when he  log in
    func checkUser(email: String, password: String) -> Bool {
        // Check if a user with the provided email and password exists
        return users.contains { $0.email == email && $0.password == password }
    }
    
    // check password if strong or not
    func isStrongPassword(password: String) -> Bool {
        // Minimum length for password
        let minLength = 8
        
        // Regular expressions for checking various conditions
        let upperCaseRegex = ".*[A-Z].*"
        let lowerCaseRegex = ".*[a-z].*"
        let digitRegex = ".*[0-9].*"
        let specialCharacterRegex = ".*[!@#$%^&*(),.?\":{}|<>].*"
        
        // Check if the password length is sufficient
        guard password.count >= minLength else {
            print("Password must be at least \(minLength) characters long.")
            return false
        }
        
        // Check for uppercase letter
        guard password.range(of: upperCaseRegex, options: .regularExpression) != nil else {
            print("Password must contain at least one uppercase letter.")
            return false
        }
        
        // Check for lowercase letter
        guard password.range(of: lowerCaseRegex, options: .regularExpression) != nil else {
            print("Password must contain at least one lowercase letter.")
            return false
        }
        
        // Check for a digit
        guard password.range(of: digitRegex, options: .regularExpression) != nil else {
            print("Password must contain at least one digit.")
            return false
        }
        
        // Check for special character
        guard password.range(of: specialCharacterRegex, options: .regularExpression) != nil else {
            print("Password must contain at least one special character.")
            return false
        }
        
        // If all checks pass, return true
        return true
    }

}
