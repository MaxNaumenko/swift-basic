//
//  main.swift
//  L1_NaumenkoMaxim
//
//  Created by Максим Науменко on 21.04.2021.
//

import Foundation

print("Решаем уравнение типа ax^2 + bx +c = 0");
let a: Double = 2;
let b: Double = 5;
let c: Double = -3;
print("Находим дискриминант")
let d = pow(b,2) - (4*a*c);
print("Дискриминант равен \(d)");
let x1 = (sqrt(Double(d)) - b)/(2*a);
let x2 = (-b - sqrt(Double(d)))/(2*a);
print("х1 равен \(x1), х2 равен \(x2)");

let side1: Double = 12;
let side2: Double = 5;
let hypotenuse: Double = sqrt(Double(pow(side1, 2) + pow(side2, 2)));
let perimeter = side1 + side2 + hypotenuse;
let square = (side1*side2)/2;
print("Вычисляем данные прямоугольного треугольника исходя из значений двух катетов a и b");
print("Гипотенуза треугольника равна \(hypotenuse)");
print("Периметр треугольника равен \(perimeter)");
print("Площадь треугольника равна \(square)");

let contsum = 25000;
let percent = 13;
var contsize = contsum + (contsum * percent)/100;
for n in 1...5{
    contsize = contsize + (contsize * percent)/100;
    print("Размер вклада на \(n) год составляет \(contsize)")
}

