//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Ravi Bijlani on 6/10/16.
//  Copyright © 2016 ROAR Smart. All rights reserved.
//

import Foundation


class Videos {
    
    // Data Encapsulation
    private var _vName: String;
    private var _vImageUrl: String;
    private var _vVideoUrl: String;
    
    // make a getter
    
    var vName: String {
        return _vName;
    }

    var vImageUrl: String {
        return _vImageUrl;
    }
    var vVideoUrl: String {
        return _vVideoUrl;
    }

    init (data : JSONDictionary) {
        
        //Video Name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String{
            self._vName = vName
        } else {
          // we initialized it to empty String
            
            self._vName = ""
        }
        
        //Img Name
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
            self._vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            // we initialized it to empty String
            
            self._vImageUrl = ""
        }

        //Img Name
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoURL = vHref["href"] as? String {
            self._vVideoUrl = vVideoURL
        } else {
            // we initialized it to empty String
            
            self._vVideoUrl = ""
        }
    
    }
}