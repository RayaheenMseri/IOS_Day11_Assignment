//
//  User.swift
//  Day11_Assignment
//
//  Created by Rayaheen Mseri on 16/09/1446 AH.
//
import SwiftUI

struct User: Identifiable , Equatable{
    let id: UUID = UUID()
    var name: String
    var email: String
    var password: String
}
