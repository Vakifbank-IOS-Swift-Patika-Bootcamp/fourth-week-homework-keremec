//
//  EpisodesVC.swift
//  bariumApp
//
//  Created by Kerem Safa Dirican on 26.11.2022.
//

import UIKit

class EpisodesVC: UIViewController {

    
    var list = [[Episode]]()
    var charList = [String]()
    var isLoading = false
    
    @IBOutlet weak var episodesTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var episodeCharView: EpisodeCharView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        
        episodeCharView.delegateDetail = self
        episodeCharView.layer.cornerRadius = 15
        
        
        getEpisodes()
        
        print(list)
    }
    
}

extension EpisodesVC: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
        
        
        let obj = list[indexPath.section][indexPath.row]
        cell.textLabel?.text = obj.title ?? "nil"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = list[indexPath.section][indexPath.row].characters
        charList = item!
        episodeCharView.isHidden = false
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
