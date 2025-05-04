// RooXcodeCommand.swift
// Xcode Source Editor Command for "Plus Button Clicked".
// This command simulates the "plusButtonClicked" command from Roo-Code.

import Foundation
import XcodeKit

class RooXcodeCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        // Record this command execution in the utility
        RooXcodeUtility.shared.recordCommand("plusButtonClicked")
        
        // Generate a timestamp comment
        let timestampComment = RooXcodeUtility.shared.generateTimestampComment()
        
        // Insert comments at the top of the file
        invocation.buffer.lines.insert("// RooXcodeExtension: Plus Button Clicked", at: 0)
        invocation.buffer.lines.insert(timestampComment, at: 0)
        
        // Complete the command
        completionHandler(nil)
    }
}