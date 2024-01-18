//
//  BookingRoomViewController.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class BookingRoomViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    private var viewModel = ViewModelBooking()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        return contentView
    }()
    
    let ratingNameView = RatingNameView()
    let bookingDaetailsView = BookingDetailsView()
    let infoAboutBuyerView = InfoAboutBuyerView()
    let firstTouristView = FirstTouristView(viewName: "Первый турист", fullView: true)
    let secondTouristView = FirstTouristView(viewName: "Второй турист", fullView: false)
    let addTouristView: FirstTouristView = {
        let view = FirstTouristView(viewName: "Добавить туриста", fullView: false)
        view.setButtonImage(image: #imageLiteral(resourceName: "Icons3"))
        return view
    }()
    
    @objc func addNewTouristView() {
//        метод добавления нового пользователя
    }
    
    let costView = CostView()
    let toPayButton = ForwardButtonView(titleButton: "")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = R.Strings.booking
        addViews()
        setupConstraints()
        customiseElements()
        bindViewModel()

        addTouristView.doSomthing = { [weak self] in
            self?.addNewTouristView()
        }

        toPayButton.onRoom = { [weak self] in
            self?.chechValid()
        }
    }
}

extension BookingRoomViewController {
    
    private func customiseElements() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        ratingNameView.translatesAutoresizingMaskIntoConstraints = false
        ratingNameView.layer.cornerRadius = 12
        bookingDaetailsView.translatesAutoresizingMaskIntoConstraints = false
        bookingDaetailsView.layer.cornerRadius = 12
        infoAboutBuyerView.translatesAutoresizingMaskIntoConstraints = false
        infoAboutBuyerView.layer.cornerRadius = 12
        firstTouristView.translatesAutoresizingMaskIntoConstraints = false
        firstTouristView.layer.cornerRadius = 12
        secondTouristView.translatesAutoresizingMaskIntoConstraints = false
        secondTouristView.layer.cornerRadius = 12
        addTouristView.translatesAutoresizingMaskIntoConstraints = false
        addTouristView.layer.cornerRadius = 12
        costView.translatesAutoresizingMaskIntoConstraints = false
        costView.layer.cornerRadius = 12
        toPayButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(ratingNameView)
        contentView.addSubview(bookingDaetailsView)
        contentView.addSubview(infoAboutBuyerView)
        contentView.addSubview(firstTouristView)
        contentView.addSubview(secondTouristView)
        contentView.addSubview(addTouristView)
        contentView.addSubview(costView)
        contentView.addSubview(toPayButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            ratingNameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            ratingNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ratingNameView.heightAnchor.constraint(equalToConstant: 150),
            
            bookingDaetailsView.topAnchor.constraint(equalTo: ratingNameView.bottomAnchor, constant: 8),
            bookingDaetailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookingDaetailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookingDaetailsView.heightAnchor.constraint(equalToConstant: 320),
            
            infoAboutBuyerView.topAnchor.constraint(equalTo: bookingDaetailsView.bottomAnchor, constant: 8),
            infoAboutBuyerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoAboutBuyerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoAboutBuyerView.heightAnchor.constraint(equalToConstant: 232),
            
            firstTouristView.topAnchor.constraint(equalTo: infoAboutBuyerView.bottomAnchor, constant: 8),
            firstTouristView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firstTouristView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            secondTouristView.topAnchor.constraint(equalTo: firstTouristView.bottomAnchor, constant: 8),
            secondTouristView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            secondTouristView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            addTouristView.topAnchor.constraint(equalTo: secondTouristView.bottomAnchor, constant: 8),
            addTouristView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addTouristView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            costView.topAnchor.constraint(equalTo: addTouristView.bottomAnchor, constant: 8),
            costView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            costView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            costView.heightAnchor.constraint(equalToConstant: 156),
            
            toPayButton.topAnchor.constraint(equalTo: costView.bottomAnchor, constant: 8),
            toPayButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            toPayButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            toPayButton.heightAnchor.constraint(equalToConstant: 50),
            toPayButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func chechValid() {
        var email: Bool
        if Validators.isValidEmail(infoAboutBuyerView.grayView2.textField.text) {
            email = true
        } else {
            infoAboutBuyerView.grayView2.textField.backgroundColor = R.Colors.errorBackgroundColor
            email = false
        }
        
        if Validators.isFilled(firstName: firstTouristView.grayView1.textField.text,
                               secondName: firstTouristView.grayView2.textField.text,
                               birthDay: firstTouristView.grayView3.textField.text,
                               citizenship: firstTouristView.grayView4.textField.text,
                               pasNumber: firstTouristView.grayView5.textField.text,
                               pasValidPeriod: firstTouristView.grayView6.textField.text) && email {
            self.coordinator?.openBookingResultVC()
        } else {
            if firstTouristView.grayView1.textField.text == "" {
                firstTouristView.grayView1.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
            if firstTouristView.grayView2.textField.text == "" {
                firstTouristView.grayView2.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
            if firstTouristView.grayView3.textField.text == "" {
                firstTouristView.grayView3.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
            if firstTouristView.grayView4.textField.text == "" {
                firstTouristView.grayView4.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
            if firstTouristView.grayView5.textField.text == "" {
                firstTouristView.grayView5.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
            if firstTouristView.grayView6.textField.text == "" {
                firstTouristView.grayView6.textField.backgroundColor = R.Colors.errorBackgroundColor
            }
        }
    }
}

extension BookingRoomViewController {
    
    func bindViewModel() {
        
        viewModel.array.bind({ (array) in
            DispatchQueue.main.async {
                self.ratingNameView.ratingView.ratingNumberLabel.text = "\(array.horating)"
                self.ratingNameView.ratingView.ratingConditionLabel.text = array.ratingName
                self.ratingNameView.ratingView.ratingConditionLabel.text = array.ratingName
                self.ratingNameView.nameLabel.text = array.hotelName
                self.ratingNameView.locationButton.setTitle(array.hotelAdress, for: .normal)
                self.bookingDaetailsView.firstStack.rightLabel.text = array.departure
                self.bookingDaetailsView.secondStack.rightLabel.text = array.arrivalCountry
                self.bookingDaetailsView.thirdStack.rightLabel.text = array.tourDateStart + "-" + array.tourDateStop
                self.bookingDaetailsView.fourthStack.rightLabel.text = "\(array.numberOfNights)"
                self.bookingDaetailsView.fifthStack.rightLabel.text = array.hotelName
                self.bookingDaetailsView.sixthStack.rightLabel.text = array.room
                self.bookingDaetailsView.seventhStack.rightLabel.text = array.nutrition
                self.costView.stack1.rightLabel.text = "\(array.tourPrice)".chunked(by: 3).joined(separator: " ") + " ₽"
                self.costView.stack2.rightLabel.text = "\(array.fuelCharge)"  + " ₽"
                self.costView.stack3.rightLabel.text = "\(array.serviceCharge)"  + " ₽"
                self.toPayButton.forwardButton.setTitle("Оплатить " + "\(array.tourPrice + array.fuelCharge + array.fuelCharge)".chunked(by: 3).joined(separator: " ")  + " ₽", for: .normal)
            }
        })
        viewModel.data()
    }
}






