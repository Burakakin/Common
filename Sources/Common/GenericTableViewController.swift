//
//  GenericTableView.swift
//  EarthquakeAppTurkey
//
//  Created by Burak AKIN on 29.08.2021.
//  Copyright © 2021 Burak AKIN. All rights reserved.
//

import UIKit

//MARK: Example Usage

//    func setupTableView() {
//        self.tableViewController = GenericTableViewController< Earthquake, HomeCell>.init(items: presenter.earthquakes, configure: { cell, item in
//            cell.configureCell(earthquake: item)
//        }, didSelect: { earthquake in
//            guard let earthquakeId = earthquake.id else {
//                self.showAlert(withMessage: "Lütfen daha sonra tekrar deneyiniz.")
//                return
//            }
//            self.showEarthquakeDetail(documentId: earthquakeId)
//        })
//
//        self.add(tableViewController, frame: view.frame)
//        self.tableViewController.view.backgroundColor = UIColor.appColor(.darkGrayDarkMode)
//
//        refreshControl.attributedTitle = NSAttributedString(string: "Yükleniyor..")
//        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
//        self.tableViewController.view.addSubview(refreshControl)
//    }

public class GenericTableViewController <T, Cell: UITableViewCell>: UITableViewController {

    private var items: [T] = []
    private var configure: (Cell, T) -> ()
    private var didSelect: (T) -> ()
    
    public init(items: [T],
         configure: @escaping (Cell, T) -> (),
         didSelect: @escaping (T) -> ()) {
        self.items = items
        self.configure = configure
        self.didSelect = didSelect
        super.init(style: .plain)
        self.tableView.registerCell(ofType: Cell.self)
        self.tableView.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count == 0 {
            tableView.backgroundView = TableViewEmptyListMessageView(message: "Gösterilecek veri bulunamadı.")
        } else {
            tableView.backgroundView = nil
        }
        return items.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
        configure(cell, items[indexPath.row])
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelect(items[indexPath.row])
    }
    
    public func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}

extension UITableView {
/**
Registers a cell with the table view.
Depends on the assumption that the cell's reuse identifier matches its class name.
If a nib is found in the main app bundle with a filename matching the cell's class name, that nib is registered with the table view. Otherwise, the cell's class is registered with the table view.
- parameters:
   - type: The class type of the cell to register.
*/
    public func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
    
    public func dequeueCell<T: UITableViewCell>(ofType type: T.Type, indexPath: IndexPath) -> T     {
          let cellName = String(describing: T.self)
           
          return dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! T
       }
}
