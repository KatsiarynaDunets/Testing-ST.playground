/*:
 ## Упражнение - приведение типов и их контроль

 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
import Foundation

let things: [Any] = [42, 5, true, "apple", 14.6, false] //создаю коллекцию
print(things)
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for thing in things {
    if thing is Int {
        print("Целое число \(thing)")
    } else if thing is Double {
        print("Вещественное число \(thing)")
    } else if thing is String {
        print("Строкa \(thing)")
    } else if thing is Bool {
        print("Булевое значение \(thing)")
    } else {
        print("\(thing) относится к какому-то непонятному типу :(")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */
let collection: [String: Any] = [
    "Life answer": 42,
    "Fingers": 5,
    "True": true,
    "Fruit": "apple",
    "sm": 14.6,
    "False": false
]

for (key, value) in collection {
    print("\(key): \(value)") // Выводим крассиво на консоль пары ключ/значения для всех элементов коллекции dict.
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total = 0.0
for value in collection.values {
    switch value {
    case let strValue as String:
        total += 1
    case let boolsValue as Bool:
        total += boolsValue ? 2 : -3 // можно еще через if / else
    case let integValue as Int:
        total += Double(integValue)
    case let doublValue as Double:
        total += doublValue
    default:
        continue
    }
}

print("Total result is: \(total)")

/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
var total1 = 0.0

for value1 in collection.values {
    switch value1 {
    case let integVal as Int:
        total1 += Double(integVal)
    case let doublVal as Double:
        total1 += doublVal //пробую сконвертировать Double и добавить его в общее число
    case let strVal as String:
        if let converted = Double(strVal) {
            total1 += converted //пробую сконвертировать String и добавить его в общее число - но ничего не выходит
        }
    default:
        continue
    }
}

print("Total result now is: \(total1)")
