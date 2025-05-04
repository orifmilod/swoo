// RooXcodeSettingsCommand.swift
// Xcode Source Editor Command for "Settings Button Clicked".

import Foundation
import XcodeKit

class RooXcodeSettingsCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        // Insert a comment indicating the settings button was clicked.
        invocation.buffer.lines.insert("// RooXcodeExtension: Settings button clicked", at: 0)
        completionHandler(nil)
    }
}