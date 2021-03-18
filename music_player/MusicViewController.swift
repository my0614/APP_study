//
//  ViewController.swift
//  music_player
//
//  Created by Kim minyoung on 2021/03/18.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        // Do any additional setup after loading the view.
    }

    func bind() {
        musicTableView.delegate = self
        musicTableView.dataSource = self
    }

}

extension MusicViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        cell.musicImageView.image = UIImage(named: "\(musicArr[indexPath.row]).jpeg")
        cell.musicTitleLabel.text = musicArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        musicTableView.deselectRow(at: indexPath, animated: true)
        let cellposition = indexPath.row
        
        position = cellposition
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController else {return}
        self.present(viewController, animated: true, completion: nil)
        
    }
    
}

