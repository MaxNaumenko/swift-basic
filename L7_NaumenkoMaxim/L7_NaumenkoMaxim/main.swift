//
//  main.swift
//  L7_NaumenkoMaxim
//
//  Created by Максим Науменко on 09.05.2021.
//

import Foundation

enum carsErrors: Error {
    case lowMoney(neededMoney:Int)
    case outOfCount
    case outOfTypeCar
}

enum Car {
    case BMW, Mercedes, Freightliner
}

struct Item {
    var price: Int
    var count: Int
    let model: Car
}
//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
class CarSaloon {
    let carsIn = [
        "BMW": Item(price: 50000, count: 4, model: Car.BMW),
        "Mercedes": Item(price: 80000, count: 3, model: Car.Mercedes),
        "Freightliner": Item(price: 70000, count: 0, model: Car.Freightliner)
    ]
var cashIn = 75000 // имеющиеся деньги у покупателя

    func sale(itemNamed name: String) -> (carsErrors?, Car?) {

        guard let item = carsIn[name] else {
            return (carsErrors.outOfTypeCar, nil)
        }
        guard item.count > 0 else {
            return (carsErrors.outOfCount, nil)
        }
        guard item.price <= cashIn else {
            return (carsErrors.lowMoney(neededMoney: item.price - cashIn), nil)
        }
        return (nil, item.model)
            }
        }
func descript (error: carsErrors?, car: Car?, name: String) {
    if error == nil {
        print("Продано авто: \(name)")
    }
    else if car == nil {
        print("Произошла ошибка: \(error!)")
    }
}

let car = CarSaloon()
var firstCar = car.sale(itemNamed: "BMW")
var seconCar = car.sale(itemNamed: "Mercedes")
var thirdCar = car.sale(itemNamed: "Freightliner")
var fourthCar = car.sale(itemNamed: "Audi")

descript(error: firstCar.0, car: firstCar.1, name: "BMW")
descript(error: seconCar.0, car: seconCar.1, name: "Mercedes")
descript(error: thirdCar.0, car: thirdCar.1, name: "Freightliner")
descript(error: fourthCar.0, car: fourthCar.1, name: "Audi")
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
let Location = [
    "Moscow" : "BMW",
    "SPB" : "Mercedes",
    "Krasnodar" : "Freightliner"
]

extension CarSaloon {

    func saleThrows(itemNamed name: String) throws {
    
    guard let item = carsIn[name] else {
        throw carsErrors.outOfTypeCar
    }
    guard item.count > 0 else {
        throw carsErrors.outOfCount
    }
    guard item.price <= cashIn else {
        throw carsErrors.lowMoney(neededMoney: item.price - cashIn)
    }
    print("Продано авто: \(item.model)")
        }
}

func saleAdress(collection: String, funcsale: CarSaloon) throws {
    if let brand = Location[collection] {
    try funcsale.saleThrows(itemNamed: brand)
        print("Салон находится в городе: \(collection)")
    }
    else {
        print("По данному адресу нет салона")
    }
}

func dotry(name: String) {
    do {
    try saleAdress(collection: name, funcsale: CarSaloon())
    }
    catch let error {
        print("Произошла ошибка: \(error.self)")
    }
}

dotry(name: "Moscow")
dotry(name: "SPB")
dotry(name: "Krasnodar")
dotry(name: "Sochi")
