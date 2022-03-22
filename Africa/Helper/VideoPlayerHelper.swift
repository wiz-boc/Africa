//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by wizz on 11/20/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName:String, fileFormat: String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
    
}
