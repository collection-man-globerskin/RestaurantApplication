//
//  LocationViewController.swift
//  RestaurantApp
//
//  Created by Julian Llorensi on 28/05/2019.
//  Copyright © 2019 globant. All rights reserved.
//

import UIKit

protocol LocationActions: class {
    func didTapAllow()
}

class LocationViewController: UIViewController {
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    var didTapDenied: (() -> Void)?
    
    weak var delegate: LocationActions?
    // var locationService: LocationService?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.didTapAllow = { [weak self] in
            print("Allowed")
            self?.delegate?.didTapAllow()
            // self?.locationService?.requestLocationAuthorization()
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func allowAction(_ sender: UIButton) {
        didTapAllow?()
    }
    
    @IBAction func denyAction(_ sender: UIButton) {
        didTapDenied?()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
