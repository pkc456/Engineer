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
    
    //MARK:- User defined methods
    
    ///This methood register the custom table cells so that they can be reused
    private func registerTableCells(){
        tableview.register(UINib.init(nibName: "EvenItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenItemsTableViewCell")
        
        tableview.register(UINib.init(nibName: "OddItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "OddItemsTableViewCell")
    }
    
    ///Reload view with new table datasource
    /// - parameter homeModel: home model object
    func reloadViewWithModel(homeModel: Home){
        dataSource = homeModel
        tableview.reloadData()
    }
    
    /// Determine wether the odd items UI will be shown or not
    /// - parameter data: Home user item model object
    /// - Returns: A boolean value whether to show odd item UI or not
    func isOddItemUIShown(data: HomeUserItem) -> Bool{        
        return (data.items?.count ?? 0) % 2 == 0 ? false : true
    }
    
    /// Determine the number of rows in section
    /// - parameter data: Home user item model object
    /// - Returns: The number of rows in section.
    func calculateNumberOfRow(data: HomeUserItem) -> Int{
        let isOdd = isOddItemUIShown(data: data)
        
        var numberOfRows = (data.items?.count ?? 0)/2
        numberOfRows = isOdd ? (numberOfRows + 1) : numberOfRows
        return numberOfRows
    }
    
    
    //MARK:- Table view cells
    
    ///This method returns the Even Items Table View Cell
    /// - parameter indexPath: An index path locating a row in tableView.
    /// - parameter data: Home user item model object
    /// - Returns: EvenItems Table View Cell instance
    func getEvenItemsTableViewCell(indexPath: IndexPath, data: HomeUserItem) -> EvenItemsTableViewCell{
        let cell = tableview.dequeueReusableCell(withIdentifier: "EvenItemsTableViewCell", for: indexPath) as! EvenItemsTableViewCell
        return cell
    }
    
    ///This method returns the Odd Items Table View Cell
    /// - parameter indexPath: An index path locating a row in tableView.
    /// - Returns: OddItems Table View Cell instance
    func getOddItemsTableViewCell(indexPath: IndexPath) -> OddItemsTableViewCell{
        let cell = tableview.dequeueReusableCell(withIdentifier: "OddItemsTableViewCell", for: indexPath) as! OddItemsTableViewCell
        
        let data = dataSource.userData.userArray[0]
        cell.initiateWith(imageUrlString: data.image)
        
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
        return calculateNumberOfRow(data: userItem)                
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userItem = dataSource.userData.userArray[indexPath.section]
        let isOddUI = isOddItemUIShown(data: userItem)
        
        if isOddUI && indexPath.row == 0{
            return getOddItemsTableViewCell(indexPath: indexPath)
        }else{
            return getEvenItemsTableViewCell(indexPath: indexPath,data: userItem)
        }
        
        
    }
    
}
