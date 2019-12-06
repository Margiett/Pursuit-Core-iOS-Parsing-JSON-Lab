//
//  NetworkCallFile.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/5/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation
 
enum NetWorkError: Error {
    case badURL(String)
    case networkClient(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
    case decodingError(Error)
    
}
struct RandomUrlAPI {
    
    static func fetchRandomUser(endpointURLString:String, completion: @escaping (Result<[RandomUserData], NetWorkError>) -> ()) {
       
    
        guard let url = URL(string: endpointURLString) else {
        completion(.failure(.badURL(endpointURLString)))
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClient(error)))
        }
            
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            guard let data = data else {
                           completion(.failure(.noData))
                           return
                       }
            switch urlResponse.statusCode {
            case 200...299: break
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                }
            do {
                let user = try JSONDecoder().decode([RandomUserData].self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.decodingError(error)))
            }
    }
        dataTask.resume()
        
}

}
