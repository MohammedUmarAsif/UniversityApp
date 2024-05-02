//
//  ListingPresenter.swift
//  UniversityApp
//
//  Created by Mohammed Umar Asif on 01/05/2024.
//

enum FetchError : Error {
    case failed
}

protocol ListingPresentation{
    var interactor : ListingUseCase? { get set }
    var router : ListingRouting? { get set }
    var view : ListingView? { get set }
    
    func interactorDidFetchUser(with result: Result<[University], Error>)
}

class ListingPresenter: ListingPresentation {
    var interactor: ListingUseCase?{
        didSet{
            interactor?.fetchUniversities()
        }
    }
    
    var router: ListingRouting?
    var view: ListingView?
    
    func interactorDidFetchUser(with result: Result<[University], any Error>) {
        switch result{
        case .success(let universities):
            view?.update(with: universities)
        
        case .failure:
            view?.update(with: "Something Went Wrong")
        }
    }
}
