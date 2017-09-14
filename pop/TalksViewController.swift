//
//  TalksViewController.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit



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
            .addObserver(forType: Notifications.ShowSpeaker.self) { [weak self] (notification) in
                guard let showSpeakerNotification = notification else {
                    return
                }
                
                self?.alert(title: showSpeakerNotification.talk.speaker,
                            message: showSpeakerNotification.talk.name)
        }
    }
    

    func setupTableView(){
        tableView.register(TalkCell.self)
        
        tableView.estimatedRowHeight = TalkCell.estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getTalks(){
        APIService().getTalks { (result) in
            switch result {
            case .success(let talks):
                self.dataSource = talks
                self.tableView.reloadData()
                break
            case .failure(let error):
                print("Error :( \(error)")
                break
            }
        }
    }
}

extension TalksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TalkCell
        
        let talk = dataSource[indexPath.row]
        cell.setup(talk: talk)
        
        return cell
    }
}

extension TalksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let talk = dataSource[indexPath.row]
        
        NotificationCenter
            .default
            .post(Notifications.ShowSpeaker(talk: talk))
        
        print("Row selected")
    }
}
