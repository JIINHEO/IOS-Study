//
//  ViewController.swift
//  ios-weather
//
//  Created by jiinheo on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInformation: WeatherInfotmation) {
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(weatherInformation.temp.temp)"
    }

    
    func getCurrentWeather(cityName: String ){
       guard let url = URL(string:
                        "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=59474a51ff2d81c4fa8b9f39791aea9b") else {return}
    
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){[weak self] data, response, error in
            guard let data = data, error == nil else {return}
            let decoder = JSONDecoder()
            guard let weatherInformation = try? decoder.decode( WeatherInfotmation.self, from: data) else {return}
            DispatchQueue.main.async {
                self?.configureView(weatherInformation: weatherInformation)
            }
            debugPrint(weatherInformation)
        }.resume()
    }
}

