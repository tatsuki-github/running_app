//
//  ViewController4.swift
//  竜輝firstapp
//
//  Created by Tatsuki Tsuchiyama on 2020/09/10.
//  Copyright © 2020 Tatsuki Tsuchiyama. All rights reserved.
//

import UIKit

class ViewController4: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView4: UITableView!
    
    var practice = [String]()
    
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView4.isEditing = false
        tableView4.allowsSelectionDuringEditing = true
        if let storedTodoList = userDefaults.array(forKey: "menu4") as? [String] {
            practice.append(contentsOf: storedTodoList)
        }
    }
    
    @IBAction func AddBtnAction4(_ sender: Any) {
    let alertController = UIAlertController(title: "練習メニュー追加", message: "練習メニューを入力してください。", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { (acrion: UIAlertAction) in
            
            if let textField = alertController.textFields?.first {
                self.practice.insert(textField.text!, at: 0)
                self.tableView4.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
                self.userDefaults.set(self.practice, forKey: "menu4")
            }
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return practice.count
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = practice[sourceIndexPath.row]
        practice.remove(at: sourceIndexPath.row)
        practice.insert(todo, at: destinationIndexPath.row)
        
        userDefaults.set(practice, forKey: "menu4")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView4.dequeueReusableCell(withIdentifier: "4", for: indexPath)
        let todoTitle = practice[indexPath.row]
        cell.textLabel?.text = todoTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print(practice)
            practice.remove(at: indexPath.row)
            tableView4.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            
            userDefaults.set(practice, forKey: "menu4")
        }
    }

}
