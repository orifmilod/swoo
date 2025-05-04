// RooXcodeExtension.swift
// Main entry point for the Xcode extension.
// This is the principal class for the extension, as specified in Info.plist.

import Foundation
import XcodeKit

class RooXcodeExtension: NSObject, XCSourceEditorExtension {
    // Called when the extension is initialized
    func extensionDidFinishLaunching() {
        // Setup code can go here
        print("RooXcodeExtension initialized")
    }
    
    // Optional method to provide a menu title for all commands
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        // Return an empty array to use the default command definitions from Info.plist
        return []
    }
}