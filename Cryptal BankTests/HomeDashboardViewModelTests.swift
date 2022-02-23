//
//  HomeDashboardViewModelTests.swift
//  Cryptal BankTests
//
//  Created by Irakli Chkhitunidzde on 24.02.22.
//

import XCTest
@testable import Cryptal_Bank

class HomeDashboardViewModelTests: XCTestCase {
    
    private var viewModel: HomeDashboardViewModelProtocol!
    
    override func setUpWithError() throws {
        viewModel = HomeDashboardViewModel()
    }
    
    func testBalanseHidenStatusMustChangeInDatabase(){
        let expectation = XCTestExpectation(description: "API responce got")
        
        viewModel.isHidenSingle(){ [unowned self] isHiden in
            var hiden = isHiden
            hiden.toggle()
            viewModel.balance(hide: hiden)
            viewModel.isHidenSingle(){ balanceIsHiden in
                XCTAssertEqual(balanceIsHiden, hiden)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testBalanseHidenStatusMustNotChangeInDatabase(){
        let expectation = XCTestExpectation(description: "API responce got")
        
        viewModel.isHidenSingle(){ [unowned self] isHiden in
            let hiden = isHiden
            
            viewModel.balance(hide: hiden)
            viewModel.isHidenSingle(){ balanceIsHiden in
                XCTAssertEqual(balanceIsHiden, hiden)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testBalanseHidenStatusMustNotChangeInDatabaseBetweenTwoCall(){
        let expectation = XCTestExpectation(description: "API responce got")
        
        viewModel.isHidenSingle(){ [unowned self] isHiden in
            let hiden = isHiden
            
            viewModel.isHidenSingle(){ balanceIsHiden in
                XCTAssertEqual(balanceIsHiden, hiden)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func testBalanceIsHidenAPIIntegrationSinglePerformance() throws {
        self.measure {
            let expectation = XCTestExpectation(description: "API responce got")
            var hiden: Bool? = nil
            viewModel.isHidenSingle(){ isHiden in
                hiden = isHiden
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
            XCTAssertNotNil(hiden)
        }
    }
    
    func testGetBalanceAPIIntegrationSinglePerformance() throws{
        self.measure {
            let expectation = XCTestExpectation(description: "API responce got")
            var balancetotal: String? = nil
            viewModel.totalBalanceSingle(){ balance in
                balancetotal = balance
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
            XCTAssertNotNil(balancetotal)
        }
    }

    func testBalanceIsHidenAPIIntegrationLivePerformance() throws {
        self.measure {
            let expectation = XCTestExpectation(description: "API responce got")
            var hiden: Bool? = nil
            viewModel.isHidenLive(){ isHiden in
                hiden = isHiden
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
            XCTAssertNotNil(hiden)
        }
    }
    
    func testGetBalanceAPIIntegrationLivePerformance() throws{
        self.measure {
            let expectation = XCTestExpectation(description: "API responce got")
            var balancetotal: String? = nil
            viewModel.totalBalanceLive(){ balance in
                balancetotal = balance
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
            XCTAssertNotNil(balancetotal)
        }
    }
    
}
