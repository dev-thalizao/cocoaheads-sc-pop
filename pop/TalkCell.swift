//
//  TalkCell.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit

class TalkCell: UITableViewCell {

    static let estimatedHeight: CGFloat = 64.0
    
    @IBOutlet weak var talkName: UILabel!
    @IBOutlet weak var talkSpeaker: UILabel!
    @IBOutlet weak var talkAvailability: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(talk: Talk){
        talkName.text = talk.name
        talkSpeaker.text = talk.speaker
        talkAvailability.backgroundColor = (talk.available) ? UIColor.Pallete.available : UIColor.Pallete.unavailable
    }
}
