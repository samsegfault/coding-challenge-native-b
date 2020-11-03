//
//  HomePresenter.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomePresenter {

    // MARK: - Private properties -

    private unowned let view: HomeViewInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface

    private var fromCity = City(id: "0", name: "Quebec", geohash: "f2m673")
    private var toCity = City(id: "1", name: "Montreal", geohash: "f25dvk")
    
    // Busbud does not seem to have departures for dates
    // that are too far away. So let's use tomorrow.
    
    private var date = Date(timeIntervalSinceNow: 86400) //timeIntervalSince1970: 1627516800)
    
    private var adultsCount = 1
    
    // MARK: - Lifecycle -

    init(view: HomeViewInterface, interactor: HomeInteractorInterface, wireframe: HomeWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
    
    func onUserPressedSearch() {
        self.loadResults()
    }
    
    func viewDidLoad() {
        wireframe.openOnboarding()
        view.setMessage("Hit the search button above and check out the results", tryAgainButtonHidden: true)
    }
    
    private func loadResults() {

        view.setMessage("Fetching results...", tryAgainButtonHidden: true)

        let searchParams = SearchParameters(fromCity: fromCity, toCity: toCity, date: date, adultsCount: adultsCount)
        interactor.performSearch(searchParams: searchParams){ [weak self] (success, error) in
            
            guard self != nil else { return }
            
            guard error == nil else {
                let message = "We couldn’t retrieve the results, check your internet or try again later"
                self?.view.setMessage(message, tryAgainButtonHidden: false)
                return
            }
            
            self?.view.reloadResultsTableView()
            self?.view.setMessage(nil, tryAgainButtonHidden: true)
            
        }
    }
    
}

extension HomePresenter: SearchResultsTableViewDataSourceDelegate {
    
    func getResultsCount() -> Int {
        return interactor.getSearchResultsCount()
    }
    
    func getDeparture(at indexPath: IndexPath) -> Departure? {
        return interactor.getSearchResultsDeparture(at: indexPath)
    }
    
    func getLocation(with id: Int) -> Location? {
        return interactor.getSearchResultsLocation(with: id)
    }
    
}