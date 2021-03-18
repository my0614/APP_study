//
//  MusicDetailViewController.swift
//  music_player
//
//  Created by Kim minyoung on 2021/03/18.
//

import UIKit
import AVFoundation

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var musicSlider: UISlider!
    
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        UIBind()
        
    }
    
    override func viewDidDisappear( _ animated: Bool) {
        super.viewDidDisappear(animated)
        if let player = player{
            player.stop()
        }
    }
    
    func configure() {
        
        let music = musicArr[position]
        let musicUrl = Bundle.main.url(forResource: music, withExtension: "mp3")!
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            player = try AVAudioPlayer(contentsOf: musicUrl)
            guard let player = player else {return}
            
            player.volume = 0.5
            player.prepareToPlay()
            player.play()
            
            
        }catch {
            print("error")
           
        }
    
    }
    
    func UIBind() {
        musicImageView.image = UIImage(named: "\(musicArr[position]).jpeg")
        musicTitleLabel.text = musicArr[position]
        
    }
}
