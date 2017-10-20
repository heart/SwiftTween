//
//  ViewController.swift
//  SwiftTween
//
//  Created by i am Heart on 10/19/2017.
//  Copyright (c) 2017 i am Heart. All rights reserved.
//

import UIKit
import SwiftTween

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ease.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCellTableViewCell") as! DemoCellTableViewCell
        
        if let e = Ease.init(rawValue: indexPath.row){
            let easeName = String(describing: e)
            cell.title.text = easeName
            cell.setEasing(ease: e)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

