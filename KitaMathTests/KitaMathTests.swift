//
//  KitaMathTests.swift
//  KitaMathTests
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import XCTest
@testable import KitaMath

class KitaMathTests: XCTestCase {

    var viewModel:KMViewModelMain?
    var controller:KMVCMain?
    var storyboard:UIStoryboard?
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: KMVCMain.self))
        controller = storyboard?.instantiateViewController(withIdentifier: "mainVC") as? KMVCMain
        viewModel = KMViewModelMain()
    }

    override func tearDown() {
        viewModel = nil
        controller = nil
        storyboard = nil
    }

    func testFibonacci() {
        let initial:[BigNum] = (viewModel?.findFibonacci(n: 4))!
        var arrFibo = [Int]()
        for i in 0...3 {
            arrFibo.append(initial[i].arr[0])
        }
        XCTAssertEqual(initial[0].description, "0")
        XCTAssertEqual(arrFibo, [0,1,1,2])
    }
    
    func testStringToInt() {
        XCTAssertEqual(1, "1".toInt())
    }
    
    func testIntToString() {
        XCTAssertEqual("1", 1.toString())
    }
    
    func testExtensionColor() {
        XCTAssertNotNil(UIColor.init(rgb: 0xFFFFFF))
    }
    
    func testMultiply() {
        XCTAssertNotNil(viewModel?.multiply(p0: 2, p1: 4))
        XCTAssertEqual(viewModel?.multiply(p0: 2, p1: 4), 8)
    }
    
    func testPrime() {
        XCTAssertNotNil(viewModel?.findPrime(n: 4))
        XCTAssertEqual(viewModel?.findPrime(n: 4), [2,3,5,7])
    }
    
    func testSum() {
        XCTAssertNotNil(viewModel?.sum(p0: 4, p1: 5))
        XCTAssertEqual(viewModel?.sum(p0: 4, p1: 5), 9)
    }
    
    func testSumMultiplyView() {
        let sumDialog = controller?.showDialog(dialogName: "KMSumMultiply") as? KMSumMultiply
        sumDialog?.setType(type: .Sum)
        XCTAssertNotNil(sumDialog)
        controller?.showAlert(alert: sumDialog!)
        sumDialog?.fieldOne.text = "1"
        sumDialog?.fieldTwo.text = "2"
        sumDialog?.didProccedTapped()
        sumDialog?.closeTapped()
    }
    
    func testPrimeView() {
        let sumDialog = controller?.showDialog(dialogName: "KMPrime") as? KMPrime
        XCTAssertNotNil(sumDialog)
        controller?.showAlert(alert: sumDialog!)
        sumDialog?.fieldNValue.text = "4"
        sumDialog?.didProcessTapped()
        sumDialog?.closeTapped()
    }
    
    func testFibonacciView() {
        let sumDialog = controller?.showDialog(dialogName: "KMFibonacci") as? KMFibonacci
        XCTAssertNotNil(sumDialog)
        controller?.showAlert(alert: sumDialog!)
        sumDialog?.fieldNValue.text = "4"
        sumDialog?.didProcessTapped()
        sumDialog?.closeTapped()
    }
    
    func testController() {
        controller?.loadView()
        let indexPath = IndexPath(row: 1, section: 0)
        XCTAssertNoThrow(controller?.tableContents.selectRow(at: indexPath, animated: true, scrollPosition: .none)
)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
