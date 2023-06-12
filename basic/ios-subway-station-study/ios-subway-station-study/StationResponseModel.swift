//
//  StationResponseModel.swift
//  ios-subway-station-study
//
//  Created by jiinheo on 2021/12/28.
//

import Foundation

struct StationResponseModel: Decodable {
    var stations: [Station] {SearchInfoBySubwayNameService.row}

    private let SearchInfoBySubwayNameService: SerchInfoBySubwayNameServiceModel

    struct SerchInfoBySubwayNameServiceModel: Decodable {
        var row: [Station] = []
    }
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey {
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
