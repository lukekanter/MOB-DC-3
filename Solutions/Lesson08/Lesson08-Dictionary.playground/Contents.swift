// Declare Dictionary (Long Way)
let constDict = Dictionary<String, String>(dictionaryLiteral: ("devin", "white"), ("luke", "navy blue"))

// Declare Dictionary (Short Way)
var dict = ["luke": "navy blue", "devin": "white"]
dict["kris"] = "lime green"
dict["luke"] = "black"
dict

dict.count
dict.keys.array
dict.values.array

dict.removeValueForKey("luke")
dict


var people = ["Arthur": 29, "Thomas": 23]


var profile: [String: AnyObject] = ["Name": "Arthur", "Age": 29, "Location": "DC"]















///*
//    Constant Dictionary
//    Initialized to accepts keys made of Strings, and values made of Strings
//    However, it's empty.
//*/
//var constDict = ["A": "a", "B": "b"]
//
//
///*
//    Variable Dictionary
//    Initialized to accepts keys made of Strings, and values made of Strings
//    However, it's empty.
//*/
//var dict = ["A": "1", "B": "2", "C": "3"]
//
//// Check if empty
//dict.isEmpty
//
//// Check total count (counts number of key-value pairs)
//dict.count
//
//// Array of Keys from the Dictionary
//constDict.keys.array
//
//// Array of Values from the Dictionary
//constDict.values.array
//
//// Remove a value
//let removedValue = dict.removeValueForKey("B")
//
//// Add or Update a value
//dict.updateValue("4", forKey: "C")
//
//// Remove All
//dict.removeAll(keepCapacity: false)
