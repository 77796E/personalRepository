//
//  DetailWeatherData.swift
//  weather_demo
//
//  Created on 2022/2/24.
//

import Foundation

class DetailWeatherData {
    var Dtime: String = ""
    var Dtemp: String = ""
    var Dicon: String = ""
    var Dtext: String = ""
    init(_ ti: String, _ te: String, _ ic: String, _ tex: String) {
        Dtime = ti
        Dtemp = te
        Dicon = ic
        Dtext = tex
    }
}
var detailData = [DetailWeatherData]()
