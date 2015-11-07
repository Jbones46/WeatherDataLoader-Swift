//
//  ViewController.swift
//  WeatherDataLoader
//
//  Created by Justin Ferre on 11/7/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func saveDataPressed(sender: AnyObject) {
        
        //read the text file into the app
        
        //break apart into individual readings
        
        //go through readings and collect windspeed temp pressure for each day
        
        //calculate mean and median
        
        
        //format and save data
        
        
        
    }
    
    func collapseToSingleDays(file: String) -> [Day] {
        //create an array to hold data
        
        var daysArray = [Day]()
        
        //get file path of file
        
        let path = NSBundle.mainBundle().pathForResource(file, ofType: "txt")
        //create and convert a date formatter
        
        let formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(abbreviation: "PST")
        formatter.dateFormat = "yyyy_MM_dd"

        
        //read file as a string
        
        do {  let fultext = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            let readings = fultext.componentsSeparatedByString("/n") as [String]!
            
            for i in 1..<readings.count {
                // break apart the array into new arrays by tabs "/t"
                let weatherData = readings[i].componentsSeparatedByString("/t")
                let dateTime = weatherData[0]
                let justDate = String(dateTime.startIndex.advancedBy(10))
                
                
                //
                let dateOfCurrentReading = formatter.dateFromString(justDate)
                
                // get weather values, convert from string to double
                
                let tempuratureValue = Double(weatherData[1])
                let pressureValue = Double(weatherData[2])
                let windPressureValue = Double(weatherData[7])
                
                // checking if day is empty or if starting a new day 
                
                if daysArray.count == 0 || (daysArray[daysArray.count - 1].date != dateOfCurrentReading) {
                    //create new day struct and append to days array
                    
                    let newDay = Day(initialDate: dateOfCurrentReading!)
                    daysArray.append(newDay)
                    
                    
                    
                    
                }
                
                //add current readings to the most recent day
                
                daysArray[daysArray.count - 1].barometricPressureReading.append(pressureValue!)
                daysArray[daysArray.count - 1].windSpeedReadings.append(windPressureValue!)
                daysArray[daysArray.count - 1].airTemperatureReading.append(tempuratureValue!)
                
                
                
                
                
            }
        } catch {
            print(error)
        }
        return daysArray
        
    }
    
}

