//
//  MasterViewControllerS.swift
//  ios-code-challenge
//
//  Created by Joe Rocca on 5/31/19.
//  Copyright © 2019 Dustin Lange. All rights reserved.
//

import UIKit
import CoreLocation

class MasterViewController: UITableViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var detailViewController: DetailViewController?
    
    let locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    let queryHelper = QueryHelpers()
    
    var _limit = 20
    var _offset = 0
    
    lazy private var dataSource: NXTDataSource? = {
        guard let dataSource = NXTDataSource(objects: nil) else { return nil }
        dataSource.tableViewDidReceiveData = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        searchBar.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(getNextPage), name: NSNotification.Name(rawValue: "didReachBottomOfList"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController?.isCollapsed ?? false
        detailViewController?.categoriesLabel.text = "foooo" // is nil.
        super.viewDidAppear(animated)
    }
    
    // MARK: - Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            currentLocation = loc
           let query = queryHelper.buildQuery(term:"", sortBy: "distance", location: loc, limit: Int32(_limit), offset: Int32(_offset))
            submitQuery(query: query)
        }
    }

    // MARK: - Query Yelp
    
    func submitQuery(query: YLPSearchQuery) {
        AFYelpAPIClient.shared().search(with: query, completionHandler: { [weak self] (searchResult, error) in
            guard let strongSelf = self,
                  let dataSource = strongSelf.dataSource,
                  let businesses = searchResult?.businesses else {
                return
            }
            dataSource.setObjects(businesses)
            strongSelf.tableView.reloadData()
        })
    }
    
    //MARK: - Pagination
    
    @objc func getNextPage()
    {
        _offset = _offset + _limit
        let query = queryHelper.buildQuery(term: "", sortBy: "distance", location: currentLocation, limit: Int32(_limit), offset: Int32(_offset))
        submitQuery(query: query)
    }
}


extension MasterViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = queryHelper.buildQuery(term: searchBar.text ?? "", sortBy: "distance", location: currentLocation, limit: 20, offset: 0)
        submitQuery(query: query)
        searchBar.resignFirstResponder()
    }
}
