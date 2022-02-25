//
//  LocationVC.swift
//  weather_demo
//
//  Created on 2022/2/22.
//

import UIKit
import SwiftyJSON
import Alamofire
protocol LocationViewDelegate {
    func didAfterBack(经度: Double,纬度: Double)
}
class LocationVC: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityLable: UILabel!
    var cityName: String = ""
    var delegate: LocationViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(cityName)
        cityLable.text = cityName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func clickSearch(_ sender: UIButton) {
        if cityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errorLabel.text = "请输入查询城市"
            cityTextField.text = ""
        } else {
            let map = ["location": cityTextField.text!, "key": "0a71423a35384d4eb2904f07b162447f"]
            AF.request("https://geoapi.qweather.com/v2/city/lookup?", parameters: map).responseJSON {
                res in
                if let data = res.value {
                    let dataJSON = JSON(data)
                    //print("dataJSON如下: \n")
                    //print(dataJSON)
                    if dataJSON["code"].stringValue=="404" {
                        //print("查不到啊!!!!")
                        self.errorLabel.text = "查询不到相关城市"
                        self.cityTextField.text = ""
                    } else {
                        self.delegate?.didAfterBack(经度: Double(dataJSON["location", 0, "lon"].stringValue)!, 纬度: Double(dataJSON["location", 0, "lat"].stringValue)!)
                        self.dismiss(animated: true)
                    }
                    
                }
            }
        }
    }
    
}
