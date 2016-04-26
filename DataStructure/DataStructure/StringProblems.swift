//
//  StringProblems.swift
//  DataStructure
//
//  Created by Jigs Sheth on 4/24/16.
//  Copyright © 2016 jigneshsheth.com. All rights reserved.
//

import Foundation


/**
 Check the given 2 string are permutaion of each other. 
  both strings has to be the same lenght 
  "ABC" is permutatino of "CBA"
 
 - parameter string1:
 - parameter string2:
 
 - returns: true if string1 and string2 is permutation of each other
 */
public func stringPermutation(string1:String,string2:String) -> Bool{
  if string1.characters.count != string2.characters.count {
    return false
  } else if string1 == string2 {
    return true
  }
  return string1.characters.sort() == string2.characters.sort()
}

/**
 This is the solution using dictionary
 
 - parameter string1:
 - parameter string2:
 
 - returns: true if string1 and string2 is permutation of each other
 */
public func stringPermutationWithDictionary(string1:String,string2:String) -> Bool{
  let string1Chars = string1.characters
  let string2Chars = string2.characters
  if string1Chars.count != string2Chars.count {
    return false
  } else if string1 == string2 {
    return true
  }
  
  var dict:[Character:Int] = [:]
  
  for char in string1Chars {
    if let count =  dict[char]  {
      dict[char] = count + 1
    }else {
      dict[char] = 1
    }
  }
  
  for char in string2Chars {
    if let count =  dict[char] where count != 0  {
      dict[char] = count - 1
      if (count - 1) == 0 {
        dict.removeValueForKey(char)
      }
    }else {
      return false
    }
    
  }
  return dict.isEmpty
}



/**
 Return the count of perticular char in string
 
 - parameter str:  input string
 - parameter char: char going to be search
 
 - returns: count of char
 */
public func countCharactersInString(str:String,char:Character) -> Int {
  
  if !str.characters.contains(char) {
    return 0
  }

  var counter = 0
  for c in str.characters {
    if c == char {
      counter += 1
    }
  }
  return counter
}

/**
  Count the substring occurance in given String
 
 - parameter str:    Input String
 - parameter subStr: finding String
 
 - returns: number of occurance of substring
 */

public func countSubStringInString(str:String,subStr:String) -> Int {
//System func works fine
//  let tok =  str.componentsSeparatedByString(subStr)
//  return tok.count-1
  
  var counter = 0
  var index = 0
  let length = str.characters.count
  let subStringLength = subStr.characters.count
  var end = subStringLength
  let stringArray = Array(str.characters)
  while index < length - subStringLength {
    if String(stringArray[index..<end]) == subStr {
      counter += 1
      index = end
      end += subStringLength
    }else {
      index += 1
      end += 1
    }
  }
  return counter
}



