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
    

    //MARK: - Properties
    
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Actions
    @IBAction func segementedControl(_ sender: UISegmentedControl) {
        //print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
    
    
    
    
}




//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell")! as UITableViewCell
        
        cell.textLabel?.text = "Testing Description"
        
        cell.detailTextLabel?.text = "Testing Subtitle"
        
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    
}
