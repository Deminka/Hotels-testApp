//
//  InfoButtonsView.swift
//  Hotels
//
//  Created by mac on 11.09.2023.
//

import UIKit

class InfoButtonsView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var images: [UIImage] = [#imageLiteral(resourceName: "emoji-happy"), #imageLiteral(resourceName: "tick-square"), #imageLiteral(resourceName: "close-square")]
    var titleLabels: [String] = ["Удобства", "Что включено", "Что не включено"]
    var infoLabels: [String] = ["Самое необходимое", "Самое необходимое", "Самое необходимое"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        register(InfoButtonCell.self, forCellReuseIdentifier: "Cell")
        reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InfoButtonCell
        
        cell.titleLabel.text = titleLabels[indexPath.row]
        cell.aboutHotelLabel.text = infoLabels[indexPath.row]
        cell.image.image = images[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
