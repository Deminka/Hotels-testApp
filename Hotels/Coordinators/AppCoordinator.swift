//
//  AppCoordinator.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = HotelInfoViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openHotelInfoVC() {
        let vc = HotelInfoViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openRoomsInfoVC() {
        let vc = RoomsInfoViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openBookingRoomVC() {
        let vc = BookingRoomViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openBookingResultVC() {
        let vc = BookingResultViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func openMainScreen() {
        navigationController.popToRootViewController(animated: true)
    }

}
