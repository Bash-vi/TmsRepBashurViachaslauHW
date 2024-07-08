import UIKit

//1. Написать функцию, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
//должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.
func zadanie(_ number:Int) -> String {
   return "\nЗАДАНИЕ - \(number)\n"
    }
print(zadanie(1))


                                                                                    //greeting - приветствие
func greeting() {
    print("Hello, world!")
}
greeting()

func Hi(_ name: String) -> String {
    return "Hello, \(name)"
}
print (Hi("Misha"))

func Hi2(name: String) -> String {
    return "Hello! \(name)"
}
Hi2(name: "Natasha")





//2. Написать функцию, которая принимает две строки и возвращает сумму количества
//символов двух строк.
print(zadanie(2))                                                                   //<--- прикольно)

func sumChar(str1: String, str2: String) -> Int {
    return str1.count + str2.count
}
sumChar(str1: "deth", str2: "pool" )
print("вернул")






//3. Написать функцию, которая выводит в консоль квадрат переданного числа.
print(zadanie(3))

func squarenum(num: Int) -> String {
    return "Квадрат \(num) равен \(num * num)"
}
print(squarenum(num: 4))





//4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа
//sum(num1:num2:).
print(zadanie(4))

let sum: (Int, Int) -> Int = { num1, num2 in
    return num1 + num2
}
let subtracting: (Int, Int) -> Int = { num1, num2 in
    return num1 - num2
}
func multiplication(num1: Int, num2: Int) -> Int {
    return num1 * num2
}
func dividing(num1: Int, num2: Int) -> Int {
    return num1 / num2
}

func variable(num1: Int, num2: Int, closure: (Int, Int) -> Int) -> Int {
    return closure(num1, num2)
}

multiplication(num1: 3, num2: 3)
dividing(num1: 12, num2: 4)

variable(num1: 8, num2: 4, closure: sum)
variable(num1: 3, num2: 8, closure: subtracting)

variable(num1: 7, num2: 3, closure: {num1, num2 in
    return num1 * num2})
variable(num1: 15, num2: 5, closure: {num1, num2 in
    return num1 / num2})


print("создал + замыкание")





//5. Создать функцию, которая принимает параметры и вычисляет площадь круга.   S = π × r(квадрат)
print(zadanie(5))

let pi: Double = 3.14
func areacircle(radius:Double) -> Double {
    return pi * (radius * radius)
}
areacircle(radius: 33)
print("вычеслил")





//6. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток.
print(zadanie(6))

func night(isItNightNow: Bool) -> String {
    return if isItNightNow == true {
        "сейчас ночь"
    } else {
        "сейчас день"
    }
}
print(night(isItNightNow: true))



func night2(hours timeNow: Int) -> String {
    return  if timeNow >= 7 && timeNow <= 10 {
        "Утро"
    } else if timeNow >= 11 && timeNow <= 17 {
        "День"
    } else if timeNow >= 18 && timeNow <= 22 {
        "Вечер"
    } else {
        "Ночь"
    }
}
print(night2(hours: 8))
print(night2(hours: 14))
print(night2(hours: 22))
print("Сейчас \(night2(hours: 2))")





//7. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
//true, если оно простое, и false, если сложное.
print(zadanie(7))
 
func simpleOrNot(numbers: Int) -> Bool {
    guard numbers >= 2 && numbers <= 100 else { return false }
    
    if numbers % 2 > 0 && numbers % 3 > 0 { return true }
    if numbers <= 3 {return true}
    else {return false}
}
simpleOrNot(numbers: 2)
simpleOrNot(numbers: 3)
simpleOrNot(numbers: 5)
simpleOrNot(numbers: 7)
simpleOrNot(numbers: 11)
simpleOrNot(numbers: 13)
simpleOrNot(numbers: 17)
simpleOrNot(numbers: 8)
simpleOrNot(numbers: 40)
simpleOrNot(numbers: 89)
simpleOrNot(numbers: 83)
simpleOrNot(numbers: 6)
simpleOrNot(numbers: 101)


