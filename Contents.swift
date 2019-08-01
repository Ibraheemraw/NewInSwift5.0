import UIKit

// What's new in Swift 5.0
// Swift Evolution (Resource) where users are able to update the swift language and see changes in the swift language
// Swift Evolution link: https://apple.github.io/swift-evolution/
// Extended String Delimiters Link: https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
// Raw Strings
// print hello with ""
let h = "hello"
print("Old way: ", "\"\(h)\"", "Uses backslash") // old
let message = #""hello""#

print("new way in 5.0: \(message)", "Uses hastags")

// String interplate
// you are adding and extra hashtag delimeter embedding \#()
let ios = "iOS"
let pmessage = #""Welcome to Pursuit's \#(ios) 6.0 cohort""#
print(pmessage)


/*
 ==============================================================================
 CHARACTERS
 ==============================================================================
 */

// Link from apple docs https://developer.apple.com/documentation/swift/character

let sentence = "🦢 Hello 1234 my n@Me i% ibrah✨?!"

for char in sentence{
    if char.isLetter {
        print("letter: \(char)")
    }
    if char.isNumber {
        print("Number: \(char)")
    }
    if char.isSymbol {
        print("Symbol: \(char)")
    }
    if char.isPunctuation {
        print("Punctuation: \(char)")
    }
}


//==========================================================================
// Review map, filter, flatmap
//==========================================================================
let tweets = [ "starting the fall cycle at #pursuit",
               "#darnclosures are killing me",
               "dreams of an #ios #developer",
               "#swiftui is dope, #iosdeveloper #mindblown"
]

// use map, filter and flatmap to return an array of hashtags
// output: ["#pursuit", "#darnclosures", "#ios", "#developer", "#swiftui", "#iosdeveloper", "#mindblown"]

// Hint: start out by writing a function to return an array of hashtags from a given String

func getHashtags(input: String) -> [String] {
    let newArray = input.components(separatedBy: " ")
    return newArray.filter{$0.starts(with: "#")}
}

let tags = tweets.map{getHashtags(input: $0)}.flatMap{$0}
print(tags)



//==========================================================================
// Review compactMap
//==========================================================================
// use compactMap to return only valid numbers from numStrings
// output: [1, 9, 54]
let numStrings = ["1","a","&","9", "54", "🎉"]

var validNumber = numStrings.compactMap{Int($0)}
print(validNumber)



//==========================================================================
// Review mapValues
//==========================================================================
// given dictionaryOfNums square each value
// output: [2: 4, 3: 9, 4: 16, 5: 25]
let dictionaryOfNums = [2: 2, 3: 3, 4: 4, 5: 5]

var doubles = dictionaryOfNums.mapValues{$0 * $0}

print(doubles)



//==========================================================================
// New in Swift 5.0: compactMapValues
//==========================================================================
let cities = ["Stockholm": true,
              "Tokyo": nil,
              "Boston": true,
              "San Francisco" : true,
              "London": nil]

// perform compactMapValues on cites to return non-nil elements
// output ["Stockholm": true, "Boston": true, "San Francisco" : true]
let validCities = cities.compactMapValues{$0}
print(validCities)

/* Warmup Question: using compactMapValues
 (1) In the grades dictionary below find and print the valid names, integer grade pairings, a letter grade is NOT valid (reminder compactMapValues performs a transformation and only returns non-nil key,value pairings)
 (2) Calculate the average of the valid grades
 
 Output:
 Valid grades: ["William": 94, "Cathy": 80, "Bernie": 65, "George": 75, "Asher": 59, "Arthur": 77]
 Average of valid grades: 75
 */

let grades = ["Cathy": "80",
              "Bertie": "A",
              "George": "75",
              "Esther": "C",
              "William": "94",
              "Asher": "59",
              "Vincent": "B",
              "Arthur": "77",
              "Bernie": "65",
              "James": "B"
]

let validGrades = grades.compactMapValues{Int($0)}// if its a valid int
print(validGrades)
let average = validGrades.values.reduce(0,+) / validGrades.values.count
print(average)

// String Interpalation Part 2
//========================================================================
struct Person {
    let name:String
    let age:Int
    let dateAdded: Date
}

let jiang = Person.init(name: "catman", age: 29, dateAdded: Date())
print("User Details: \(jiang)")

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Person){
        appendLiteral("\(value.name) is \(value.age) years old")
    }
    mutating func appendInterpolation(_ value: Person, dateFormattingStyle: DateFormatter.Style){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = dateFormattingStyle
        let dateStr = dateFormater.string(from: value.dateAdded)
        appendLiteral("\(value.name) was added to the datebase on \(dateStr)")
    }
}
print("Person details using custom interpolation: \(jiang)")
print("Person detail update \(jiang, dateFormattingStyle: .long)")


func reverseWords(_ s: String) -> String {
   let arr = s.components(separatedBy: " ")
    var rw = String()
    for word in arr {
        for letter in word {
            rw = String(letter) + rw
        }
    }
    return rw
}

let word = reverseWords("Let's take LeetCode contest")
print(word)

/*
 Write a function that takes two sorted arrays and merges them into a single array.
 
 input: [1, 3, 6, 9, 11] and [5, 8, 21, 25]
 
 output: [1, 3, 5, 6, 8, 9, 11, 21, 25]
 */

func combineArr(arr1:[Int], arr2:[Int])->[Int]{
//    var combinedArr = [Int]()
//    combinedArr = arr1 + arr2
//    sortArr(combinedArr)
//    return combinedArr
    var leftIndex = 0
    var rightIndex = 0
    var results = [Int]()
    
    while leftIndex < arr1.count && rightIndex < arr2.count{
        let leftElement = arr1[leftIndex]
        let rightElement = arr2[rightIndex]
        if leftElement < rightElement { // add left element to results arr first
            results.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement { // add right first
            results.append(rightElement)
            rightIndex += 1
        } else { // add them both to the results
            results.append(leftElement)
            leftIndex += 1
            results.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < arr1.count {
        results.append(contentsOf: arr1[leftIndex...])
    }
    if rightIndex < arr2.count {
        results.append(contentsOf: arr2[rightIndex...])
    }
    return results
}



let a = [1, 3, 6, 9, 11]
let b = [5, 8, 21, 25]
let results = combineArr(arr1: a, arr2: b)
print(results)
