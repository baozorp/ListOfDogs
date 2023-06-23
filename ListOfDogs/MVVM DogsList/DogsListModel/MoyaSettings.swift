//
//  MoyaSettings.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import Foundation
import Moya

enum DogService{
    case readAllDogsInfo
    case dogImage(id: Int)
}

extension DogService: TargetType{
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/baozorp/JSON/master")!
    }
    
    var path: String {
        switch self{
        case .readAllDogsInfo:
            return "/Dogs.json"
        case .dogImage(let id):
            return "/\(id).png"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self{
        case .readAllDogsInfo:
            return .requestPlain
        case .dogImage(_):
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return ["Content-Typer":"application/json"]
    }
}
