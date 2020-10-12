//
//  NetworkManager.swift
//  SpaceImage
//
//  Created by ODM on 10/11/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    //@Published var spacedata = [SpaceData]()
    @Published var spacedata = [SpaceData]()
    
    func fetchData() {
        print("1")
        if let url = URL(string: "https://apodapi.herokuapp.com/api/") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            print("2")
                           //let results =  try decoder.decode(Results.self, from: safeData)
                            let results =  try decoder.decode(SpaceData.self, from: safeData)
                            DispatchQueue.main.async {
                                //self.spacedata = results.allData
                                print("3")
                                self.spacedata = [results]
                                print("from manager \(results)")
                                print("from manager also\(self.spacedata)")
                                
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
