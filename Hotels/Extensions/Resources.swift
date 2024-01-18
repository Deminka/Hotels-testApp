//
//  Resources.swift
//  Hotels
//
//  Created by mac on 27.12.2023.
//

import UIKit

class R {
    
    enum Api {
        static let hotelInfoVC = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")
        static let roomsInfoVC = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")
        static let bookingRoomVC = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")
    }
    
    enum Strings {

        static let hotel = "Отель"
        static let aboutHotel = "Об отеле"
        static let nameHotel = "Steigenberger Makadi"
        static let booking = "Бронирование"
        static let orderPaid = "Заказ оплачен"
        static let locationOfHotel = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        
        enum DetailAboutHotel {
            static let detailAboutHotel = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        }
        enum BookingRoomVC {
            
            enum BookingDetailsView {
                static let departure = "Вылет из"
                static let countryCity = "Страна, город"
                static let dates = "Даты"
                static let nightsCount = "Количество ночей"
                static let hotel = "Отель"
                static let room = "Номер"
                static let nutrition = "Питание"
            }
            
            enum InfoAboutBuyerView {
                static let infoAboutBuyer = "Информация о покупателе"
                static let phoneNumber = "Номер телефона"
                static let mail = "Почта"
            }
            
            enum FirstTouristView {
                static let firstName = "Имя"
                static let lastName = "Фамилия"
                static let birthDay = "День рождения"
                static let citizenship = "Гражданство"
                static let passportNumber = "Номер загранпаспорта"
                static let validatePeriodPassport = "Срок действия загранпаспорта"
            }
            
            enum TouristsCount {
                static let firstTourist = "Первый турист"
                static let secondTourist = "Второй турист"
                static let addTourist = "Добавить туриста"
            }
            enum CostView {
                static let tour = "Тур"
                static let fuel = "Топливный сбор"
                static let service = "Сервисный сбор"
                static let toBePaid = "К оплате"
            }
            static var infoText = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        }
        
        enum BookingResultVC {
            static let orderStatus = "Ваш заказ принят в работу"
            static let infoStatus = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
            static let resultButton = "Супер"
        }
        
        enum Tags {
            static let allInclusive = "Все включено"
            static let conditioner = "Кондиционер"
            static let thirdLine = "3-я линия"
            static let wiFi = "Платный Wi-Fi в фойе"
            static let distanceToAirport30km = "30 км до аэропорта"
            static let distanceToBeach1km = "1 км до пляжа"
        }
        
        enum Common {
            static let moreDetailAboutRoom = "Подробнее о номере"
            static let toChangeRoom = "К выбору номера"
        }
    }
    
    enum Colors {
        static let tagBackgroundColor = UIColor(hexString: "#0D72FF1A").withAlphaComponent(0.1)
        static let tagTextColor = UIColor(hexString: "#0D72FF")
        static let aboutBuyerBackgroundColor = UIColor(hexString: "#F6F6F9")
        static let bigTextColor = UIColor(hexString: "#14142B")
        static let infotextColor = UIColor(hexString: "#828796")
        static let arrowColor = UIColor(hexString: "#0D72FF")
        static let arrowBackgroundColor = UIColor(hexString: "#0D72FF").withAlphaComponent(0.1)
        static let errorBackgroundColor = UIColor(hexString: "#EB5757").withAlphaComponent(0.15)
    }
    
    enum Images {
        static var rightArrow = UIImage(named: "Right_arrow")
        static var upArrow = UIImage(named: "Icons1")
        static var downArrow = UIImage(named: "Icons2")
        static var plus = UIImage(named: "Icons3")
    }
}

