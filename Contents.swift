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

