//
//  Dog.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import SwiftUI

class Dog: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let description: String
    let age: Int
    @Published var image = UIImage()
    
    init(id: Int, name: String, description: String, age: Int, image: UIImage = UIImage()) {
        self.id = id
        self.name = name
        self.description = description
        self.age = age
        self.image = image
    }
}
