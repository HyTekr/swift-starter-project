//
//  Offering+UI.swift
//  Starter Project
//
//  Created by Oscar de la Hera Gomez on 3/8/23.
//

import Foundation
import UIKit

extension Offering {
    func setupUI() {
        //        setupTableView()
        setupCollectionView()
    }

    // MARK: UI Setup Functionality
    private func setupCollectionView() {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())

        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.backgroundColor = Styleguide.colors.white
        // Add the UICollectionView to the View
        self.addSubview(self.collectionView)
        // Setup the constraints
        self.collectionView.top(to: self)
        self.collectionView.left(to: self)
        self.collectionView.right(to: self)
        self.collectionView.bottom(to: self)

        self.collectionView.contentInset = UIEdgeInsets(top: 130, left: 0, bottom: kPadding, right: 0)
    }

    //    private func setupTableView() {
    //        DispatchQueue.main.async { [weak self] in
    //            guard let self = self else { return }
    //            self.tableView.translatesAutoresizingMaskIntoConstraints = false
    //            self.tableView.backgroundColor = .white
    //            self.addSubview(self.tableView)
    //            self.tableView.edgesToSuperview()
    //            self.tableView.contentInset = UIEdgeInsets(top: 130, left: 0, bottom: kPadding, right: 0)
    //            self.tableView.rowHeight = UITableView.automaticDimension
    //            self.tableView.estimatedRowHeight = 300
    //
    //            // Register Cells
    //            self.tableView.register(SectionTitleCell.self, forCellReuseIdentifier: SectionTitleCell.identifier)
    //            self.tableView.register(SectionSubTitleCell.self, forCellReuseIdentifier: SectionSubTitleCell.identifier)
    //            self.tableView.register(ProductTile.self, forCellReuseIdentifier: ProductTile.identifier)
    //
    //            self.tableView.delegate = self
    //            self.tableView.dataSource = self
    //        }
    //    }
}
