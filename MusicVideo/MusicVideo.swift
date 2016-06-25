//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Ravi Bijlani on 6/10/16.
//  Copyright © 2016 ROAR Smart. All rights reserved.
//

import Foundation


class Videos {
    
    var vRank = 0;
    
    // Data Encapsulation
    private var _vName: String;
    private var _vRights:String;
    private var _vPrice:String;
//    private var _vCurrency:String;
    private var _vImageUrl: String;
    private var _vVideoUrl: String;
    private var _vArtist: String;
    private var _vImid: String;
    private var _vGenre: String;
    private var _vLinkToiTunes: String;
    private var _vReleaseDte: String;
 
    // This variable gets created from the UI
    var vImageData:NSData?
    
    
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

    var vRights: String {
        return _vRights;
    }

    var vPrice: String {
        return _vPrice;
    }

//    var vCurrency: String {
//        return _vCurrency;
//    }

    var vArtist: String {
        return _vArtist;
    }

    var vImd: String {
        return _vImid;
    }

    var vGenre: String {
        return _vGenre;
    }

    var vLinkToiTunes: String {
        return _vLinkToiTunes;
    }

    var vReleaseDte: String {
        return _vReleaseDte;
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
        
        // Rights
        if let rights = data ["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String{
            self._vRights = vRights
        } else {
            // we initialized it to empty String
            
            self._vRights = ""
        }

        // Price & Currency
        if let price = data ["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String{
            self._vPrice = vPrice
        } else {
            // we initialized it to empty String
            
            self._vPrice = ""
        }
       
        
        
        //Img URL
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
        
        
        // Artist
        if let artist = data ["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String{
            self._vArtist = vArtist
        } else {
            // we initialized it to empty String
            
            self._vArtist = ""
        }
      
        // IMID
        if let iMid = data ["id"] as? JSONDictionary,
            vIdAttr = iMid["attributes"] as? JSONDictionary,
            vImid = vIdAttr["im:id"] as? String {
            self._vImid = vImid
        } else {
            // we initialized it to empty String
            
            self._vImid = ""
        }
        
        //Genre
        if let category = data ["category"] as? JSONDictionary,
            vCatAttr = category["attributes"] as? JSONDictionary,
            vGenre = vCatAttr["term"] as? String {
            self._vGenre = vGenre
        } else {
            // we initialized it to empty String
            
            self._vGenre = ""
        }
 
        // Link to iTunes
        if let iMid = data ["id"] as? JSONDictionary,
            vLinkToiTunes = iMid["label"] as? String {
            self._vLinkToiTunes = vLinkToiTunes
        } else {
            // we initialized it to empty String
            
            self._vLinkToiTunes = ""
        }
       
        // Release Date
        if let releaseDate = data ["im:releaseDate"] as? JSONDictionary,
            vrDAttr = releaseDate["attributes"] as? JSONDictionary,
            vReleaseDte = vrDAttr["label"] as? String {
            self._vReleaseDte = vReleaseDte
        } else {
            // we initialized it to empty String
            
            self._vReleaseDte = ""
        }
     
     
    }
}