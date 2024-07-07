//
//  LikeItemListViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 7/7/24.
//

import UIKit
import RealmSwift


final class LikeItemListViewController : UIViewController {
    
    // MARK: - UI
    let viewManager = LikeItemListView()
    
    // MARK: - Properties
    let repository = RealmDBRepository()  //realm
    var likeProductList : Results<ProductTable>! {
        didSet{
            viewManager.likeItemTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundColor()
        setupDelegate()
        let value = repository.getAllObjects(tableModel: ProductTable.self)
        likeProductList = value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewManager.likeItemTableView.reloadData()
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
        return likeProductList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LikeItemTableViewCell.description(), for: indexPath) as! LikeItemTableViewCell
        let data = likeProductList[indexPath.row]
        cell.configureData(data : data)
        return cell
    }
}
