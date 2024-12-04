//
//  ViewController.swift
//  ApiDataInTableViewPractice
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var persons: [PersonModel] = []
    var url = "https://jsonplaceholder.typicode.com/users"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 230
        
        fetchData()
    }
    
    func fetchData(){
        
        let sharedInstance = Network.sharedInstance
        sharedInstance.getData(url: url) { [weak self] person in
            DispatchQueue.main.async {
                self?.persons = person ?? []
                self?.tableView.reloadData()
            }
        }
    }
    


}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        let person = persons[indexPath.row]
        cell.config(from: person)
        return cell
    }
    
}
