//
//  main.swift
//  L3_NaumenkoMaxim
//
//  Created by Максим Науменко on 25.04.2021.
//

import Foundation

enum Brand: String {
    case Pagani, Mclaren, Porsche, Lotus, Renault, Mercedes
}

enum Year: String {
    case old = "2020"
    case new = "2021"
}

enum Engine {
    case on, off
}

enum Windows {
    case open, close
}

struct Sportcar {
    let brand: Brand
    let year: Year
    let trunksize: Double
    var engine: Engine {
        willSet {
            if newValue == .on
            {
                print("Двигатель сейчас запустится")
            }
            else
            {
                print("Двигатель будет заглушен")
            }
        }
    }
    mutating func startEngine() {
        self.engine = .on
    }
    mutating func stopEngine() {
        self.engine = .off
    }
    var windows: Windows {
        willSet {
            if newValue == .open
            {
                print("Окна сейчас откроются")
            }
            else
            {
                print("Окна сейчас закроются")
            }
        }
    }
    var filledTrunk: Double {
        didSet {
            let size = filledTrunk - oldValue
            print("Багажник заполнен на \(size) литров")
        }
    }
    func description() {
        print("Легковой автомобиль марки \(brand), \(year.rawValue) года выпуска, объем багажника равен \(trunksize), двигатель \(engine), окна \(windows), багажник заполнен на \(filledTrunk) литров")
    }
}

struct TrunkCar {
    let brand: Brand
    let year: Year
    let trunksize: Double
    var engine: Engine {
        willSet {
            if newValue == .on
            {
                print("Двигатель сейчас запустится")
            }
            else
            {
                print("Двигатель будет заглушен")
            }
        }
    }
    mutating func startEngine() {
        self.engine = .on
    }
    mutating func stopEngine() {
        self.engine = .off
    }
    var windows: Windows {
        willSet {
            if newValue == .open
            {
                print("Окна сейчас откроются")
            }
            else
            {
                print("Окна сейчас закроются")
            }
        }
    }
    var filledTrunk: Double {
        didSet {
            let size = filledTrunk - oldValue
            print("Багажник заполнен на \(size) литров")
        }
    }
    func description() {
        print("Грузовой автомобиль марки \(brand), \(year.rawValue) года выпуска, объем багажника равен \(trunksize), двигатель \(engine), окна \(windows), багажник заполнен на \(filledTrunk) литров")
    }
}

var car1 = Sportcar(brand: .Pagani, year: .new, trunksize: 150.0, engine: .off, windows: .close, filledTrunk: 0.0)
var car2 = TrunkCar(brand: .Mercedes, year: .old, trunksize: 500.0, engine: .on, windows: .open, filledTrunk: 0.0)
car1.description()
car2.description()
car1.stopEngine()
car1.startEngine()
car2.windows = .close
car2.filledTrunk = 400
car2.description()
