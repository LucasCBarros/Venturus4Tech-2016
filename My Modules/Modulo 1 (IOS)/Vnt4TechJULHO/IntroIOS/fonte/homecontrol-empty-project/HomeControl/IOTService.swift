//
//  IOTService.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import Foundation

// API
// Fetch temperature send GET to http://IOTCARD:XXXX/temperature receive as example {"value":34.10894050905481,"time":"11:30:90","date":"21/10/2014"}
// Switch lamp on/of send POST with JSON {"lampstate":false} on body to http://IOTCARD:XXXX/switchlamp, receive statuscode 200 if on and 201 if off
// Fetch lamp state send GET to http://IOTCARD:XXXX/switchlamp, receive statuscode 200 if on and 201 if off

class IOTService {
    
    //Singleton Pattern
    static let sharedInstance = IOTService()
    private init() {}
    
    func fetchTemperature(fetchedHomeTemperatureCallBack:(Int, NSError?, HomeModel?) -> ()){
        
        let temperatureURL = NSURL (string: "http://172.24.30.33:3000/temperature")
        
        let session = NSURLSession.sharedSession() // Design pattern = singleton -> Problema de Independece Injection ( dependencia ingesada!)
        let request = NSMutableURLRequest(URL: temperatureURL!) // "!" pois nao sabe se URL é valida
        
        request.HTTPMethod = "GET"
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData?, response: NSURLResponse?, error: NSError?)-> Void in
            if let _ = data {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    fetchedHomeTemperatureCallBack(200, nil, self.convertJsonToHomeControl(data!))
                })
            }
        }
        )
        
        dataTask.resume()
    }
    /////////////////////
    func switchLamp(state:Bool,switchLampCallBack:(Int, NSError?) -> ()) {
        let lampURL = NSURL (string: "http://172.24.30.33:3000/switchLamp")
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: lampURL!)
        
        let requestBody = "{\"lampstate\":\(state)}"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        request.HTTPBody = requestBody.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"
        
        let dataTask = session.dataTaskWithRequest(request){(data: NSData?, response: NSURLResponse?, error: NSError?)-> Void in
            
            print("switch lamp data arrived")
            var statusCode: Int = -1
            if let nsurlResponse = response as? NSHTTPURLResponse {
                statusCode = nsurlResponse.statusCode
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                switchLampCallBack(statusCode,nil)
            })
        }
        
        dataTask.resume()
    }
    ///////////////////
    func fetchLampState(switchLampCallBack:(Int, NSError?) -> ()) {
        let lampURL = NSURL (string: "http://172.24.30.33:3000/switchLamp")
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: lampURL!)
        
        request.HTTPMethod = "GET"
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData?, response: NSURLResponse?, error: NSError?)-> Void in
                
                print("switch lamp status in progress")
                var statusCode: Int = -1
                if let nsurlResponse = response as? NSHTTPURLResponse {
                    statusCode = nsurlResponse.statusCode
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    switchLampCallBack(statusCode,nil)
                })
            }
        )	
        
        dataTask.resume()
        
    }
    //////////////////////
    func convertJsonToHomeControl(jsonObjectData:NSData) -> HomeModel? {
        
        var homeControl:HomeModel?;
        
        do {
            
            let homeControlDictionary = try NSJSONSerialization.JSONObjectWithData(jsonObjectData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
            let temperatureValue = homeControlDictionary?.objectForKey("value") as? Float
            let time = homeControlDictionary?.objectForKey("time") as? String
            let date = homeControlDictionary?.objectForKey("date") as? String
            
            if (temperatureValue != nil) && (time != nil) && (date != nil) {
                homeControl = HomeModel(temperatureValue: temperatureValue!, time: time!, date: date!);
            }
            
        } catch {
            print("Invalid JSON Object")
        }
        
        return homeControl
    }
    
}
