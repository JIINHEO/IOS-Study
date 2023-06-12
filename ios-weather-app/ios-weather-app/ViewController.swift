//
//  ViewController.swift
//  ios-weather-app
//
//  Created by 허지인 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLable: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true) // 버튼이 눌리면 키보드가 사라지도록
        }
    }
    func configureView(weatherInformation: WeatherInformation) {
        self.cityNameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptionLable.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))℃"
        self.minTempLabel.text = "최저:\(Int(weatherInformation.temp.minTemp - 273.15))℃"
        self.maxTempLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))℃"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController( title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func getCurrentWeather(cityName: String){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=59474a51ff2d81c4fa8b9f39791aea9b") else {return}
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { //서버로 데이터 요청
            [weak self] data, response, error in
            let successRang = (200..<300)
            
            guard let data = data, error == nil else {return} //요청이 성공하면 nil 반환
            let decoder = JSONDecoder() // json객체에서 데이터 유형의 인스턴스로 디코딩하는 객체
            if let response = response as? HTTPURLResponse, successRang.contains(response.statusCode){
                //날씨 정보 표시
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.message)
                }
                debugPrint(errorMessage)
            }
        }.resume()
    }
    
    
}

