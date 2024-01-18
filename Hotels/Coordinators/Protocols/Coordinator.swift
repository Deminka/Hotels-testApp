//
//  Coordinator.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
