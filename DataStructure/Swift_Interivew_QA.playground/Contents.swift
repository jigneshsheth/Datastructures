import UIKit

//https://www.raywenderlich.com/762435-swift-interview-questions-and-answers

//Question #1
//What are the values of tutorial1.difficulty and tutorial2.difficulty?
//Would this be any different if Tutorial was a class? Why or why not?

struct Tutorial {
	var difficulty: Int = 1
}

var tutorial1 = Tutorial()
var tutorial2 = tutorial1
tutorial2.difficulty = 2

/*
 tutorial1.difficulty is 1, whereas tutorial2.difficulty is 2.

 Structures in Swift are value types. You copy value types by value rather than reference. The following code creates a copy of tutorial1 and assigns it to tutorial2:

 var tutorial2 = tutorial1

 A change to tutorial2 is not reflected in tutorial1.

 If Tutorial were a class, both tutorial1.difficulty and tutorial2.difficulty would be 2. Classes in Swift are reference types. When you change a property of tutorial1, you’ll see it reflected in tutorial2 and vice versa.
 
 */


//Question #2
//You’ve declared view1 with var, and you’ve declared view2 with let.
//What’s the difference, and will the last line compile?


var view1 = UIView()
view1.alpha = 0.5

let view2 = UIView()
view2.alpha = 0.5 // Will this line compile?

//Yes, the last line will compile. view1 is a variable, and you can reassign it to a new instance of UIView. With let, you can assign a value only once, so the following code would not compile:

//view2 = view1 // Error: view2 is immutable

//However, UIView is a class with reference semantics, so you can mutate the properties of view2 — which means that the last line will compile:

//let view2 = UIView()
//view2.alpha = 0.5 // Yes!

//#### --------

//Question #3
//This complicated code sorts an array of names alphabetically. Simplify the closure as much as you can.


var animals = ["fish", "cat", "chicken", "dog"]
animals.sort { (one: String, two: String) -> Bool in
		return one < two
}
print(animals)

animals.sort{$0<$1}
print(animals)


/**
 The type inference system automatically calculates both the type of the parameters in the closure and the return type, so you can get rid of them:

 animals.sort { (one, two) in return one < two }

 You can substitute the $i notation for the parameter names:

 animals.sort { return $0 < $1 }

 In single statement closures, you can omit the return keyword. The value of the last statement becomes the return value of the closure:

 animals.sort { $0 < $1 }

 Finally, since Swift knows that the elements of the array conform to Equatable, you can simply write:

 animals.sort(by: <)
 */


//Question #4
//This code creates two classes: Address and Person.
//It then creates two Person instances to represent Ray and Brian.

class Address {
	var fullAddress: String
	var city: String
	
	init(fullAddress: String, city: String) {
		self.fullAddress = fullAddress
		self.city = city
	}
}

class Person {
	var name: String
	var address: Address
	
	init(name: String, address: Address) {
		self.name = name
		self.address = address
	}
}

var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
var ray = Person(name: "Ray", address: headquarters)
var brian = Person(name: "Brian", address: headquarters)


//Suppose Brian moves to the new building across the street; you'll want to update his record like this:

brian.address.fullAddress = "148 Tutorial Street"

//This compiles and runs without error. If you check the address of Ray now, he's also moved to the new building
print (ray.address.fullAddress)

//What's going on here? How can you fix the problem?
/*
 Address is a class and has reference semantics so headquarters is the same instance, whether you access it via ray or brian. Changing the address of headquarters will change it for both. Can you imagine what would happen if Brian got Ray's mail or vice versa? :]

 The solution is to create a new Address to assign to Brian, or to declare Address as a struct instead of a class.
 **/

//Question #1
//What is an optional and which problem do optionals solve?
//An optional lets a variable of any type represent a lack of value. In Objective-C, the absence of value is available only in reference types using the nil special value. Value types, such as int or float, do not have this ability.

//Swift extends the lack of value concept to both reference and value types with optionals. An optional variable can hold either a value or nil, indicating a lack of value.

//Question #2
//Summarize the main differences between a structure and a class.
//You can summarize the differences as:

