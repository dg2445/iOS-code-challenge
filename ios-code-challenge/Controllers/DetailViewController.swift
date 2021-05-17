//
//  DetailViewController.swift
//  ios-code-challenge
//
//  Created by Joe Rocca on 5/31/19.
//  Copyright © 2019 Dustin Lange. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var thumbNailImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    lazy private var favoriteBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Star-Outline"), style: .plain, target: self, action: #selector(onFavoriteBarButtonSelected(_:)))
    
    @objc var detailItem: NSDate?
    var _business: NSObject?
    
    private var _favorite: Bool = false
    private var isFavorite: Bool {
        get {
            return _favorite
        } 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        navigationItem.rightBarButtonItems = [favoriteBarButtonItem]
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "didSelectCell"), object:nil)
    }
    
    @objc func updateView(_ notification:Notification) {
        _favorite = false
        updateFavoriteBarButtonState()
        let business = notification.object as! YLPBusiness
        _business = business
        nameLabel.text = business.name
        thumbNailImage.image = UIImage.init(data: business.image)
        var categories = "Categories: "
        var delimiterCount = (business.categories.count - 1)
        for category in business.categories {
            let dict = category as! Dictionary<String, Any>
            let c = dict["title"] as! String
            categories = categories + c
            if (delimiterCount != 0) {
                categories = categories + ", "
                delimiterCount -= 1
            }
        }
        categoriesLabel.text = categories
        ratingLabel.text = "Rating: " + business.rating.stringValue
        reviewCountLabel.text = "Reviews:" + business.reviews.stringValue
        priceLabel.text = "Price: " + business.price
    }
    
    private func configureView() {
        guard let detailItem = detailItem else { return }
        detailDescriptionLabel.text = detailItem.description
    }
    
    func setDetailItem(newDetailItem: NSDate) {
        guard detailItem != newDetailItem else { return }
        detailItem = newDetailItem
        configureView()
    }
    
    private func updateFavoriteBarButtonState() {
        favoriteBarButtonItem.image = isFavorite ? UIImage(named: "Star-Filled") : UIImage(named: "Star-Outline")
    }
    
    @objc private func onFavoriteBarButtonSelected(_ sender: Any) {
        _favorite.toggle()
        updateFavoriteBarButtonState()
    }
}
