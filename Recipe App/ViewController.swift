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
    @IBOutlet weak var tableViewRecipe: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("recipe app")
        for i in recipeData.arrayRecipeName
        {
            print(i)
        }
    }
}

extension ViewController: UITableViewDataSource
{
    //number of items displaying in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipeData.arrayRecipeName.count
    }

    
    //display items in tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableViewRecipe.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let image = UIImage(named: "kerala")
        cell.imageView?.image = image
        cell.textLabel?.text = recipeData.arrayRecipeName[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    //deselect selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableViewRecipe.deselectRow(at: indexPath, animated: true)
    }
}
