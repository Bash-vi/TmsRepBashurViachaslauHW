import UIKit


// MARK: append Algorithmic complexity
var numbers = [1, 2, 3, 4, 5]
    numbers.append(100)
    print(numbers)
     // Prints "[1, 2, 3, 4, 5, 100]"
// Complexity: O(1) on average, over many calls to `append(_:)` on the same collection.

var numbers1 = [1, 2, 3, 4, 5]
     numbers1.append(contentsOf: 10...15)
     print(numbers1)
     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
// Complexity: O(*m*), where *m* is the length of `newElements`.
// m -  длина значений элементов


// MARK: reverse and reversed Algorithmic complexity
     var characters: [Character] = ["C", "a", "f", "é"]
     characters.reverse()
     print(characters)
     // Prints "["é", "f", "a", "C"]"
// Complexity: O(*n*), where *n* is the number of elements in the collection.

let word = "Backwards"
     for char in word.reversed() {
         print(char, terminator: "")
     }
     // Prints "sdrawkcaB"
let reversedWord = String(word.reversed())
     print(reversedWord)
     // Prints "sdrawkcaB"
// Complexity: O(1)


// MARK: map Algorithmic complexity
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
     let lowercaseNames = cast.map { $0.lowercased() }
     // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
     let letterCounts = cast.map { $0.count }
     // 'letterCounts' == [6, 6, 3, 4]
// Complexity: O(*n*), where *n* is the length of the sequence.


// MARK: compactMap Algorithmic complexity
let possibleNumbers = ["1", "2", "three", "///4///", "5"]
     let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
     // [1, 2, nil, nil, 5]
     let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
     // [1, 2, 5]
// Complexity: O(*n*), where *n* is the length of this sequence.


// MARK: sorted Algorithmic complexity
let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
     let sortedStudents = students.sorted()
     print(sortedStudents)
     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
let descendingStudents = students.sorted(by: >)
     print(descendingStudents)
     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
// Complexity: O(*n* log *n*), where *n* is the length of the sequence.
