//
//  RoomsInfoViewController.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class RoomsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    weak var coordinator: AppCoordinator?
    private var viewModel = ViewModelRooms()
    var sourceArray: [Room] = []
    var imagesArrays: [[UIImage]] = []
    private let tableView: UITableView =  UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.nameHotel
        tableView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        tableView.separatorColor = .clear
        addSubViews()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RoomsInfoCell.self, forCellReuseIdentifier: "cell")
        bindViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoomsInfoCell
        
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        
        let array = sourceArray[indexPath.row]
        
        cell.nameLabel.text = array.name
        cell.costLabel.text = "\(array.price)".chunked(by: 3).joined(separator: " ") + " ₽"
        cell.costDetailLabel.text = array.pricePer
        let tags = array.peculiarities
        if tags.indices.contains(0) {
            cell.tagLabelView1.tagLabel.text = tags[0]
        }
        if tags.indices.contains(1) {
            cell.tagLabelView2.tagLabel.text = tags[1]
        }
        if tags.indices.contains(2) {
            cell.tagLabelView3.tagLabel.text = tags[2]
        }
        
        let imageArray = imagesArrays[indexPath.row]
        cell.carouselPhoto.setup(images: imageArray)
        
        cell.onBookingRoom = { [weak self] in
            self?.coordinator?.openBookingRoomVC()
        }
        return cell
    }
}

extension RoomsInfoViewController {
    
    private func addSubViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        530
    }
}

extension RoomsInfoViewController {
    
    func bindViewModel() {
        
        viewModel.array.bind({ (array) in
            DispatchQueue.main.async {
                self.sourceArray = array.rooms
            }
        })
        
        viewModel.images.bind({ (images) in
            DispatchQueue.main.async {
                self.imagesArrays = images
                self.tableView.reloadData()
            }
        })
        viewModel.data()
    }
}


