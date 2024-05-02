//
//  ListingRouter.swift
//  UniversityApp
//
//  Created by Mohammed Umar Asif on 01/05/2024.
//
import UIKit
import Foundation

typealias EntryPoint = ListingView & UIViewController

protocol ListingRouting{
    var entry: EntryPoint? { get }
}

class ListingRouter: ListingRouting{
    var entry: EntryPoint?
    
    static func start() -> any ListingRouting {
        let router = ListingRouter()
        
        //assign vip
        var view: ListingView = ListingViewController()
        var presenter: ListingPresentation = ListingPresenter()
        var interactor: ListingUseCase = ListingInteractor()
        
        view.presenter = presenter as? ListingPresenter
        interactor.presenter = presenter as? ListingPresenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}

