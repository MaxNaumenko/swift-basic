//
//  main.swift
//  L2_NaumenkoMaxim
//
//  Created by Максим Науменко on 21.04.2021.
//

import Foundation

//Функция, определяющая четное число или нет
func evenNumber() {
    print("Введите целое число");
    let number = readLine()!
    if let num = Int(number)
    {
        if num % 2 == 0
        {
            print("\(number) - четное число")
        }
        else
        {
            print("\(number) - нечетное число")
        }
    }
    else
    {
        print("Нужно было ввести число")
    }
}
evenNumber()

// Функция, определяющая, делится ли число без остатка на 3
func divisionWithoutRemainder() {
    print("Введите целое число");
    let count = readLine()!;
    if let num = Int(count)
    {
        if num % 3 == 0
        {
            print("\(count) делится на 3 без остатка")
        }
        else
        {
            let remainder = Int(count)! % 3;
            print("\(count) не делится на 3 без остатка, остаток \(remainder)")
        }
    }
    else
    {
        print("Нужно было ввести число")
    }
}
divisionWithoutRemainder()

// Возрастающий массив из 100 чисел
var array = [Int]();
for number in 1...100 {
    array.append(number)
}
print(array);

// Создание нового массива из старого без четных чисел и чисел, которые не делятся на 3
var array2 = [Int]();
for number in 0...(array.count - 1) {
    if array[number] % 3 == 0 && array[number] % 2 != 0
    {
        array2.append(array[number])
    }
}
print(array2);

// Второй вариант через удаление четных чисел и чисел, которые не делятся на 3
for number in array {
    if number % 2 == 0 || number % 3 != 0
    {
        array.remove(at: array.firstIndex(of: number)!)
    }
}
print(array)

// Функция, которая добавляет в массив новое число Фибоначии
func fibonacci(_ array : [Int]) -> [Int] {
    var newArray = array
    for number in 0...49 {
    newArray.append(newArray[number] + newArray[number + 1])
    }
    return newArray
}

var arr = [0,1]
print(fibonacci(arr))

