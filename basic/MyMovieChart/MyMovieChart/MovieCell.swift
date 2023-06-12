//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 허지인 on 2021/08/25.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel! // 영화제목
    
    @IBOutlet var opendate: UILabel! // 영화설명
    
    @IBOutlet var rating: UILabel! // 개봉일
    
    @IBOutlet var desc: UILabel! // 평점
    
    @IBOutlet var thumbnail: UIImageView!  // 썸네일 이미지
}
