//
//  HomeView.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

///This class holds the Home view
class HomeView: UIView {

    // MARK: - Variables and IBOutlets
    var view: UIView!
    var dataSource: Home = Home(data: [ : ])
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - View Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        registerTableCells()
    }
    
    private func loadViewFromNib() -> UIView {
        let view = UINib(nibName: "HomeView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    ///This methood register the custom table cells so that they can be reused
    private func registerTableCells(){
        tableview.register(UINib.init(nibName: "EvenItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenItemsTableViewCell")
    }
    
    ///Reload view with new table datasource
    /// - parameter homeModel: home model object
    func reloadViewWithModel(homeModel: Home){
        dataSource = homeModel
        tableview.reloadData()
    }
    
    
    //MARK:- Table view cells
    
    ///This method returns the EvenItems Table View Cell
    /// - parameter indexPath: An index path locating a row in tableView.
    /// - Returns: EvenItems Table View Cell instance
    func getEvenItemsTableViewCell(indexPath: IndexPath) -> EvenItemsTableViewCell{
        let cell = tableview.dequeueReusableCell(withIdentifier: "EvenItemsTableViewCell", for: indexPath) as! EvenItemsTableViewCell
        return cell
    }
    
}

extension HomeView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let userItemModelObject: HomeUserItem = dataSource.userData.userArray[section]
        let headerView = HomeTableHeaderView(frame: CGRect.zero)
        headerView.initiateWith(homeUserItem: userItemModelObject)
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.userData.userArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userItem = dataSource.userData.userArray[section]
        return userItem.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getEvenItemsTableViewCell(indexPath: indexPath)
    }
    
}
