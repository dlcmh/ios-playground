//
//  ViewController.swift
//  nsurlsession_tutorial


import UIKit

class ViewController: UIViewController {

    let url_to_request:String = "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data_request()

        download_request()
        
        upload_request()
    }


    
    func data_request()
    {
        let url:URL = URL(string: url_to_request)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
        (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(dataString)
            
        }) 
        
        task.resume()
        
    }
    
    
    func download_request()
    {
        let url:URL = URL(string: url_to_request)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        
        let task = session.downloadTask(with: request as URLRequest, completionHandler: {
            (
            location, response, error) in
            
            guard let _:URL = location, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            let urlContents = try! NSString(contentsOf: location!, encoding: String.Encoding.utf8.rawValue)
            
            guard let _:NSString = urlContents else {
                print("error")
                return
            }
            
            print(urlContents)
            
        }) 
        
        task.resume()
        
    }
    
    
    func upload_request()
    {
        let url:URL = URL(string: url_to_request)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
    
        
        let data = "data=Hi".data(using: String.Encoding.utf8)

        
        let task = session.uploadTask(with: request as URLRequest, from: data, completionHandler:
            {(data,response,error) in
            
                guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                    print("error")
                    return
                }
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(dataString)
            }
        );
        
        task.resume()
        
    }
}

