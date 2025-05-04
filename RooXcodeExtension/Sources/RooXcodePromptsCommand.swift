// RooXcodePromptsCommand.swift
// Xcode Source Editor Command for "Prompts Button Clicked".

import Foundation
import XcodeKit

class RooXcodePromptsCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        invocation.buffer.lines.insert("// RooXcodeExtension: Prompts button clicked", at: 0)
        completionHandler(nil)
    }
}