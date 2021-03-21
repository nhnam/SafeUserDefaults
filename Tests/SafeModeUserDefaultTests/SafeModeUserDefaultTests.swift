import XCTest
@testable import SafeModeUserDefault

final class SafeModeUserDefaultTests: XCTestCase {
    func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct
      // results.
      
      UserDefaults.safe.setValue(nil, forKey: "password", forceOverride: { return true })
      
      var storingResult = UserDefaults.safe.setValue("123456", forKey: "password", forceOverride: { return false })
      XCTAssertEqual(storingResult, StoringResult.success)
      
      storingResult = UserDefaults.safe.setValue("123456", forKey: "password", forceOverride: { return false })
      XCTAssertEqual(storingResult, StoringResult.discarded)
      
      storingResult = UserDefaults.safe.setValue("123456", forKey: "password", forceOverride: { return true })
      XCTAssertEqual(storingResult, StoringResult.overrided)
      
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
