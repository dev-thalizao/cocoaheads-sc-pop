//
//  TalksViewController.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit

let cellId = "TalkCell"

class TalksViewController: UIViewController, Alertable {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Talk] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupObservers()
        self.setupTableView()
        self.getTalks()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupObservers(){
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(self.speakerTapped(_:)),
                         name: NSNotification.Name(rawValue: "SPEAKER_TAPPED"),
                         object: nil)
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
    
    func speakerTapped(_ notification: Notification){
        print("notification reached \(notification)")
        
        guard let talk = notification.object as? Talk else {
            return
        }
        
        alert(title: talk.speaker, message: talk.name)
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
        let talk = dataSource[indexPath.row]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SPEAKER_TAPPED"),
                                        object: talk,
                                        userInfo: ["available": talk.available])
        
        print("Row selected")
    }
}
