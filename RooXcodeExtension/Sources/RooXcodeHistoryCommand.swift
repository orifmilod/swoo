// RooXcodeHistoryCommand.swift
// Xcode Source Editor Command for "History Button Clicked".
// This command simulates the "historyButtonClicked" command from Roo-Code.

import Foundation
import XcodeKit

class RooXcodeHistoryCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        // Record this command execution
        RooXcodeUtility.shared.recordCommand("historyButtonClicked")
        
        // Get the command history
        let history = RooXcodeUtility.shared.getCommandHistory()
        
        // Insert the history as comments
        invocation.buffer.lines.insert("// RooXcodeExtension: History button clicked", at: 0)
        invocation.buffer.lines.insert("// Command History:", at: 1)
        
        // Add each history item as a comment
        for (index, command) in history.enumerated() {
            invocation.buffer.lines.insert("// \(index + 1). \(command)", at: index + 2)
        }
        
        // Complete the command
        completionHandler(nil)
    }
}