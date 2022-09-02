//
//  ViewController.swift
//  testExitek
//
//  Created by Vlad Rakovich on 31.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listItems: [Movie] = []
    
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputYear: UITextField!
    @IBOutlet weak var tableMovie: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableMovie.delegate = self
        tableMovie.dataSource = self
    }

    
    @IBAction func tapAdd(_ sender: Any) {
        
        //get text from title
        guard let title = inputTitle.text else {
            inputColor(inputField: inputTitle, color: "red")
            return
        }
        
        //get text from title
        guard let yearText = inputYear.text, let year = Int(yearText) else {
            inputColor(inputField: inputYear, color: "red")
            return
        }
        
        //make green border color
        inputColor(inputField: inputTitle)
        inputColor(inputField: inputYear)
        
        //make new element
        let newMovie = Movie(title: title, year: year)
        //check duplicate
        if isTitleExist(newItem: newMovie) {
            //make red border when duplicate
            inputColor(inputField: inputTitle, color: "red")
        } else {
            insertNewMovie(newMovieForInsert: newMovie)
        }
        
    }
    
    
    //work with table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableMovie.dequeueReusableCell(withIdentifier: "MovieItemCell", for: indexPath) as! MovieCell
        //make Label in cell
        tableCell.itemMovie.text = "\(listItems[indexPath.row].title) \(listItems[indexPath.row].year)"
        return tableCell
    }
    
    
    //helpers
    func isTitleExist(newItem: Movie) -> Bool {
        return listItems.contains(newItem)
    }
    
    
    func inputColor(inputField: UITextField, color: String = "green"){
        switch color {
        case "red":
            inputField.layer.backgroundColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        case "noneclea":
            inputField.layer.backgroundColor = CGColor(red: 255, green: 0, blue: 0, alpha: 0)
        default:
            inputField.layer.backgroundColor = CGColor(red: 0, green: 255, blue: 0, alpha: 1)
        }
    }
    
    
    func insertNewMovie(newMovieForInsert: Movie) {
        listItems.append(newMovieForInsert)
        //clean input fields
        inputTitle.text = ""
        inputYear.text = ""
        //refresh List of Movies
        tableMovie.beginUpdates()
        let rowIndex = listItems.count-1
        let ip: IndexPath = IndexPath(row: rowIndex, section: 0)
        tableMovie.insertRows(at: [ip], with: .fade)
        tableMovie.endUpdates()
        //clear background of fieldtext
        inputColor(inputField: inputTitle, color: "none")
        inputColor(inputField: inputYear, color: "none")
    }
    
}

