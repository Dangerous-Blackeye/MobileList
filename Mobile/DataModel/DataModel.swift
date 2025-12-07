//
//  DataModel.swift
//  Sahil-5thDec25
//
//  Created by Pallavi on 05/12/25.
//

import Foundation


class DataModel {
    
    var deviceList: [DeviceList] = []
    var deviceDetails: DeviceDetails?
    var ondataUpdated : (() -> Void)?
    var onerror : ((String) -> Void)?
    
    
    func dataModelDeviceList() {
        APIService.shared.fetchDeviceList { result in
            switch result {
            case .success(let deviceList) :
                self.deviceList = deviceList
                self.ondataUpdated?()
            case .failure(let error) :
                print("error.localizedDescription : \(error.localizedDescription)")
                self.onerror?(error.localizedDescription)
            }
        }
    }
    
    func dataModelDeviceDetails(id : Int) {
        APIService.shared.fetchDeviceDetails(id: id) { result in
            switch result {
            case .success(let deviceDetails) :
                self.deviceDetails = deviceDetails
                self.ondataUpdated?()
            case .failure(let error) :
                print("error.localizedDescription1 : \(error.localizedDescription)")
                self.onerror?(error.localizedDescription)
            }
        }
    }
    
    func deleteDevice(id : Int) {
        APIService.shared.deleteDevice(id: id) { result in
            switch result {
            case .success(let deviceDetails) :
                print("Deleted: \(deviceDetails)")
                self.ondataUpdated?()
            case .failure(let error) :
                print("error.localizedDescription2 : \(error.localizedDescription)")
                self.onerror?(error.localizedDescription)
            }
        }
    }
}
