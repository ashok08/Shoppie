//
//  QuoteViewController.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit
import ObjectMapper

class MyClosetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    var dataSource = ClosetDataModel()
    var loanCloset = [ClosetModel]()
    var availableCloset = [ClosetModel]()

    var tags = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.fetchData()
    }
   
     func fetchData()
    {
        self.dataSource.fetchCloset(onSuccess: { (result) in
            self.availableCloset = result
            self.tableView.reloadData()
        })
        
    }
    
    @objc func tabBtnTapped(sender: UIButton) {
        self.tags = sender.tag
        self.tableView.reloadData()
    }
    
    
}
extension MyClosetViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 5:
            if tags == 0{ return self.loanCloset.count}else{ return self.availableCloset.count}
        default:
            return 1
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
        let cell = tableView.dequeue("SectionLabelTVCell", SectionLabelTVCell.self)
            cell.availableBtn.addTarget(self, action: #selector(self.tabBtnTapped(sender:)), for: .touchUpInside)
            cell.loanedBtn.addTarget(self, action: #selector(self.tabBtnTapped(sender:)), for: .touchUpInside)
            if tags == 0{
                cell.loanedView.isHidden = false
                cell.availableView.isHidden = true
                cell.titleLbl.text = "LOANED"
            }else{
                cell.loanedView.isHidden = true
                cell.availableView.isHidden = false
                cell.titleLbl.text = "AVAILABLE"

            }
        return cell
        case 2:
        let cell = tableView.dequeue("SectionItemTVCell", SectionItemTVCell.self)
            if tags == 0{ cell.titleLbl.text = "UPCOMING"}else{cell.titleLbl.text = "CATEGORY"}
            cell.itemLbl.text = "1 Item"
        return cell
        case 3:
            if tags == 0{
                let cell = tableView.dequeue("ItemCardTVCell", ItemCardTVCell.self)
                if self.loanCloset.count > 0{ cell.setUI(values: self.loanCloset.first!, index:  indexPath.row)  }
                cell.delegate = self
                return cell
            }else{
            let cell = tableView.dequeue("AvailableTVCell", AvailableTVCell.self)
                cell.setUI(values: self.availableCloset.first!, index:  indexPath.row)
                cell.delegate = self
            return cell
            }
        case 4:
            let cell = tableView.dequeue("SectionItemTVCell", SectionItemTVCell.self)
            cell.titleLbl.text = "CATAGORY"
            if tags == 0{ cell.itemLbl.text = "\(self.loanCloset.count) Items"}else{cell.itemLbl.text = "\(self.availableCloset.count) Items"}
            return cell
        case 5:
            if tags == 0{
                let cell = tableView.dequeue("ItemCardTVCell", ItemCardTVCell.self)
                cell.setUI(values: self.loanCloset[indexPath.row], index:  indexPath.row)
                cell.delegate = self
                return cell
            }else{
            let cell = tableView.dequeue("AvailableTVCell", AvailableTVCell.self)
                cell.setUI(values: self.availableCloset[indexPath.row], index: indexPath.row)
                cell.delegate = self
            return cell
            }
        default:
        let cell = tableView.dequeue("HeaderTVCell", HeaderTVCell.self)
            cell.totalLbl.text = "\(self.loanCloset.count + self.availableCloset.count)"
            cell.loanedLbl.text = "\(self.loanCloset.count)"
            cell.avaibleLbl.text = "\(self.availableCloset.count)"
        return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch  indexPath.section {
        case 1:
            return 150
        case 2:
            if tags == 0{  if loanCloset.count > 0{return 30}else{return 0}}else{ if availableCloset.count > 0{return 30}else{return 0}}
        case 3,5:
            if tags == 0{  if loanCloset.count > 0{return 120}else{return 0}}else{ if availableCloset.count > 0{return 120}else{return 0}}
        case 4:
            if tags == 0{  if loanCloset.count > 0{return 30}else{return 0}}else{ if availableCloset.count > 0{return 30}else{return 0}}
        default:
            return 140
        }
    }
 
}
extension MyClosetViewController:SwipeDelegate{
    func swipeDelegateMethod(type: Int, index: Int) {
        if type == 0{
            let closet = self.availableCloset[index]
            self.availableCloset.remove(at: index)
            self.loanCloset.append(closet)
            self.tableView.reloadData()
        }else{
            let closet = self.loanCloset[index]
            self.loanCloset.remove(at: index)
            self.availableCloset.append(closet)
            self.tableView.reloadData()
        }
    }
  
    
}
