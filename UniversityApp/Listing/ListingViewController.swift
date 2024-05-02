//
//  ListingViewController.swift
//  UniversityApp
//
//  Created by Mohammed Umar Asif on 01/05/2024.
//

import UIKit

protocol ListingView {
    var presenter : ListingPresenter? { set get }
    func update(with universities:[University])
    func update(with error:String)
}

class ListingViewController: UIViewController {
    
    @IBOutlet var listTableView: UITableView!
    var presenter: ListingPresenter?
    var universities : [University] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        
        
    }
    
    func update(with universities: [University]) {
        DispatchQueue.main.async {
            self.universities = universities
            self.listTableView.isHidden = false
            self.listTableView.reloadData()
        }
    }
    
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.universities = []
            self.listTableView.isHidden = true
            self.listTableView.reloadData()
        }
    }
    
}



extension ListingViewController: ListingView, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        cell.nameLabel?.text = self.universities[indexPath.row].name
        cell.stateLabel?.text = self.universities[indexPath.row].state
        return cell
    }
    
    //logic to push details storyboard on select
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "Main") as? ListingViewController else { return }
//
//        vc.delegate = self
//        let university = self.universities[indexPath.row]
//        vc.universities = university
//      
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
