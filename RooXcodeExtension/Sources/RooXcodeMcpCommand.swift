// RooXcodeMcpCommand.swift
// Xcode Source Editor Command for "MCP Button Clicked".

import Foundation
import XcodeKit

class RooXcodeMcpCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        invocation.buffer.lines.insert("// RooXcodeExtension: MCP button clicked", at: 0)
        completionHandler(nil)
    }
}