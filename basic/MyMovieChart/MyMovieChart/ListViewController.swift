//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 허지인 on 2021/08/17.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    // 튜플 아이템으로 구성된 데이터 세트
    var dataset = [
        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "dc.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31,"dc.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19,"dc.jpg")
    ]
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
//    // 테이블 뷰를 구성할 리스트 데이터
//    var list = [MovieVO]()
//
//    override func viewDidLoad() {
//        // 첫번째 행
//        var mvo = MovieVO()
//        mvo.title = "다크나이트"
//        mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다."
//        mvo.opendate = "2008-09-04"
//        mvo.rating = 8.95
//        // 배열에 추가
//        self.list.append(mvo)
//
//        // 두번째 행
//        mvo = MovieVO()
//        mvo.title = "호우시절"
//        mvo.description = "때를 알고 내리는 좋은 비"
//        mvo.opendate = "2009-10-08"
//        mvo.rating = 7.31
//        // 배열에 추가
//        self.list.append(mvo)
//
//        // 세번째 행
//        mvo = MovieVO()
//        mvo.title = "말할 수 없는 비밀"
//        mvo.description = "여기서 너까지 다섯 걸음"
//        mvo.opendate = "2015-05-07"
//        mvo.rating = 9.19
//        // 배열에 추가
//        self.list.append(mvo)
//    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        // 무비셀 타입으로 캐스팅해줘야 함
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        
//        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
//
//
//        // 영화제목이 표시될 레이블을 title 변수로 받음
//        let title = cell.viewWithTag(101) as? UILabel
//        // 영화제목이 표시될 레이블을 desc 변수로 받음
//        let desc = cell.viewWithTag(102) as? UILabel
//        // 영화 개봉일이 표시될 레이블을 opendate 변수로 받음
//        let opendate = cell.viewWithTag(103) as? UILabel
//        // 영화 별점이 표시될 레이블 rating 변수로 받음
//        let rating = cell.viewWithTag(104) as? UILabel
//        // 데이터 소스에 저장된 값을 각 레이블 변수에 할당
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
        
        return cell
    }
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    

}
