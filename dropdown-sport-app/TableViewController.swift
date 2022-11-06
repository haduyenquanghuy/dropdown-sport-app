//
//  ViewController.swift
//  dropdown-sport-app
//
//  Created by Ha Duyen Quang Huy on 05/11/2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    fileprivate let CELL_ID = "CELL_ID"
    
    fileprivate var sections: [SectionData] = [
        
        SectionData(open: true,
                    data: [CellData(title: "H", featureImage: UIImage(named: "0")!),
                           CellData(title: "U", featureImage: UIImage(named: "1")!),
                           CellData(title: "Y", featureImage: UIImage(named: "2")!)]),
        SectionData(open: false,
                    data: [CellData(title: "P", featureImage: UIImage(named: "1")!),
                           CellData(title: "R", featureImage: UIImage(named: "2")!),
                           CellData(title: "O", featureImage: UIImage(named: "3")!)]),
        SectionData(open: true,
                    data: [CellData(title: "A", featureImage: UIImage(named: "2")!),
                           CellData(title: "C", featureImage: UIImage(named: "3")!),
                           CellData(title: "E", featureImage: UIImage(named: "1")!)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.backgroundColor = UIColor.init(red: 228/255, green: 230/255, blue: 234/255, alpha: 1)
        navigationItem.title = "spots"
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        
        tableView.register(CardCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
}

extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sections[section].open {
            return 0
        }
        return sections[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! CardCell
        let cellData = sections[indexPath.section].data[indexPath.row]
        cell.cellData = cellData
        cell.animate()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("close", for: .normal)
        button.tag = section
        button.addTarget(self, action: #selector(openSection), for: .touchUpInside)
        return button
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    @objc fileprivate func openSection(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        
        for row in sections[section].data.indices {
            
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }
        
        let isOpen = sections[section].open
        sections[section].open = !isOpen
        
        button.setTitle(isOpen ? "open" : "close", for: .normal)
        
        if isOpen {
            
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
}

