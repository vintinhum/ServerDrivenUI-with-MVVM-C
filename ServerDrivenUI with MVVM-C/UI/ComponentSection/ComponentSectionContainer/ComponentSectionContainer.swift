//
//  ComponentSectionContainer.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import UIKit

class ComponentSectionContainer: UITableView, ComponentSectionContainerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    let sectionFactory: ComponentSectionFactoryProtocol
    weak var containerDelegate: ComponentSectionControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private var sections: [ComponentSectionModel] = []
    
    // MARK: - INITIALIZERS
    
    init(sectionFactory: ComponentSectionFactoryProtocol) {
        self.sectionFactory = sectionFactory
        super.init(frame: .zero, style: .plain)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE SETUP
    
    private func setupView() {
        delegate = self
        dataSource = self
        register(ComponentSectionContainerCell.self, forCellReuseIdentifier: "ComponentSectionContainerCell")
        rowHeight = UITableView.automaticDimension
        separatorColor = UIColor.clear
    }
    
    // MARK: - PUBLIC METHODS
    
    func updateSections(with sections: [ComponentSectionModel], forceReload: Bool) {
        if !forceReload {
            self.sections += sections
            return
        } else {
            self.sections = sections
        }
        reload()
    }
    
    func loading() { }
    
    func removeSections() { }
    
    // MARK: - PRIVATE METHODS
    
    private func reload() {
        DispatchQueue.main.async {
            self.reload()
            self.layoutSubviews()
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }
    }
    
    private func makeSectionViews() -> [ComponentSectionViewProtocol] {
        var sectionsViews: [ComponentSectionViewProtocol] = []
        sections.forEach { sectionModel in
            guard let sectionView = sectionFactory.makeSectionView(for: sectionModel.section) else { return }
            sectionView.delegate = containerDelegate
            sectionsViews.append(sectionView)
        }
        return sectionsViews
    }
}

// MARK: - TABLE VIEW DELEGATE

extension ComponentSectionContainer: UITableViewDelegate { }

// MARK: - TABLE VIEW DATA SOURCE

extension ComponentSectionContainer: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "ComponentSectionContainerCell", for: indexPath) as! ComponentSectionContainerCell
        let sectionView = makeSectionViews()[indexPath.row]
        cell.setup(with: sectionView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
