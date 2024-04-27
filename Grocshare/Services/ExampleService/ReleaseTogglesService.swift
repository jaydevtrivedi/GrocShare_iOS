//
//  ReleaseTogglesService.swift
//  Grocshare
//
//  Created by Jaydev Trivedi on 16/3/2024.
//

import Foundation

class ReleaseTogglesService {
    
    let releaseTogglesUrl = "https://s3.ap-southeast-2.amazonaws.com/www.jaydevtrivedi.com/releasetoggles.json"
    
    func getReleaseToggles(completion: @escaping (ReleaseToggles?) -> Void) {
        guard let url = URL(string: releaseTogglesUrl) else {
            print("Error: Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let releaseToggles = try JSONDecoder().decode(ReleaseToggles.self, from: data)
                print("Release Toggles: \(releaseToggles)")
                completion(releaseToggles)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }}
