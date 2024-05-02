//
//  ListingInteractor.swift
//  UniversityApp
//
//  Created by Mohammed Umar Asif on 01/05/2024.
//



import UIKit

protocol ListingUseCase{
    var presenter: ListingPresenter? { set get}
    func fetchUniversities()
}

class ListingInteractor: ListingUseCase{
    var presenter: ListingPresenter?
    
    func fetchUniversities(){
        let urlString = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            print(data.description)
            do{
                let jsonResult = try JSONDecoder().decode(WelcomeElement.self, from: data)
                DispatchQueue.main.async {
                    TableCell.nameLabel.text = "\(jsonResult.name)"
                    TableCell.stateLabel.text = "\(jsonResult.stateProvince)"
                    
                    print("successful call")
                    print(jsonResult.name)
                    //self.tableView.reloadData()
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }

}
