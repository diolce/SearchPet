//
//  ApiManager.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import Foundation
import UIKit

class ApiManager {
    private let baseURL:String
    private let session:URLSession
    
    private init(session:URLSession = URLSession(configuration: .default), bUrl:String = "api.petfinder.com") {
        self.baseURL = bUrl
        self.session = session
    }
    static let shared = ApiManager()
    
    func getCredentials(completion: @escaping (Result<CredentialResponse,Error>)-> Void) {
        self.apiRequest(request: AuthorizationRequest(baseUrl: self.baseURL), completion: completion)
    }

    func getAnimals(city:String? = nil,nextLinkPagination: String? = nil,type:String? = nil,completion: @escaping (Result<DataReponse,Error>)-> Void) {
        let animalsRequest = AnimalsRequest(baseUrl: self.baseURL, city: city,nextLinkPagination: nextLinkPagination,type:type, authorization: ["Authorization": self.getAuthorizationHeader() ?? ""])
        self.apiRequest(request:animalsRequest,completion: completion)
    }
    
    func getDetailAnimal(id:Int,completion: @escaping (Result<DetailAnimal,Error>)-> Void) {
        let animalsRequest = AnimalRequest(baseUrl: self.baseURL, id: id, authorization: ["Authorization": self.getAuthorizationHeader() ?? ""])
        self.apiRequest(request:animalsRequest,completion: completion)
    }
    
    func getOrganizations(latlong:String? = nil,nextLinkPagination:String? = nil,completion: @escaping (Result<DataOrganizations,Error>)-> Void) {
        let organizationsRequest = OrganizationsRequest(baseUrl: self.baseURL, latlong: latlong, nextLinkPagination: nextLinkPagination, authorization: ["Authorization": self.getAuthorizationHeader() ?? ""])
        self.apiRequest(request: organizationsRequest,completion: completion) 
    }
    
    private func getAuthorizationHeader() -> String? {
        var authorization:String?
        let results = RealmService.shared.query(type: CredentialResponse.self, query: "token_type = 'Bearer'")
        if results.count != 0 {
            let credentials =  results[0]
            authorization = "\(credentials.token_type) \(credentials.access_token)"
        }
        return authorization
    }
    
    private func apiRequest<T: Decodable, I: APIRequest>(request: I, completion: @escaping (Result<T, Error>)-> Void){
        print(request.urlRequest!)
        let task = session.dataTask(with: request.urlRequest!) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                    let decodeResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodeResponse))
                } catch let parseError {
                    print("JSON Error \(parseError.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
    
