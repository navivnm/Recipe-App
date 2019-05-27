//
//  ViewController.swift
//  Recipe App
//
//  Created by Naveen Vijay on 2019-05-26.
//  Copyright © 2019 Naveen Vijay. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var recipeData = recipeClass()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("recipe app")
        for i in recipeData.arrayRecipeName {
            print(i)
        }
    }
}

