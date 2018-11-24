//
//  OnTop.swift
//  OpTop
//
//  Created by Sébastien Kalb on 18/11/2018.
//  Copyright © 2018 Sébastien Kalb. All rights reserved.
//

import AppKit

class OnTop {

    static let shared = OnTop()

    func toggleOnTop() {
        NSWindow.currentWindow?.toggleFloating()
    }
}
