//
//  Network.swift
//  ApiDataInTableViewPractice
//
//  Created by Srikanth Kyatham on 12/3/24.
//
import Foundation

class Network: @unchecked Sendable {
    static let sharedInstance = Network()
    private init() {}
    
    func getData(url: String, completion: @escaping ( ([PersonModel]?) -> Void)) {
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                print("Error \(error?.localizedDescription ?? "")")
                completion(nil)
                return
            }
            do {
                let recievedData = try JSONDecoder().decode([PersonModel].self, from: data)
                completion(recievedData)
                print(recievedData)
            } catch {
                print("Cannot decode JSON Data in to PersonModel")
            }
        }.resume()
        
    }
}
