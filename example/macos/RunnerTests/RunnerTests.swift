import FlutterMacOS
import Cocoa
import XCTest

@testable import helgoboss_pointer_lock

// This demonstrates a simple unit test of the Swift portion of this plugin's implementation.
//
// See https://developer.apple.com/documentation/xctest for more information about using XCTest.

class RunnerTests: XCTestCase {

  func testPointerPositionOnScreen() {
    let plugin = HelgobossPointerLockPlugin()

    let call = FlutterMethodCall(methodName: "pointerPositionOnScreen", arguments: nil)

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      guard let coordinates = result as? [Double] else {
        XCTFail("Expected screen coordinates")
        resultExpectation.fulfill()
        return
      }
      XCTAssertEqual(coordinates.count, 2)
      XCTAssertTrue(coordinates.allSatisfy { $0.isFinite })
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }

}
