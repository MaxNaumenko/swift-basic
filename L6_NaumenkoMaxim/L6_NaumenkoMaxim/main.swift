//
//  main.swift
//  L6_NaumenkoMaxim
//
//  Created by Максим Науменко on 05.05.2021.
//

import Foundation

struct Salads: CustomStringConvertible {
    var component1: String
    var component2: String
    var description: String {
        return "Компонент1 = \(component1), Компонент2 = \(component2)"
    }
    func doSalad() -> String {
        return component1 + " " + component2
    }
}

struct Queue<T> {
    var products: [T] = []
    
    mutating func pushProducts(_ product: T) {
        products.append(product)
    }
    mutating func popProducts() -> T? {
        return products.removeFirst()
    }
    //Помогите разобраться, как добавить в такую структуру сабскрипт
}

var queue = Queue<Salads>()
queue.pushProducts(Salads(component1: "tomato", component2: "cucumber"))
queue.pushProducts(Salads(component1: "beet", component2: "cheese"))
queue.pushProducts(Salads(component1: "carrot", component2: "cheese"))
var ingridients = Salads(component1: queue.products[0].component1, component2: queue.products[0].component2)
var mix = ingridients.doSalad()
print(mix)
//Как в данном случае убрать из массива салатов салаты, содержащие сыр?
print("Салаты деаются из следующих наборов продуктов: \(queue.products)")
queue.popProducts()
print("Салаты деаются из следующих наборов продуктов: \(queue.products)")
if let leftProduct = queue.popProducts() {
queue.products.insert(leftProduct, at: queue.products.count)
}
print("Салаты деаются из следующих наборов продуктов: \(queue.products)")
if let leftProduct = queue.popProducts() {
print(leftProduct)
}


struct Films {
    var a = ["Rush Hour", "Titanik", "Iron man"]
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0: return a[0]
            case 1: return a[1]
            case 2: return a[2]
            default: return nil
            }
        }
        set {
            switch index {
            case 0: a[0] += " \(String(describing: newValue!))"
            case 1: a[1] += " \(String(describing: newValue!))"
            case 2: a[2] += " \(String(describing: newValue!))"
            default: break
            }
        }
    }
    // Почему этот сабскрипт не может в таком виде самостоятельно существовать без сабскрипта выше?
    subscript(index: Int, phrase: String) -> String {
        var text = self[index]
        text! += " " + phrase
        return text!
    }
}

var filmToSee = Films()
func descriptionFilms() {
var i = 0
while filmToSee[i] != nil {
    print(filmToSee[i]!)
    i += 1
}
}
descriptionFilms()
filmToSee[0] = "1998"
filmToSee[1] = "1997"
filmToSee[2] = "2008"
descriptionFilms()

print(filmToSee.a)

//Не смог сделать тоже самое через for in, покажите, как должен выглядеть код с for in
var i = 0
while i < filmToSee.a.count {
print(filmToSee[i, "год выпуска"])
i += 1
}
