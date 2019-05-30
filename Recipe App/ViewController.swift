//
//  ViewController.swift
//  Recipe App
//
//  Created by Naveen Vijay on 2019-05-26.
//  Copyright © 2019 Naveen Vijay. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController
{
    var recipeData = recipeClass()
    let navTitle = "Recipe"
    var webView = WKWebView()
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var tableViewRecipe: UITableView!
    @IBOutlet weak var viewRecipeDetails: UIView!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationTitle.title = navTitle
        title = navTitle
        print("okk")
        //table cell height change
        tableViewRecipe.rowHeight = 80
        
        viewRecipeDetails.isHidden = true
        btnBack.isEnabled = false
        btnBack.tintColor = .clear
    }
    
    //back button
    @IBAction func actionBtnBack(_ sender: Any)
    {
        funcaAtionBtnBack()
    }
}

extension ViewController
{
    //back button action
    func funcaAtionBtnBack()
    {
        if viewRecipeDetails.isHidden == true
        {
            btnBack.isEnabled = true
            btnBack.tintColor = .black
            viewRecipeDetails.isHidden = false
        }
        else
        {
            webView.removeFromSuperview()
            navigationTitle.title = navTitle
            btnBack.isEnabled = false
            btnBack.tintColor = .clear
            viewRecipeDetails.isHidden = true
        }
    }
    
    //show recipe in detail when user click tableview cell
    func funcRecipeDetail(id: Int)
    {
        navigationTitle.title = recipeData.arrayRecipeName[id]
        if let pdfURL = Bundle.main.url(forResource: recipeData.arrayRecipeName[id], withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            do {
                let data = try Data(contentsOf: pdfURL)
                webView = WKWebView(frame: CGRect(x:0,y:0,width:view.frame.size.width, height:view.frame.size.height))
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                viewRecipeDetails.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
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
        let cellTextLabel = cell.contentView.viewWithTag(1) as! UILabel
        cellTextLabel.text = recipeData.arrayRecipeName[indexPath.row]
        
        let cellImage = cell.contentView.viewWithTag(2) as! UIImageView
        cellImage.image = UIImage(named: recipeData.arrayRecipeName[indexPath.row])
        
        //cell imageview shape change
        cellImage.layer.cornerRadius = 20//cellImg.frame.size.width/2
        cellImage.clipsToBounds = true
        cellImage.layer.borderWidth = 3.0
        ///
        
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    //cell select actions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //deselect cell animation
        tableViewRecipe.deselectRow(at: indexPath, animated: true)
        
        //call recipe show fuction
        funcRecipeDetail(id: indexPath.row)
        
        //back btn action call
        funcaAtionBtnBack()
    }
}
