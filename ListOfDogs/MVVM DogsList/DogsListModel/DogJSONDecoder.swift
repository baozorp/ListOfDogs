//
//  DogJSONDecoder.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

struct DogJsonDecoder: Decodable{
    let id: Int
    let name: String
    let description: String
    let age: Int
    let image: String
}
