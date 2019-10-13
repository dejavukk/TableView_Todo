//
//  ViewController.swift
//  TableView_Todo
//
//  Created by JunHyuk on 2019/10/10.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    struct todo {
        var text: String
        var isDone: Bool

    }
    
    @IBOutlet var todoLabel: UILabel!
    var todos = [todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // todos.append("빨래하기.")
        // Do any additional setup after loading the view.
        
        // 구조체 추가.
        let t = todo(text: "고양이 돌보기", isDone: false)
        todos.append(t)
        
    }
    
    // Rows in the Table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count
    }
    
    // 각각의 테이블 셀 생성하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "todo-cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        var todo = todos[indexPath.row]
        todo.isDone = !todo.isDone
        todos[indexPath.row] = todo
        
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        cell.textLabel?.text = todo.text

        if todo.isDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        let i = indexPath.row
        let text = todos[i]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

