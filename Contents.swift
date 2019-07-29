import UIKit

// What's new in Swift 5.0
// Swift Evolution (Resource) where users are able to update the swift language
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
