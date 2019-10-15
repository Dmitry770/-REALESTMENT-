//
//  Model.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 06/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import Foundation




// https://firebasestorage.googleapis.com/v0/b/realestment.appspot.com/o/data.json?alt=media&token=43b7e635-257f-45b2-b8c0-0d150da8d7f0


var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
      let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews(completionHandler: (()->Void)?) {
    
    let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/realestment.appspot.com/o/data.json?alt=media&token=43b7e635-257f-45b2-b8c0-0d150da8d7f0")
   
    let session = URLSession(configuration: .default)
   
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
           
            parseNews()
            completionHandler?()
            print(articles.count)
            
        }
    
    }
    
    downloadTask.resume()
}


func parseNews() {
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        
        var returnArray: [Article] = []
          for dict in array {
              let newArticle = Article(dictionary: dict)
              returnArray.append(newArticle)
          }
         
          articles = returnArray
    }
    
}