func simpleOrNot1(numbers1: Int) -> Bool {
    guard numbers1 >= 2 && numbers1 <= 100 else { return false }
   
    for del in 2..<numbers1 {
        if numbers1 % del == 0 {
            return false
        }
    }
    return true
}
simpleOrNot1(numbers1: 2)
simpleOrNot1(numbers1: 3)
simpleOrNot1(numbers1: 5)
simpleOrNot1(numbers1: 7)
simpleOrNot1(numbers1: 8)
simpleOrNot1(numbers1: 6)
print("Работает")







//8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
//осень).
print(zadanie(8))


func months(month: Int) -> String {
    var yeartime: String
     switch month {
    case 1...2, 12:
        yeartime = "Зима"
     case 3...5:
        yeartime = "Весна"
     case 6...8:
        yeartime = "Лето"
     case 9...11:
        yeartime = "Осень"
    default:
        yeartime = "non"
         
    }
    return yeartime
}
months(month: 5)


func months1(month1: Int) -> String {
    var yeartime1: String
   switch month1 {
   case 12, 1, 2:
        yeartime1 = "Зима"
    case 3, 4, 5:
        yeartime1 = "Весна"
    case 6, 7, 8:
        yeartime1 = "Лето"
    case 9, 10, 11:
        yeartime1 = "Осень"
    default:
        yeartime1 = "Нет такого месяца"
       }
    return yeartime1
}
print(months1(month1: 13))
print("вернул время года")






//9*. Создать функцию, которая считает факториал введённого числа.
print(zadanie(9))



func factorial(numb: Int) -> Int {
    var answer = 1
    for index in 1...numb {
          answer *= index
        }
  return answer
}
factorial(numb: 10)



func factorial1(numb1: Int) -> Int {
    if numb1 == 0 {return 1}
    else {
      return numb1 * factorial1(numb1:numb1 - 1)
    }
}
factorial1(numb1: 5)


//выз factorial1(numb1: 5) --- идет в else return numb1 (5) * factorial1(numb1:numb1 - 1) (4) = возвращает 20
//                         --- 4 снова идет в factorial1(numb1:numb1 - 1) (3) и * на возвращенные 20 = возвращает 60
                      //   --- уже 3 идет в factorial1(numb1:numb1 - 1) (2) и * на возвращенные 60 = возвращает 120
//                         --- и там 2-1=1 * 120 -> 1-1 = 0 возвр 1 и * 120

                //  вроде так работает
print("как-то так")






//10*. Создать функцию, которая выводит все числа последовательности Фибоначчи до
//введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8
print(zadanie(10))



//func fibloop(_ n: Int, loop: inout Int) {            //<--- чет не выходит так(
//    var loop = n
//    if loop < 0 {
//        loop -= 1
//        fibloop(n, loop: &loop)
//        print(fibanaci(n))
//        func fibanaci(_ n: Int) -> Int {
//            var f1 = 0
//            var f2 = 1
//
//            for _ in 1..<n {
//                let f = f1 + f2
//                f1 = f2
//                f2 = f
//            }
//            return f2
//        }
//    }
//}


func fibanaci(_ n: Int) -> Int {
        var f1 = 0
        var f2 = 1
        for _ in 1..<n {
            let f = f1 + f2
            f1 = f2
            f2 = f
        }
        return f2
    }
    fibanaci(6)



func fibanaci1(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    else {
        return fibanaci1(n - 1) + fibanaci1(n - 2)
    }
}
fibanaci1(6)



func fibloop(_ n: Int) -> [Int] {
    func fibanaci1(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        else {
            return fibanaci1(n - 1) + fibanaci1(n - 2)
        }
    }
    return (0...n).map { fibanaci1($0) }
}
print(fibloop(6))


//11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции
print(zadanie(11))


func sum0000(number: Int) -> Int {
    
    var numstr = String(number)
    var array = [Int]()
    for char in numstr {
        if let char = Int(String(char)) {
            array.append(char)
        }
    }
    let summ = array.reduce(0) {acc, next in
        return acc + next}
    return summ
}

print(sum0000(number: 12345678))
       

