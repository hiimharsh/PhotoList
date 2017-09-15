//
//  ViewController.swift
//  PhotoList
//
//  Created by Harsh on 08/09/17.
//  Copyright © 2017 Harsh. All rights reserved.
//

import UIKit

class ExploreController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let profileImageURL = "https://www.sunrift.com/wp-content/uploads/2014/12/Blake-profile-photo-square.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavigationBarItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigationBarItems () {
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = "Explore"
        
        let leftMenuButton = UIButton(type: .system)
        leftMenuButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let rightProfileIcon = UIImageView()
        rightProfileIcon.downloadedFrom(link: profileImageURL)
        rightProfileIcon.contentMode = .scaleAspectFit
        rightProfileIcon.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightProfileIcon.layer.cornerRadius = 30 / 2
        rightProfileIcon.clipsToBounds = true
        rightProfileIcon.isUserInteractionEnabled = true
        
        //let openProfileTap = UITapGestureRecognizer(target: self, action: #selector(openProfile(tap:)))
        //rightProfileIcon.addGestureRecognizer(openProfileTap)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftMenuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightProfileIcon)
        
    }
    
    func openProfile (tap: UITapGestureRecognizer) {
        //self.present(ExploreController(), animated: true, completion: nil)
        navigationController?.pushViewController(ExploreController(), animated: true)
    }

}

extension ExploreController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath) as! ProfileViewCell
        
        cell.profileImage.downloadedFrom(link: profileImageURL)
        cell.profileImage.layer.cornerRadius = 40 / 2
        cell.profileImage.clipsToBounds = true
        
        cell.name.text = "Harsh Tanna"
        cell.proffesion.text = "Developer"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200.0
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileImageCell", for: indexPath) as! ProfileImageCell
        
        cell.profileImages.downloadedFrom(link: profileImageURL)
        
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 10, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
}

class ProfileViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var proffesion: UILabel!
    
}

class ProfileImageCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImages: UIImageView!
    
}
