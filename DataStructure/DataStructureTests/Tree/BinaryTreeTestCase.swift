	//
	//  BinaryTreeTestCase.swift
	//  DataStructureTests
	//
	//  Created by Jigs Sheth on 11/13/21.
	//  Copyright © 2021 jigneshsheth.com. All rights reserved.
	//

import XCTest
@testable import DataStructure

class BinaryTreeTestCase: XCTestCase {
	
	
	var binaryTree:BinaryNode<Int> = {
		let zero = BinaryNode(0)
		let seven = BinaryNode(7)
		let one = BinaryNode(1)
		let six = BinaryNode(6)
		let eight = BinaryNode(8)
		let nine = BinaryNode(9)
		let three = BinaryNode(3)
		
		six.leftChild = one
		six.rightChild = eight
		one.leftChild = zero
		one.rightChild = three
		eight.leftChild = seven
		eight.rightChild = nine
		
		return six
	}()
	
	override func setUpWithError() throws {
	}
	
	
	func test_visualTree() throws {
		print(binaryTree.description)
	}
	
	func test_traversalInOrder() throws {
		var testArray:[Int] = []
		binaryTree.traversalInOrder{testArray.append($0)}
		XCTAssertEqual(testArray, [0,1,3,6,7,8,9])
	}
	
	func test_traversalPreOrder() throws {
		var testArray:[Int] = []
		binaryTree.traversalPreOrder{testArray.append($0)}
		XCTAssertEqual(testArray, [6,1,0,3,8,7,9])
	}
	
	func test_traversalPostOrder() throws {
		var testArray:[Int] = []
		binaryTree.traversalPostOrder{testArray.append($0)}
		XCTAssertEqual(testArray, [0,3,1,7,9,8,6])
	}
	
}
