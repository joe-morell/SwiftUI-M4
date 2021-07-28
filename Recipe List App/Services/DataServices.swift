//
//  DataServices.swift
//  Recipe List App
//
//  Created by Joe Morell on 7/22/21.
//

import Foundation

// Fetches Data
class DataService {
    
    // Static turns method into type method
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathstring not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]() // Return empty recipe list
        }
        
        // Create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // Error getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
