//
//  TableViewCell.swift
//  StudentApp
//
//  Created by swati mane on 13/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    
    var student:Student!{
        didSet{
            lblName.text = student.name
            lblEmail.text = student.email
            lblMobile.text = student.mobile
            lblCourse.text = student.course
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
