// RooXcodeExtensionTests.swift
// Unit tests for RooXcodeExtension.

import XCTest
import XcodeKit

final class RooXcodeExtensionTests: XCTestCase {
    // Test the RooXcodeUtility class
    func testRooXcodeUtility() {
        // Clear history before testing
        RooXcodeUtility.shared.clearCommandHistory()
        
        // Record some commands
        RooXcodeUtility.shared.recordCommand("command1")
        RooXcodeUtility.shared.recordCommand("command2")
        
        // Check the history
        let history = RooXcodeUtility.shared.getCommandHistory()
        XCTAssertEqual(history.count, 2)
        XCTAssertEqual(history[0], "command1")
        XCTAssertEqual(history[1], "command2")
        
        // Test timestamp generation
        let timestamp = RooXcodeUtility.shared.generateTimestampComment()
        XCTAssertTrue(timestamp.hasPrefix("// RooXcodeExtension: Command executed at "))
    }
    
    // Test the RooXcodeCommand class
    func testRooXcodeCommand() {
        // Create a mock invocation
        let mockInvocation = MockXCSourceEditorCommandInvocation()
        
        // Create the command
        let command = RooXcodeCommand()
        
        // Execute the command
        let expectation = XCTestExpectation(description: "Command execution")
        command.perform(with: mockInvocation) { error in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        // Wait for the command to complete
        wait(for: [expectation], timeout: 1.0)
        
        // Check that the command inserted comments
        XCTAssertGreaterThanOrEqual(mockInvocation.buffer.lines.count, 2)
        XCTAssertTrue((mockInvocation.buffer.lines[0] as? String)?.contains("Command executed at") ?? false)
        XCTAssertEqual(mockInvocation.buffer.lines[1] as? String, "// RooXcodeExtension: Plus Button Clicked")
    }
}

// Mock classes for testing

class MockXCSourceEditorCommandInvocation: XCSourceEditorCommandInvocation {
    let buffer = MockXCSourceTextBuffer()
    
    override var buffer: XCSourceTextBuffer {
        return self.buffer
    }
}

class MockXCSourceTextBuffer: XCSourceTextBuffer {
    var lines = NSMutableArray()
    var selections = NSMutableArray()
    
    override var lines: NSMutableArray {
        return self.lines
    }
    
    override var selections: NSMutableArray {
        return self.selections
    }
}