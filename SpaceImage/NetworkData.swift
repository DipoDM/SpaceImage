//
//  NetworkData.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import Foundation

protocol NetworkDataDelegate {
    func didGetData(_ marsManager:NetworkData, marsModel: DataModel)
    func didFailWithError(error: Error)
}

struct NetworkData{
    let baseURL = "https://apodapi.herokuapp.com/api/"
    var delegate: NetworkDataDelegate?
    
    func getRoverUrl(){
        let urlString = "\(baseURL)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let roverData = self.parseJSON(safeData){
                        self.delegate?.didGetData(self, marsModel: roverData)
                }
            }
        }
        task.resume()
    }
}
    
    
    
    func parseJSON(_ nasaData: Data) -> DataModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(SpaceData.self, from: nasaData)
            let title = decodedData.title
            let description = decodedData.description
            let hdImage = decodedData.hdurl
            let date = decodedData.date
            let image = decodedData.url
            let copy_right = decodedData.copyright
            
            let marsAll = DataModel(title: title,
                                    description: description,
                                    hdImage: hdImage,
                                    image: image,
                                    date: date,
                                    copy_right: copy_right
            )
            print(marsAll)
            return marsAll
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
