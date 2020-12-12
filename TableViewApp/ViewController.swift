//
//  ViewController.swift
//  TableViewApp
//
//  Created by 松島優希 on 2020/12/12.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var textArray = [String]()
    var imageArray = ["1","2","3","4","5"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 505
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let label = cell.contentView.viewWithTag(2) as! UILabel
        
        label.text = textArray[indexPath.row]
        imageView.image = UIImage(named: imageArray[indexPath.row])
    
        return cell
    
    }
    
    
    @IBAction func tap(_ sender: Any) {
        
        if textArray.count > 5 || textField.text?.isEmpty == true{
            return
        }
        
        textArray.append(textField.text!)
        textField.text = ""
        if textArray.count <= 5{
            tableView.reloadData()
        }
        
    }
    
}

