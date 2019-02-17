//
//  HomeScreenViewModel.swift
//  Contact
//
//  Created by Kuliza-148 on 17/02/19.
//  Copyright © 2019 swift. All rights reserved.
//

import RxSwift

protocol HomeScreenViewModelling {
    // Input
    var submitButtonClicked: PublishSubject<Void> { get }
    var cellSelected: PublishSubject<ContactCellViewModeling> { get }
    // Output
    var tableItems: Observable<[CustomSection]> { get }
    var tableItemTypes: [CellRepresentable.Type] { get }
    var contactDetails: Observable<ContactDetail> { get }
}

class HomeScreenViewModel: HomeScreenViewModelling {
    // Input
    var submitButtonClicked: PublishSubject<Void> = PublishSubject()
    var cellSelected: PublishSubject<ContactCellViewModeling>  = PublishSubject()
    
    // Output
    var tableItems: Observable<[CustomSection]> = Observable.just([])
    var tableItemTypes: [CellRepresentable.Type] = [ContactCellViewModel.self]
    var contactDetails: Observable<ContactDetail> = Observable.empty()
    
    private var repository: UserFetching
    init(repository: UserFetching) {
        self.repository =  repository
        createObservables()
    }
    
    private func createObservables() {
        tableItems = submitButtonClicked
            .flatMap { [unowned self] in
                self.fetchUsers()
            }.map { [unowned self] model in
                self.getTableCells(model: model)
        }
        
        contactDetails = cellSelected
            .flatMap({ [unowned self] viewModel -> Observable<ContactDetail> in
                guard let identifier = viewModel.identifier, !identifier.isEmpty else { fatalError() }
                return self.getContactDetails(for: identifier)
            })
    }
    
    private func fetchUsers() -> Observable<[Contact]> {
        return repository.getContacts()
    }
    
    private func getContactDetails(for identifier: String) -> Observable<ContactDetail> {
        return repository.getContactDetails(for: identifier)
    }
    
    private func getUsersSection(model: [Contact]) -> CustomSection? {
        var viewModels = [ContactCellViewModeling]()
        for item in model {
            viewModels.append(ContactCellViewModel(model: item))
        }
        return CustomSection(header: "Users", items: viewModels)
    }
    
    func getTableCells(model: [Contact]) -> [CustomSection] {
        guard let section = self.getUsersSection(model: model)
            else { return [] }
        return [section]
    }
}