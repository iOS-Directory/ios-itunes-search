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
    var name:[String] = []
    
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
        var button = sender.selectedSegmentIndex
        
        if  button == 0 {
            name.append("Kristen")
            updateViews()
        }else if button == 1{
            name.append("Fritz")
            updateViews()
        }else if button == 2 {
            name.append("Anna")
            updateViews()
        }
    }
    
    func updateViews()  {
        tableView.reloadData()
    }
}




//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell")! as UITableViewCell
        
        let data = name[indexPath.row]
        
        cell.textLabel?.text = data
        
        cell.detailTextLabel?.text = "\(name.count)"
        
        return cell
    }
    
    
    
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    
}
