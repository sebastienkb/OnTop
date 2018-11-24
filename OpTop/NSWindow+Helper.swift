//
//  NSWindow+Helper.swift
//  OpTop
//
//  Created by Sébastien Kalb on 18/11/2018.
//  Copyright © 2018 Sébastien Kalb. All rights reserved.
//

import Cocoa

extension NSWindow {

    static var currentWindow: NSWindow? {
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

    func toggleFloating() {
        let floating = level == .floating
        print(floating ? "Puting level to normal" : "Puting level to floating")
        self.level = floating ? .normal : .floating
    }
}

private extension NSWindow {

    var frontMost: NSWindow {
        var current = self
        while let parent = current.parent {
            current = parent
        }
        return current
    }

    var isFloatable: Bool {
        return isVisible && !(self is NSPanel)
    }
}
