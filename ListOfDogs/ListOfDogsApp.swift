//
//  ListOfDogsApp.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//


import SwiftUI

@main
struct TestDogApp: App {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn{
                DogsListView()
            }
            else{
                LoginView()
            }
            
        }
    }
}