//Classes support inheritance; structures don't.
//Classes are reference types; structures are value types.


//Question #3
//What are generics and which problem do they solve?

//In Swift, you can use generics in both functions and data types, e.g. in classes, structures or enumerations.

//Generics solve the problem of code duplication. When you have a method that takes one type of parameter, it's common to duplicate it to accommodate a parameter of a different type.

//For example, in the following code the second function is a "clone" of the first, except it accepts strings instead of integers.

func areIntEqual(_ x: Int, _ y: Int) -> Bool {
	return x == y
}

func areStringsEqual(_ x: String, _ y: String) -> Bool {
	return x == y
}

areStringsEqual("ray", "ray") // true
areIntEqual(1, 1) // true

//By adopting generics, you can combine the two functions into one and keep type safety at the same time. Here's the generic implementation:

func areTheyEqual<T: Equatable>(_ x: T, _ y: T) -> Bool {
	return x == y
}

areTheyEqual("ray", "ray")
areTheyEqual(1, 1)

//Since you're testing equality in this case, you restrict the parameters to any type that implements the Equatable protocol. This code achieves the intended result and prevents passing parameters of a different type.



//Question #4
//In some cases, you can't avoid using implicitly unwrapped optionals. When? Why?

//The most common reasons to use implicitly unwrapped optionals are:

//When you cannot initialize a property that is not nil by nature at instantiation time. A typical example is an Interface Builder outlet, which always initializes after its owner. In this specific case — assuming it's properly configured in Interface Builder — you've guaranteed that the outlet is non-nil before you use it.
//To solve the strong reference cycle problem, which is when two instances refer to each other and require a non-nil reference to the other instance. In such a case, you mark one side of the reference as unowned, while the other uses an implicitly unwrapped optional.


//Question #5
//What are the various ways to unwrap an optional? How do they rate in terms of safety?

var x : String? = "Test"

//Hint: There are seven ways.

//Forced unwrapping — unsafe.
//
let a: String = x!
//
//Implicitly unwrapped variable declaration — unsafe in many cases.
//
//var a = x!
//
//Optional binding — safe.
//
if let a = x {
	print("x was successfully unwrapped and is = \(a)")
}
//
//Optional chaining — safe.
//
//let a = x?.count
//
//Nil coalescing operator — safe.
//
//let a = x ?? ""
//
//Guard statement — safe.
//
//guard let a = x else {
//	return
//}
//
//Optional pattern — safe.
//
//if case let a? = x {
//	print(a)
//}


//Intermediate Written Questions
//############################################
//Question #1
//
//There is no difference, as Optional.none (.none for short) and nil are equivalent.
//
//In fact, this statement outputs true:
//
//nil == .none
//
//The use of nil is more common and is the recommended convention.


//Question #2
//Here's a model of a thermometer as a class and a struct. The compiler will complain about the last line. Why does it fail to compile?


public class ThermometerClass {
	private(set) var temperature: Double = 0.0
	public func registerTemperature(_ temperature: Double) {
		self.temperature = temperature
	}
}

let thermometerClass = ThermometerClass()
thermometerClass.registerTemperature(56.0)

public struct ThermometerStruct {
	private(set) var temperature: Double = 0.0
	public mutating func registerTemperature(_ temperature: Double) {
		self.temperature = temperature
	}
}

let thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(56.0)

/**
 The ThermometerStruct is correctly declared with a mutating function to change its internal variable temperature. The compiler complains because you've invoked registerTemperature on an instance created via let, which is therefore immutable. Change let to var to make the example compile.

 With structures, you must mark methods that change the internal state as mutating, but you cannot invoke them from immutable variables.
 */
	

//Question #3
//What will this code print and why?
	
var thing = "cars"

let closure = { [thing] in
	print("I love \(thing)")
}

thing = "airplanes"

closure()

//
//It'll print: I love cars. The capture list creates a copy of thing when you declare the closure. This means that captured value doesn't change even if you assign a new value to thing.
//
//If you omit the capture list in the closure, then the compiler uses a reference instead of a copy. Therefore, when you invoke the closure, it reflects any change to the variable. You can see this in the following code:

