// RooXcodeAcceptInputCommand.swift
// Xcode Source Editor Command for "Accept Input".

import Foundation
import XcodeKit

class RooXcodeAcceptInputCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        invocation.buffer.lines.insert("// RooXcodeExtension: Input accepted", at: 0)
        completionHandler(nil)
    }
}