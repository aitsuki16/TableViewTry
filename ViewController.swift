//
//  ViewController.swift
//  TableViewTry
//
//  Created by Ai on 2020/06/21.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData (opened: false, title: "june 22", sectionData: ["immigration"]),
                         cellData (opened: false, title: "june 23", sectionData: ["city hall"]),
                         cellData (opened: false, title: "june 24", sectionData: ["hina sushi" ]),
                         cellData (opened: false, title: "june 25", sectionData: ["ASS", "bus to kyoto" ]),
                         cellData (opened: false, title: "june 26", sectionData: ["✘" ]),
                         cellData (opened: false, title: "june 27", sectionData: ["✘" ]),
                         cellData (opened: false, title: "june 28", sectionData: ["meet hasuda san" ])]


    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }


}

