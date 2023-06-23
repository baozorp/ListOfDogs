//
//  DogMoya.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import SwiftUI
import Moya

protocol DogMoyaProtocol{
    var dogProvider: MoyaProvider<DogService> { get }
    func getDogInfo(comletion: @escaping(Dog)->Void)
}

class DogMoya: DogMoyaProtocol{
    
    let dogProvider = MoyaProvider<DogService>()
    
    func getDogInfo(comletion: @escaping(Dog)->Void) {
        let dogProvider = self.dogProvider
        let dispatchQueue = DispatchQueue(label: "Load info")
        dispatchQueue.async {
            dogProvider.request(.readAllDogsInfo) { result in
                switch result {
                case .success(let response):
                    do {
                        let response = try JSONDecoder().decode([DogJsonDecoder].self, from: response.data)
                        let receivedDogs = response.map { dogInfo in
                            Dog(id: dogInfo.id, name: dogInfo.name, description: dogInfo.description, age: dogInfo.age, image: UIImage())
                        }
                        let dogs = receivedDogs
                        for index in 0..<dogs.count {
                            let dog = dogs[index]
                            dogProvider.request(.dogImage(id: dog.id)) { result in
                                switch result {
                                case .success(let response):
                                    let image = UIImage(data: response.data) ?? UIImage()
                                    dog.image = image
                                    DispatchQueue.main.async {
                                        comletion(dog)
                                    }
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}
