//
//  ViewController.swift
//  iTunes Search
//
//  Created by FGT MAC on 10/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    //MARK: - Properties
    var searchResultController = SearchResultController()
    var resultType: ResultType = .software
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func segementedControl(_ sender: UISegmentedControl) {
    
        
        switch sender.selectedSegmentIndex {
        case 0:
            resultType = .software
        case 1:
            resultType = .musicTrack
        case 2:
            resultType = .movie
        default:
            resultType = .software
        }
        
       
    }
    
  }

//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else {
            return
        }
        searchResultController.performSearch(searchTerm: term, resultType: resultType) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultController.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell")! as UITableViewCell
        
        let data = searchResultController.searchResults[indexPath.row]
        
        cell.textLabel?.text = data.title
        
        cell.detailTextLabel?.text = data.creator
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    
}
