//
//  Networking.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

protocol NetworkingProtocol {
    func getModel(type: MenuModel, closure: @escaping ([Hits]) -> ())
}

class Networking: NetworkingProtocol {
    func getModel(type: MenuModel, closure: @escaping ([Hits]) -> ()) {
        
        guard let url = URL(string:
        "https://edamam-recipe-search.p.rapidapi.com/search?q=\(type.partURL)") else {
            return
        }
        
        let request = createURLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            if let response {
                print(response)
            }
            
            if let data {
                print(data)
            }
            
            let decoder = JSONDecoder()
            do {
                if let data {
                    let menu = try decoder.decode(FoodMenu.self, from: data)
                    print(menu)
                    DispatchQueue.main.async {
                        closure(menu.hits)
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    static func loadAsyncImage(url: URL, closure: @escaping (Data, URLResponse) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("error")
                return
            }
            
            guard let data, let response else {
                return
            }
            
            guard let responseURL = response.url else {
                return
            }
            
            guard url == responseURL else {
                return
            }
            
            closure(data, response)
        }.resume()
    }
    
    private func createURLRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        let headers = [
            "X-RapidAPI-Key": "d48b37f797msh914f92f5efbf2b8p18795ejsn2d67a777e5d2",
            "X-RapidAPI-Host": "edamam-recipe-search.p.rapidapi.com"
        ]
        request.allHTTPHeaderFields = headers
        return request
    }
}
