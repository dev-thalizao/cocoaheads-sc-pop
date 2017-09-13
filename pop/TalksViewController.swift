//
//  TalksViewController.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit

let cellId = "TalkCell"

class TalksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Talk] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupTableView()
        self.getTalks()
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
    }

    func setupTableView(){
        let nib = UINib(nibName: "TalkCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.estimatedRowHeight = TalkCell.estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getTalks(){
        APIService().getTalks { (talks) in
            self.dataSource = talks
            self.tableView.reloadData()
        }
    }
}

extension TalksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TalkCell
        let talk = dataSource[indexPath.row]
        cell.setup(talk: talk)
        
        return cell
    }
}

extension TalksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("Row selected")
    }
}
