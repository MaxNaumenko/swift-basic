//
//  main.swift
//  L4_NaumenkoMaxim
//
//  Created by Максим Науменко on 27.04.2021.
//

import Foundation

class car {
    let country: Country
    let year: Year
    let trunksize: Double
    var engine: Engine
    var windows: Windows
    var filledTrunk: Double
    
    init(country: Country, year: Year, trunksize: Double, engine : Engine, windows: Windows, filledTrunk: Double) {
        self.country = country
        self.year = year
        self.trunksize = trunksize
        self.engine = engine
        self.windows = windows
        self.filledTrunk = filledTrunk
    }
    enum Country {
        case USA, Germany, France, UK, Russia
    }
    enum Year: String {
        case old = "2020"
        case new = "2021"
    }
    enum Engine {
        case on, off
    }
    enum Windows {
        case open, closed
    }
    func startEngine() {
        
    }
}

class Sportcar: car {
    var hatchState: Hatchstate
    var sportsmode: Sportsmode
    init(country: Country, year: Year, trunksize: Double, engine : Engine, windows: Windows, filledTrunk: Double, hatchState: Hatchstate, sportsmode: Sportsmode) {
        self.hatchState = hatchState
        self.sportsmode = sportsmode
        super.init(country: country, year: year, trunksize: trunksize, engine: engine, windows: windows, filledTrunk: filledTrunk)
    }
    enum Hatchstate {
        case open, close
    }
    enum Sportsmode {
        case on, off
    }
    override func startEngine() {
        super.startEngine()
        if sportsmode == .on {
            print("Спортивный режим включен")
        }
        else {
            print("Включен обычный режим")
        }
    }
    func openhatchstate() {
        self.hatchState = .open
        print("Люк открыт")
    }
    func closehatchstate() {
        self.hatchState = .close
        print("Люк закрыт")
    }
    func description() {
        print("Спортивный автомобиль производства \(country), \(year.rawValue) года выпуска, объем багажника равен \(trunksize), двигатель \(engine), окна \(windows), багажник заполнен на \(filledTrunk) литров, люк \(hatchState), спортивный режим \(sportsmode)")
        }
}

class Trunkcar: car {
    var trailer: Trailer
    var awd: AWD
    init(country: Country, year: Year, trunksize: Double, engine : Engine, windows: Windows, filledTrunk: Double, trailer: Trailer, awd: AWD) {
        self.trailer = trailer
        self.awd = awd
        super.init(country: country, year: year, trunksize: trunksize, engine: engine, windows: windows, filledTrunk: filledTrunk)
    }
    enum Trailer: String {
        case attach = "Присоединен"
        case detach = "Отсоединен"
    }
    enum AWD {
        case on, off
    }
    override func startEngine() {
        super.startEngine()
        self.trailer = .attach
        print("Прицеп присоединен")
    }
    func detach() {
        self.trailer = .detach
        print("Прицеп отсоединен")
    }
    func description() {
        print("Грузовой автомобиль производства \(country), \(year.rawValue) года выпуска, объем багажника равен \(trunksize), двигатель \(engine), окна \(windows), багажник заполнен на \(filledTrunk) литров, прицеп \(trailer.rawValue), режим AWD \(awd)")
        }
}

var car1 = Trunkcar(country: .USA, year: .new, trunksize: 600.0, engine: .on, windows: .open, filledTrunk: 0.0, trailer: .attach, awd: .off)
car1.description()
car1.detach()
car1.startEngine()
car1.description()

var car2 = Sportcar(country: .Germany, year: .old, trunksize: 50, engine: .off, windows: .closed, filledTrunk: 0.0, hatchState: .open, sportsmode: .on)
car2.description()
car2.startEngine()
car2.closehatchstate()
car2.description()
