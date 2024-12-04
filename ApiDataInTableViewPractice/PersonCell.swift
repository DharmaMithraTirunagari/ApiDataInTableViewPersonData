//
//  PersonCell.swift
//  ApiDataInTableViewPractice
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personId: UILabel!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personUsername: UILabel!
    
    @IBOutlet weak var personPhone: UILabel!
    
    @IBOutlet weak var geoLat: UILabel!
    @IBOutlet weak var addressCity: UILabel!
    @IBOutlet weak var addressSuite: UILabel!
    @IBOutlet weak var addressStreet: UILabel!
    @IBOutlet weak var personEmail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(from person: PersonModel) {
        
        personId.text = "ID: \(person.id)"
        personName.text = "Name: \(person.name)"
        personUsername.text = "Username: \(person.username)"
        personPhone.text = "Phone: \(person.phone)"
        geoLat.text = "Latitude: \(person.address.geo.lat)"
        addressCity.text = "City: \(person.address.city)"
        addressSuite.text = "Suite: \(person.address.suite)"
        
    }

}
