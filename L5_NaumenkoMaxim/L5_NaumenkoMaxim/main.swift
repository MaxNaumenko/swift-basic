//
//  main.swift
//  L5_NaumenkoMaxim
//
//  Created by Максим Науменко on 02.05.2021.
//

import Foundation

enum Country {
    case USA, England, France
}
enum Year: String {
    case new = "2021"
    case old = "2020"
}
enum Engine {
    case on, off
}
enum Windows {
    case open, closed
}

protocol Car {
    var country: Country {get}
    var year: Year {get}
    var trunkSize: Double {get}
    var engine: Engine {get set}
    var windows: Windows {get set}
    var trunkCondition: Double {get set}
    
    func action()
}

extension Car {
    mutating func openCloseWindows() {
        switch windows {
        case .open:
            self.windows = .closed
            print("Окна закрыты")
        case .closed:
            self.windows = .open
            print("Окна открыты")
        }
    }
    mutating func startStopEngine() {
        switch engine {
        case .on:
            self.engine = .off
            print("Двигатель заглушен")
        case .off:
            self.engine = .on
            print("Двигатель заведен")
        }
    }
}
class TrunkCar: Car {
    enum Trailer: String {
        case attach = "Присоединен"
        case detach = "Отсоединен"
    }
    enum AWD {
        case on, off
    }
    var trailer: Trailer
    var awd: AWD
    var country: Country
    var year: Year
    var trunkSize: Double
    var engine: Engine
    var windows: Windows
    var trunk: Double
    var trunkCondition: Double {
        get {
            return trunk
        }
        set {
            trunk = newValue + trunk
            print("Багажник заполнен на \(trunk) литров")
        }
    }
    
    init(country: Country, year: Year, trunkSize: Double, engine: Engine, windows: Windows, trunk: Double, trailer: Trailer, awd: AWD) {
        self.country = country
        self.year = year
        self.trunkSize = trunkSize
        self.engine = engine
        self.windows = windows
        self.trunk = trunk
        self.trailer = trailer
        self.awd = awd
    }
    func actionWithTrailer() {
        switch trailer {
        case .attach:
            self.trailer = .detach
            print("Прицеп отсоединен")
        case .detach:
            self.trailer = .attach
            print("Прицеп присоединен")
        }
    }
    func action() {
        switch awd {
        case .on:
            self.awd = .off
            print("Режим AWD выключен")
        case .off:
            self.awd = .on
            print("Режим AWD включен")
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовой автомобиль производства \(country), \(year.rawValue) года выпуска, объем багажника равен \(trunkSize), двигатель \(engine), окна \(windows), багажник заполнен на \(trunk) литров, прицеп \(trailer.rawValue), режим AWD \(awd)"
    }
}

class SportCar: Car {
    enum Hatchstate {
            case open, closed
        }
    enum Sportsmode {
            case on, off
        }
    var hatchState: Hatchstate
    var sportsmode: Sportsmode
    var country: Country
    var year: Year
    var trunkSize: Double
    var engine: Engine
    var windows: Windows
    var trunk: Double
    var trunkCondition: Double {
        get {
            return trunk
        }
        set {
            trunk = newValue + trunk
            print("Багажник заполнен на \(trunk) литров")
        }
    }
    init(country: Country, year: Year, trunkSize: Double, engine: Engine, windows: Windows, trunk: Double, hatchState: Hatchstate, sportsmode: Sportsmode) {
        self.country = country
        self.year = year
        self.trunkSize = trunkSize
        self.engine = engine
        self.windows = windows
        self.trunk = trunk
        self.hatchState = hatchState
        self.sportsmode = sportsmode
    }
    func actionWithHatchstate() {
        switch hatchState {
        case .open:
            self.hatchState = .closed
            print("Люк закрыт")
        case .closed:
            self.hatchState = .open
            print("Люк открыт")
        }
    }
    func action() {
        switch sportsmode {
        case .on:
            self.sportsmode = .off
            print("Спортивный режим выключен")
        case .off:
            self.sportsmode = .on
            print("Спортивный режим включен")
        }
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль производства \(country), \(year.rawValue) года выпуска, объем багажника равен \(trunkSize), двигатель \(engine), окна \(windows), багажник заполнен на \(trunk) литров, люк \(hatchState), спортивный режим \(sportsmode)"
    }
}

var car1 = TrunkCar(country: .France, year: .old, trunkSize: 400.0, engine: .on, windows: .open, trunk: 50.0, trailer: .attach, awd: .on)
print(car1)
car1.startStopEngine()
car1.openCloseWindows()
car1.trunkCondition = 40
car1.action()
car1.actionWithTrailer()
print(car1)

var car2 = SportCar(country: .England, year: .new, trunkSize: 150.0, engine: .off, windows: .closed, trunk: 10.0, hatchState: .closed, sportsmode: .off)
print(car2)
car2.startStopEngine()
car2.openCloseWindows()
car2.trunkCondition = 50
car2.action()
car2.actionWithHatchstate()
print(car2)
