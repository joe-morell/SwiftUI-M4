//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Joe Morell on 7/23/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("- " + item)
                            
                    }
                }
                .padding(.horizontal, 10.0)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5.0)
                    }
                }
                .padding(.horizontal, 10.0)
                
            }
            
        }
        .navigationBarTitle(recipe.name)
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into detail view to pass a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
