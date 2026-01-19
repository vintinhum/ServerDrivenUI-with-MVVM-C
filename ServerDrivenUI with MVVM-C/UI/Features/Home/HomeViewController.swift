//
//  HomeViewController.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import UIKit
import RxSwift

class HomeViewController: ComponentSectionController {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let disposeBag = DisposeBag()
    private let viewModel: HomeViewModel
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - INITIALIZERS
    
    init(viewModel: HomeViewModel,
         sectionContainer: ComponentSectionContainerProtocol) {
        self.viewModel = viewModel
        super.init(container: sectionContainer)
        setupComponents()
        bindObservables()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.retrieveSections()
    }
    
    // MARK: - PRIVATE SETUP
    
    private func setupComponents() {
        navigationItem.title = "Home"
        selfDelegate = delegate
    }
    
    private func bindObservables() {
        viewModel.viewStateObserver.subscribeOnMainDisposed(by: disposeBag) { [weak self] in
            guard let self else { return }
            handleViewState($0)
        }
    }
    
    // MARK: - ACTIONS
    
    override func sectionController(_ section: ComponentSectionViewProtocol, didSelectWith action: ComponentSectionActionProtocol) {
        if let action = action as? ComponentSectionActionEvent {
            handleEventAction(action)
        }
    }
    
    // MARK: - HANDLERS
    
    private func handleViewState(_ viewState: DefaultSectionsViewState) {
        switch viewState {
        case .content(let sections):
            container.updateSections(with: sections.sections, forceReload: true)
        case .loading:
            container.loading()
        case .error(let error):
            print(error)
        }
    }
    
    private func handleEventAction(_ action: ComponentSectionActionEvent) {
        switch action.eventType {
        case .reload:
            viewModel.reload()
        }
    }
}
