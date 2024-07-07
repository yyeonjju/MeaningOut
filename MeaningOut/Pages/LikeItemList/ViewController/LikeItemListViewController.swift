//
//  LikeItemListViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 7/7/24.
//

import UIKit


final class LikeItemListViewController : UIViewController {
    
    // MARK: - UI
    let viewManager = LikeItemListView()
    
    // MARK: - Properties
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundColor()
        setupDelegate()
    }
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.likeItemTableView.dataSource = self
        viewManager.likeItemTableView.delegate = self
        viewManager.likeItemTableView.register(LikeItemTableViewCell.self, forCellReuseIdentifier: LikeItemTableViewCell.description())
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector
    // MARK: - SetupUI
    // MARK: - APIFetch
    // MARK: - PageTransition
}


extension LikeItemListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LikeItemTableViewCell.description(), for: indexPath) as! LikeItemTableViewCell
        cell.configureData()
        return cell
    }
}
