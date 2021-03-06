//
//  Live.swift
//  Hakumai
//
//  Created by Hiroyuki Onishi on 11/19/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

import Foundation

private let kLiveBaseUrl = "http://live.nicovideo.jp/watch/"

class Live: CustomStringConvertible {
    // "lv" prefix is included in live id like "lv12345"
    var liveId: String?
    var title: String?
    var community: Community = Community()
    var baseTime: NSDate?
    var openTime: NSDate?
    var startTime: NSDate?
    
    var liveUrlString: String {
        return kLiveBaseUrl + (liveId ?? "")
    }
    
    var description: String {
        return (
            "Live: liveId[\(liveId)] title[\(title)] community[\(community)] " +
            "baseTime[\(baseTime)] openTime[\(openTime)] startTime[\(startTime)]"
        )
    }
    
    // MARK: - Object Lifecycle
    init() {
        // nop
    }
}