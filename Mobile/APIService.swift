//
//  APIService.swift
//  Sahil-5thDec25
//
//  Created by Pallavi on 05/12/25.
//

import Foundation


class APIService {
    
    static let shared = APIService()
    private init () {}
    func fetchDeviceList(completion: @escaping(Result<[DeviceList], Error>) -> Void) {
        guard let url = URL(string: "https://api.restful-api.dev/objects") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            print("data : \(data)")
            do {
                let deviceLists = try JSONDecoder().decode([DeviceList].self, from: data)
                print("deviceLists : \(deviceLists)")
                completion(.success(deviceLists))
            }
            catch {
                completion(.failure(error))
            }
        } .resume()
    }
    
    func fetchDeviceDetails(id: Int, completion: @escaping(Result<DeviceDetails, Error>) -> Void)
        {
            guard let url = URL(string: "https://api.restful-api.dev/objects/\(id)") else {return}
            print("fetchDeviceDetails : \(url)")
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                print("data 1 : \(data)")
                do {
                    let deviceDetails = try JSONDecoder().decode(DeviceDetails.self, from: data)
                    print("deviceDetails : \(deviceDetails)")
                    completion(.success(deviceDetails))
                }
                catch {
                    completion(.failure(error))
                }
            } .resume()
        }
    
    
    func deleteDevice(id: Int, completion: @escaping(Result<DeviceDetails, Error>) -> Void) {
            guard let url = URL(string: "https://api.restful-api.dev/objects/\(id)") else {return}
            print("fetchDeviceDetails : \(url)")
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                print("data 1 : \(data)")
                do {
                    let deviceDetails = try JSONDecoder().decode(DeviceDetails.self, from: data)
                    print("deviceDetails : \(deviceDetails)")
                    completion(.success(deviceDetails))
                }
                catch {
                    completion(.failure(error))
                }
            } .resume()
        }
    }
