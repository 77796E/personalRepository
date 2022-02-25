//
//  WeatherView.swift
//  weather_demo
//
//  Created on 2022/2/21.
//

import UIKit
import CoreLocation //位置包
import Alamofire
import SwiftyJSON
//当前类继承与UIVC, 遵循CLLocationMD协议
class WeatherVC: UIViewController, CLLocationManagerDelegate, LocationViewDelegate {
    var weatherData = WeatherData()
    var 经度: Double = 0
    var 纬度: Double = 0
    let locationManager = CLLocationManager()
        
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var locLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var tempMaxLable: UILabel!
    @IBOutlet weak var tempMinLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //请求当前位置信息
        locationManager.requestWhenInUseAuthorization()
        
        // 设置请求精度
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        // 指定代理
        locationManager.delegate = self
        
        // 请求位置,成功则调用didUpdateLocations函数
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取经纬度
        经度 = locations[0].coordinate.longitude
        纬度 = locations[0].coordinate.latitude
        //print(经度, 纬度)
        updateWeatherView(经度, 纬度)
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //所有的跳转都经过这个函数
        if segue.identifier == "toChangeLoc" {
            let vc = segue.destination as! LocationVC
            vc.delegate = self
            vc.cityName = self.weatherData.cityName
            //print(vc.cityName)
        } else if segue.identifier == "toShowDetail" {
        }
    }
    
    func updateDVC() {
        AF.request("https://devapi.qweather.com/v7/weather/24h?location=\(self.经度),\(self.纬度)&key=0a71423a35384d4eb2904f07b162447f").responseJSON { res in
            if let data = res.value {
                //转换成JSON类型
                let dataJSON = JSON(data)
                for i in 0...23 {
                    
                    let strTemp = dataJSON["hourly", i, "fxTime"].stringValue
                    let beginStr = strTemp.index(strTemp.startIndex, offsetBy: 11)
                    let endStr = strTemp.index(strTemp.startIndex, offsetBy: 15)
                    let subData = strTemp[beginStr...endStr]
                    
                    let tempData = DetailWeatherData.init(String(subData), dataJSON["hourly", i, "temp"].stringValue, dataJSON["hourly", i, "icon"].stringValue, dataJSON["hourly", i, "text"].stringValue)
                    detailData.insert(tempData, at: detailData.count)
                }
            }
        }
    }
    
    func updateWeatherView(_ 经度: Double, _ 纬度: Double) {
        
        AF.request("https://devapi.qweather.com/v7/weather/now?location=\(经度),\(纬度)&key=0a71423a35384d4eb2904f07b162447f").responseJSON { res in
            if let data = res.value {
                //转换成JSON类型
                let dataJSON = JSON(data)
                //print(dataJSON)
                self.weatherData.weatherIcon = dataJSON["now", "icon"].stringValue
                
                
                self.weatherData.tempRea = "\(dataJSON["now", "temp"].stringValue)°C"
                
                self.iconImage.image = UIImage(named: self.weatherData.weatherIcon)
                self.tempLable.text = self.weatherData.tempRea
                
            }
        }
        
        AF.request("https://devapi.qweather.com/v7/weather/3d?location=\(经度),\(纬度)&key=0a71423a35384d4eb2904f07b162447f").responseJSON { res in
            
            if let data = res.value {
                let dataJSON = JSON(data)
                //print(dataJSON)
                
                self.weatherData.maxWeather = "最高: \(dataJSON["daily"][0]["tempMax"])°C"
                self.weatherData.minWeather = "最低: \(dataJSON["daily"][0]["tempMin"])°C"
                
                self.tempMaxLable.text = self.weatherData.maxWeather
                self.tempMinLable.text = self.weatherData.minWeather
                
            }
        }
        
        AF.request("https://geoapi.qweather.com/v2/city/lookup?location=\(经度),\(纬度)&key=0a71423a35384d4eb2904f07b162447f").responseJSON { res in
            
            if let data = res.value {
                let dataJSON = JSON(data)
                //print(dataJSON)
                self.weatherData.cityName = dataJSON["location", 0, "name"].stringValue
                
                self.cityLable.text = self.weatherData.cityName
            }
        }
        
        updateDVC()
    }
    
    func didAfterBack(经度: Double, 纬度: Double) {
        //反向传值
        self.经度 = 经度
        self.纬度 = 纬度
        
        updateWeatherView(self.经度, self.纬度)
    }
}
