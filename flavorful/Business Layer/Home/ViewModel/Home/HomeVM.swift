//
//  HomeVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 12.05.24.
//

import Foundation

class HomeVM {
    
    private (set) var recipeList: [RecipeCellProtocol] = []
    var successCB: (() -> Void)?
    
    func createCuisineList() {
           let cuisineList = [
            CuisineRecipe(id: "Italy", name: "Italian", imageView: "italy", text: "The Mediterranean diet forms the basis of Italian cuisine, rich in pasta, fish, fruits and vegetables. Cheese, cold cuts and wine are central to Italian cuisine along with pizza and coffee."),
            CuisineRecipe(id: "India", name: "Indian", imageView: "india", text: "Indian cuisine consists of a variety of regional and traditional cuisines native to the Indian subcontinent. Given the diversity in soil and culture, these cuisines vary and use locally available spices, vegetables, and fruits."),
            CuisineRecipe(id: "France", name: "French", imageView: "france", text: "French cuisine is characterized by its use of a wide range of ingredients, including meats, seafood, vegetables, and fruits. It's also known for its use of sauces, which are often made with butter, cream, and wine."),
            CuisineRecipe(id: "America", name: "American", imageView: "usa", text: "American cuisine is created through the use of a range of spices and herbs. Some of commonly used spices in this cuisine include chili, cumin, and paprika. These spices are used to create complex flavors that are both savory and spicy."),
            CuisineRecipe(id: "Mexico", name: "Mexican", imageView: "mexico", text: "Mexican dishes are known for their bold and spicy flavors, colorful presentation, and the use of fresh ingredients such as avocado, tomatoes, chilies, and corn."),
            CuisineRecipe(id: "Japan", name: "Japanese", imageView: "japan", text: "Washoku, or traditional Japanese cuisine, is based on local, pure and fresh ingredients. Rice, fish, vegetables and wild plants are accurately prepared, often according to strict rules.")
           ]
        recipeList = cuisineList
        successCB?()
       }
    
    func createCategoryList() {
           let categoryList = [
            CategoryRecipe(id: "Soup", name: "Soups", imageView: "soup", text: "Sometimes, a comforting bowl of soup is all you need. These soup recipes are our favorites, and they venture into all kinds of flavor territories. From a noodle bowl, to beef stew, these soup recipes are sure to warm you up from head to toe!"),
            CategoryRecipe(id: "Main", name: "Main courses", imageView: "main course", text: "Getting dinner on the table is easy with these main dishes. Recipes from our kitchens professionals are designed to inspire – whether you are entertaining or cooking at home."),
            CategoryRecipe(id: "Salad", name: "Salads", imageView: "salad", text: "Forget the rabbit food, salads can be fun, hearty and packed full of flavour – and here’s the proof! From a simple, fresh tomato salad to a sticky chicken and noodle salad, we’ve got all of our favourites here in the one place."),
            CategoryRecipe(id: "Appetizer", name: "Appetizers", imageView: "appetizer", text: "Regardless of your need, we've got all the inspiration you'll need in this special collection of our best party appetizer recipes. Each recipe is guaranteed to make for a memorable party that will have guests excited for your next event!"),
            CategoryRecipe(id: "Breakfast", name: "Breakfasts", imageView: "breakfast", text: "Start your day off right with one of these winning breakfast recipes. From egg baked to cocoa pancakes, there's a recipe for every craving!"),
           ]
        recipeList = categoryList
        successCB?()
       }
    
     func getListOfType(type: SegmentType) {
        switch type {
        case .Country:
            createCuisineList()
        case .Category:
            createCategoryList()
        }
    }
    
    func getListCount() -> Int {
        recipeList.count
    }
}
