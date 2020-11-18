//
//  ListViewController.swift
//  PureTableView
//
//  Created by Masaki Horimoto on 2020/11/18.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItem()         //Navigation BarのボタンItemをセットする
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let indexPath = table.indexPathForSelectedRow {
            table.deselectRow(at: indexPath, animated: true)    //TableViewCellの選択を解除する
        }

    }
    
    /**
     Navigation BarのボタンItemをセットする
    */
    private func setNavigationItem() {
        
        //Navigation Bar 左側
        //Editボタン追加
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = "dateDescription"

        // Configure the cell...

        return cell
    }
    
    //セル選択時に実行される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shiftToEditDetailVC(indexPath: indexPath)
    }
    
    //Editボタンが押されると呼ばれる　(※このメソッドを書かない場合にはEditボタンを押すと自動的に編集モードになる)
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.isEditing = editing   //引数に値を設定
    }
    
    private func shiftToEditDetailVC(indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let targetViewController = storyboard.instantiateViewController(identifier: "DetailViewController")
        self.navigationController?.pushViewController(targetViewController, animated: true)
    }


}
