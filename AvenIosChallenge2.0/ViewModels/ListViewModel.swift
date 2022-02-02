//
//  ListViewModel.swift
//
//
//  Created by Brandon Anzalone on 2/1/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var organizations = [Organization]()
    
    init() {
        downloadData()
    }

    func downloadData() {
        guard let url = URL(string: "https://api.github.com/organizations") else {
            print("Invalid URL for JSON data")
            return
        }
        
        weak var weakSelf = self
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
        
            let httpsResponse = response as? HTTPURLResponse
            if httpsResponse!.statusCode != 200 {
                print("HTTP Error: status code \(httpsResponse!.statusCode)")
            } else if (data == nil && error != nil) {
                print("No data downloaded")
            } else {
                do {
                  
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                       print("Response data string:\n \(dataString)")
                    }
                    
                    var decodedArray = try JSONDecoder().decode([Organization].self, from: data!)
                    decodedArray.sort {
                        return $0.name < $1.name
                    }
                    
                    DispatchQueue.main.async {
                        weakSelf!.organizations = decodedArray
                    }
                } catch {
                    print("Unable to decode JSON data")
                }
            }
        }.resume()
        
    }
}
extension ListViewModel {
    static func all() -> [Organization] {
        return [
            Organization(name: "errfree",avatar: "",description:"", url: "",id: 44,node_id: "", repos_url: "",events_url: "",hooks_url: "",issues_url: "", members_url: "",public_members_url: ""),
            Organization(name: "errfree",avatar: "",description:"", url: "",id: 44,node_id: "", repos_url: "",events_url: "",hooks_url: "",issues_url: "", members_url: "",public_members_url: ""),
            Organization(name: "errfree",avatar: "",description:"", url: "",id: 44,node_id: "", repos_url: "",events_url: "",hooks_url: "",issues_url: "", members_url: "",public_members_url: "")
        ]
    }
}
