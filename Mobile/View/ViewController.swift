//
//  ViewController.swift
//  Sahil-5thDec25
//
//  Created by Pallavi on 05/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var devicesListTableView: UITableView!
    let dataModel = DataModel()
    var deleteID : Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        devicesListTableView.delegate = self
        devicesListTableView.dataSource = self
        dataBinding()
        dataModel.dataModelDeviceList()
    }

    func dataBinding() {
        dataModel.ondataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.devicesListTableView.reloadData()
            }
        }
        
        dataModel.onerror = { [weak self] message in
                DispatchQueue.main.async {
                    self?.showToast(message: message, font: .systemFont(ofSize: 12.0))
                }
            }
    }
    
    @IBAction func addDeviceViewController(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddDevicesViewController") as! AddDevicesViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
//        let cell = devicesListTableView.dequeueReusableCell(withIdentifier: "DevicesListTableViewCell") as! DevicesListTableViewCell
//        dataModel.deleteDevice(id: deleteID ?? 0)
        
        self.showToast(message: "2 is a reserved id and the data object of it cannot be deleted. You can create your own new object via POST request and try to send a DELETE request with new generated object id.", font: .systemFont(ofSize: 12.0))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.deviceList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = devicesListTableView.dequeueReusableCell(withIdentifier: "DevicesListTableViewCell") as! DevicesListTableViewCell
        cell.deviceName.text = self.dataModel.deviceList[indexPath.row].name
       deleteID = Int(self.dataModel.deviceList[indexPath.row].id) ?? 0
          
          // call the subscribeTapped method when tapped
          cell.deleteDevice.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var id = dataModel.deviceList[indexPath.row].id
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DevicesDetailsViewController") as! DevicesDetailsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.id = id
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.numberOfLines = 4
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.5, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
