//
//  ViewController.swift
//  TodoList
//
//  Created by 허지인 on 2021/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var editButton: UIBarButtonItem!
    // Strong -> weak면 왼쪽 네비게이션 아이템을  done으로 바꿨을때 edit 버튼이 메모리에서 해제가 되어버려서
    // 더이상 재사용할 수 없게 됨
    @IBOutlet weak var tableView: UITableView!
    
    var doneButton: UIBarButtonItem?
    var tasks = [Task](){
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated:true)
    }
    
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else {return}
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self]_ in
            guard let title =  alert.textFields?[0].text else {return}
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler:  {textField in
            textField.placeholder = "할 일을 입력해주세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults =  UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else {return}
        self.tasks = data.compactMap({
            guard let title = $0["title"] as? String else { return nil}
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title: title, done: done)
        })
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { //편집모드에서 삭제 버튼을 눌렀을때 삭제 버튼이 눌려진 셀이 어떤 셀인이 알려주는 메서드
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        if self.tasks.isEmpty{
            self.doneButtonTap()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // 행이 다른 위치로 이동하면 원래 있었던 위치를 알려주고
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {//어디로 이동했는지 알려줌
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: sourceIndexPath.row)
        self.tasks = tasks
    }
    
}

extension ViewController: UITableViewDelegate {
    //셀을 선택했을때 어떤 셀이 선택되었는지 알려주는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