thing = "cars"

let closure_nonCapture = {
	print("I love \(thing)")
}

thing = "airplanes"

closure_nonCapture() // Prints: "I love airplanes"


//Question #4
//Here's a global function that counts the number of unique values in an array:
func countUniques<T: Comparable>(_ array: Array<T>) -> Int {
	let sorted = array.sorted()
	let initial: (T?, Int) = (.none, 0)
	let reduced = sorted.reduce(initial) {
		($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
	}
	return reduced.1
}


//It uses sorted, so it restricts T to types that conform to Comparable.
//
//You call it like this:

countUniques([1, 2, 3, 3]) // result is 3

//Rewrite this function as an extension method on Array so that you can write something like this
	
//You can rewrite the global countUniques(_:) as an Array extension:
extension Array where Element: Comparable {
	func countUniques() -> Int {
		let sortedValues = sorted()
		let initial: (Element?, Int) = (.none, 0)
		let reduced = sortedValues.reduce(initial) {
			($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
		}
		return reduced.1
	}
}
//Note that the new method is available only when the generic Element type conforms to Comparable.

[1, 2, 3, 3].countUniques() // should print 3


//Question #5
//Here's a function to divide two optional doubles. There are three preconditions to verify before performing the actual division:
//
//The dividend must contain a non nil value.
//The divisor must contain a non nil value.
//The divisor must not be zero.
func divide(_ dividend: Double?, by divisor: Double?) -> Double? {
	if dividend == nil {
		return nil
	}
	if divisor == nil {
		return nil
	}
	if divisor == 0 {
		return nil
	}
	return dividend! / divisor!
}

//Improve this function by using the guard statement and without using forced unwrapping.

/*
 The guard statement introduced in Swift 2.0 provides an exit path when a condition is not met. It's very helpful when checking preconditions because it lets you express them in a clear way — without the pyramid of doom of nested if statements. Here is an example:

 guard dividend != nil else { return nil }

 You can also use the guard statement for optional binding, which makes the unwrapped variable accessible after the guard statement:

 guard let dividend = dividend else { return .none }

 So you can rewrite the divide function as:

 func divide(_ dividend: Double?, by divisor: Double?) -> Double? {
	 guard let dividend = dividend else { return nil }
	 guard let divisor = divisor else { return nil }
	 guard divisor != 0 else { return nil }
	 return dividend / divisor
 }

 Notice the absence of the implicitly unwrapped operators on the last line because you've unwrapped both dividend and divisor and stored them in non-optional immutable variables.

 Note that the results of the unwrapped optionals in a guard statement are available for the rest of the code block that the statement appears in.

 You can can simplify this further by grouping the guard statements:
 */
func divide_improved(_ dividend: Double?, by divisor: Double?) -> Double? {
	guard let divisor = divisor,let dividend = dividend, divisor == 0 else {
		return nil
	}

	return dividend / divisor
}


//Question #6
//Rewrite the method from question five using an if let statement.
/*The if let statement lets you unwrap optionals and use the value within that code block. Note that you cannot access the unwrapped optional outside the block. You can write the function using an if let statement such as:
 */
func divide_improved_if(_ dividend: Double?, by divisor: Double?) -> Double? {
	if let divisor = divisor,let dividend = dividend, divisor == 0{
		return dividend / divisor
	} else {
		return nil
	}
}


//Question #1
//In Objective-C, you declare a constant like this:
//
//const int number = 0;
//
//Here is the Swift counterpart:
//
let number = 0
//
//What are the differences between them?

//A const is a variable initialized at compile time with a value or an expression that must be resolved at compilation time.
//
//An immutable created with let is a constant determined at runtime. You can initialize it with a static or a dynamic expression. This allows a declaration such as:
//
let higherNumber = number + 5
//
//Note that you can only assign its value once.


//Question #2
//To declare a static property or function, you use the static modifier on value types. Here's an example for a structure:

//struct Sun {
//	static func illuminate() {}
//}

//For classes, it's possible to use either the static or the class modifier. They achieve the same goal, but in different ways. Can you explain how they differ?
//
//static makes a property or a function static and not overridable. Using class lets you override the property or function.
//
//When applied to classes, static becomes an alias for class final.
//
//For example, in this code the compiler will complain when you try to override illuminate():

class Star {
	class func spin() {}
	static func illuminate() {}
}
class Sun : Star {
	override class func spin() {
		super.spin()
	}
	// error: class method overrides a 'final' class method
//	override static func illuminate() {
//		super.illuminate()
//	}
}



//Question #3
//Can you add a stored property to a type by using an extension? How or why not?
/*
 No, it's not possible. You can use an extension to add new behavior to an existing type, but not to alter either the type itself or its interface. If you add a stored property, you'd need extra memory to store the new value. An extension cannot manage such a task.
 */


//Question #4
//What is a protocol in Swift?

/*
 A protocol is a type that defines a blueprint of methods, properties and other requirements. A class, structure or enumeration can then adopt the protocol to implement those requirements.

 A type that adopts the requirements of a protocol conforms to that protocol. The protocol doesn't implement any functionality itself, but rather defines the functionality. You can extend a protocol to provide a default implementation of some of the requirements or additional functionality that conforming types can take advantage of.
 */



//############################################


	//Advanced Written Questions
	//############################################

//Question #1
//Consider the following structure that models a thermometer:

public struct Thermometer {
	public var temperature: Double
	public init(temperature: Double) {
		self.temperature = temperature
	}
}

//To create an instance, you can use this code:
var t: Thermometer = Thermometer(temperature:56.8)

//But it would be nicer to initialize it this way:

//var thermometer: Thermometer = 56.8

//Can you? How?
		
/*
 Swift defines protocols that enable you to initialize a type with literal values by using the assignment operator. Adopting the corresponding protocol and providing a public initializer allows literal initialization of a specific type. In the case of Thermometer, you implement ExpressibleByFloatLiteral as follows:
 
 extension Thermometer: ExpressibleByFloatLiteral {
	 public init(floatLiteral value: FloatLiteralType) {
		 self.init(temperature: value)
	 }
 }
 
 Now, you can create an instance by using a float.

 var thermometer: Thermometer = 56.8
 */


//Are closures value or reference types?
//Closures are reference types. If you assign a closure to a variable and you copy the variable into another variable, you also copy a reference to the same closure and its capture list.
		

//You use the UInt type to store unsigned integers. It implements the following initializer to convert from a signed integer:

//init(_ value: Int)
//However, the following code generates a compile time error exception if you provide a negative value:

//let myNegative = UInt(-1)

//An unsigned integer by definition cannot be negative. However, it's possible to use the memory representation of a negative number to translate to an unsigned integer. How can you convert an Int negative number into an UInt while keeping its memory representation?


//There's an initializer for that:
//UInt(bitPattern: Int)
//making the implementation:
//let myNegative = UInt(bitPattern: -1)


//Question #3
//Can you describe a circular reference in Swift? How can you solve it?
		
//A circular reference happens when two instances hold a strong reference to each other, causing a memory leak because neither of the two instances will ever be deallocated. The reason is that you cannot deallocate an instance as long as there's a strong reference to it, but each instance keeps the other alive because of its strong reference.

//You'd solve the problem by breaking the strong circular reference by replacing one of the strong references with a weak or an unowned reference.

//Question #4
//Swift allows the creation of recursive enumerations. Here's an example of such an enumeration with a Node case that takes two associated value types, T and List:
//enum List<T> {
//	case node(T, List<T>)
//}

//This returns a compilation error. What is the missing keyword?

/*
 It's the indirect keyword that allows for recursive enumeration cases like this:
*/
 enum List<T> {
	 indirect case node(T, List<T>)
 }

/*
 Question #2
 Swift has a set of pre-defined operators to perform arithmetic or logic operations. It also allows the creation of custom operators, either unary or binary.

 Define and implement a custom ^^ power operator with the following specifications:

 Takes two Ints as parameters.
 Returns the first parameter raised to the power of the second.
 Correctly evaluates the equation using the standard algebraic order of operations.
 Ignores the potential for overflow errors.

 You create a new custom operator in two steps: Declaration and implementation.

 The declaration uses the operator keyword to specify the type (unary or binary), the sequence of characters composing the operator, its associativity and precedence. Swift 3.0 changed the implementation of precedence to use a precedence group.

 Here, the operator is ^^ and the type is infix (binary). Associativity is right; in other words, equal precedence ^^ operators should evaluate the equation from right to left.

 There is no predefined standard precedence for exponential operations in Swift. In the standard order of operations for algebra, exponents should calculate before multiplication/division. So you'll need to create a custom precedence that places them higher than multiplication.

 Here's the declaration:
 */

precedencegroup ExponentPrecedence {
	higherThan: MultiplicationPrecedence
	associativity: right
}
infix operator ^^: ExponentPrecedence

//The implementation follows:
func ^^(base: Int, exponent: Int) -> Int {
	let l = Double(base)
	let r = Double(exponent)
	let p = pow(l, r)
	return Int(p)
}


//Note that since the code doesn't take overflows into account, if the operation produces a result that Int can't represent, such as a value greater than Int.max, then a runtime error occurs.


/*
 Question #3
 Consider the following code that defines Pizza as a struct and Pizzeria as a protocol with an extension that includes a default implementation for makeMargherita():
 */

struct Pizza {
	let ingredients: [String]
}

protocol Pizzeria {
	func makePizza(_ ingredients: [String]) -> Pizza
	func makeMargherita() -> Pizza
}

extension Pizzeria {
	func makeMargherita() -> Pizza {
		return makePizza(["tomato", "mozzarella"])
	}
}


//You'll now define the restaurant Lombardi’s as follows:

struct Lombardis: Pizzeria {
	func makePizza(_ ingredients: [String]) -> Pizza {
		return Pizza(ingredients: ingredients)
	}

	func makeMargherita() -> Pizza {
		return makePizza(["tomato", "basil", "mozzarella"])
	}
}
///The following code creates two instances of Lombardi's. Which of the two will make a margherita with basil?


let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

lombardis1.makeMargherita()
lombardis2.makeMargherita()


/*
 They both do. The Pizzeria protocol declares the makeMargherita() method and provides a default implementation. The Lombardis implementation overrides the default method. Since you declare the method in the protocol in both cases, you'll invoke the correct implementation at runtime.

 What if the protocol doesn't declare the makeMargherita() method but the extension still provides a default implementation, like this?

 protocol Pizzeria {
	 func makePizza(_ ingredients: [String]) -> Pizza
 }

 extension Pizzeria {
	 func makeMargherita() -> Pizza {
		 return makePizza(["tomato", "mozzarella"])
	 }
 }

 Here, only lombardis2 would make the pizza with basil, whereas lombardis1 would make a pizza without it, because it would use the method defined in the extension.
 */




//Question #4
//The following code has a compile time error. Can you spot it and explain why it happens? What are some ways you could fix it?


//struct Kitten {
//}
//
//func showKitten(kitten: Kitten?) {
//	guard let k = kitten else {
//		print("There is no kitten")
//		// return is not there
//	}
//	print(k)
//}

/*
 The else block of a guard requires an exit path, either by using return, throwing an exception or calling a @noreturn. The easiest solution is to add a return statement.

 func showKitten(kitten: Kitten?) {
	 guard let k = kitten else {
		 print("There is no kitten")
		 return
	 }
	 print(k)
 }

 Here's a version that throws an exception.

 enum KittenError: Error {
	 case NoKitten
 }

 struct Kitten {
 }

 func showKitten(kitten: Kitten?) throws {
	 guard let k = kitten else {
		 print("There is no kitten")
		 throw KittenError.NoKitten
	 }
	 print(k)
 }

 try showKitten(kitten: nil)

 Finally, here's an implementation calling fatalError(), which is a @noreturn function.

 struct Kitten {
 }

 func showKitten(kitten: Kitten?) {
	 guard let k = kitten else {
		 print("There is no kitten")
		 fatalError()
	 }
	 print(k)
 }
 */







	//############################################



