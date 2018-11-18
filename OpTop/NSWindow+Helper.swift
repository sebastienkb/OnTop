//
//  NSWindow+Helper.swift
//  OpTop
//
//  Created by Sébastien Kalb on 18/11/2018.
//  Copyright © 2018 Sébastien Kalb. All rights reserved.
//

import Cocoa

extension NSWindow {

    static var currentFloatableWindow: NSWindow? {
        get {
            if let window = NSApp.keyWindow?.frontMost, window.isFloatable {
                return window
            }

            if let window = NSApp.mainWindow?.frontMost, window.isFloatable {
                return window
            }

            for window in NSApp.orderedWindows {
                let frontMostWindow = window.frontMost
                if frontMostWindow.isFloatable {
                    return frontMostWindow
                }
            }

            return nil
        }
    }

    var frontMost: NSWindow {
        get {
            var current = self
            while let parent = current.parent {
                current = parent
            }
            return current
        }
    }

    var isFloatable: Bool {
        get {
            return isVisible && !(self is NSPanel)
        }
    }

    func toggleFloating() {
        let floating = level == .floating
        self.level = floating ? .normal : .floating
    }
}
