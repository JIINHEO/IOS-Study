//
//  ViewController.swift
//  SimpleTable
//
//  Created by 허지인 on 2021/06/16.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var dates: [Date] = []
    
    
    let dateFormatter: DateFormatter = {
        let formatter :DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter :DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    //버튼 누를때마다 date를 하나씩 추가해주고 테이블뷰를 업데이트해줌
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())//현재시각
        
        self.tableView.reloadData() //전체를 불러옴 (비효율적)
        
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      

        if indexPath.section<2{
            
            let cell: UITableViewCell =
                tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            
            //여기서 데이터 세팅하고 넘겨줌
            cell.textLabel?.text = text
            
            //셀의 재사용
            if indexPath.row    == 1 {
                cell.backgroundColor = UIColor.red
            }else {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }else {
            
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
       
        
    
    }
    
    //헤더설정
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section<2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 스토리보드를 사용한 애플리케이션에서, 네비게이션 되기 전에 준비해야할 것이 있을것이다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //세그에 - 를 사용해서 다음 뷰 컨트롤러를 가져올 수 있고, 거기다 원하는 내용을 보내줄 수 있다.
        
        guard let nextViewController: SecondViewController =
                segue.destination as? SecondViewController else {
            return
        }
        //셀은 센더를 테이블뷰로 타입캐스팅 하고 안되면 그만둠
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.textToSet = cell.textLabel?.text
         
    }
}

