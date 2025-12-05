//
//  DevicesDetailsViewController.swift
//  Sahil-5thDec25
//
//  Created by Pallavi on 05/12/25.
//

import UIKit

class DevicesDetailsViewController: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var dataColorTxtField: UITextField!
    @IBOutlet weak var capacityGBTxtField: UITextField!
    @IBOutlet weak var dataPriceTxtField: UITextField!
    @IBOutlet weak var yearTxtField: UITextField!
    @IBOutlet weak var cpuModelTxtField: UITextField!
    @IBOutlet weak var strapColourTxtField: UITextField!
    @IBOutlet weak var caseSizeTxtField: UITextField!
    @IBOutlet weak var colorTxtField: UITextField!
    @IBOutlet weak var descriptionTxtField: UITextField!
    @IBOutlet weak var capacityTxtField: UITextField!
    @IBOutlet weak var screenSizeTxtField: UITextField!
    @IBOutlet weak var generationTxtField: UITextField!
    @IBOutlet weak var priceTxtField: UITextField!
    
    var id : String? = ""
    let dataModel = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        print("id::: \(id)")
        
        let ids = Int(id ?? "")
        dataBinding()
        dataModel.dataModelDeviceDetails(id: ids ?? 0)
    }
    func dataBinding() {
        dataModel.ondataUpdated = { [weak self] in
            DispatchQueue.main.async { [self] in
                print("self?.dataModel.deviceDetails : \(self?.dataModel.deviceDetails)")
                self?.nameTxtField.text = self?.dataModel.deviceDetails?.name
                self?.dataColorTxtField.text = self?.dataModel.deviceDetails?.data?.dataColor
//                self?.capacityGBTxtField.text = self?.dataModel.deviceDetails?.data?.capacityGB
//                self?.dataPriceTxtField.text = self?.dataModel.deviceDetails?.data?.dataPrice
//                self?.yearTxtField.text = self?.dataModel.deviceDetails?.data?.year
                self?.cpuModelTxtField.text = self?.dataModel.deviceDetails?.data?.cpuModel
                self?.strapColourTxtField.text = self?.dataModel.deviceDetails?.data?.strapColour
                self?.caseSizeTxtField.text = self?.dataModel.deviceDetails?.data?.caseSize
                self?.colorTxtField.text = self?.dataModel.deviceDetails?.data?.color
                self?.descriptionTxtField.text = self?.dataModel.deviceDetails?.data?.description
                self?.capacityTxtField.text = self?.dataModel.deviceDetails?.data?.capacity
//                screenSizeTxtField.text = dataModel.deviceDetails?.data?.screenSize
                self?.generationTxtField.text = self?.dataModel.deviceDetails?.data?.generation
//                self?.priceTxtField.text = Double(self?.dataModel.deviceDetails?.data?.price)
            }
        }
    }

    @IBAction func editDevices(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "EditDevicesViewController") as! EditDevicesViewController
        controller.modalPresentationStyle = .fullScreen
        controller.id = id
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
