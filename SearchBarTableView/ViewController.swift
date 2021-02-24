//
//  ViewController.swift
//  SearchBarTableView
//
//  Created by MD Tanvir Alam on 24/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let fruits = ["Mango","Apple","Banana","Pinapple","Coconut","Straberry"]
    var filteredData = [String]()
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchbar.delegate = self
        filteredData = fruits
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredData = fruits
        }else{
            filteredData = []
            for fruit in fruits{
                if fruit.lowercased().contains(searchText.lowercased()){
                    filteredData.append(fruit)
                }
            }
        }
        self.tableView.reloadData()
    }

}

