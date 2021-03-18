//
//  weather.swift
//  WeatherApp
//
//  Created by Tian Yin on 3/17/21.
//

import Foundation

class Weather {
    var date : String = ""
    var highTemp : Int = 0
    var lowTemp : Int = 0
    
    init(date: String, condition: String, highTemp: Int, lowTemp: Int) {
        self.date = date
        self.highTemp = highTemp
        self.lowTemp = lowTemp
    }
}
