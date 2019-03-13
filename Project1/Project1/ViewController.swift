//
//  ViewController.swift
//  Project1
//
//  Created by Vigneshkumar G on 13/03/19.
//  Copyright © 2019 viki. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        print(path)
        for item in items {
            if item.hasPrefix("nssl") {                
                pictures.append(item)
            }
        }
        pictures.sort()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedModel = DetailModel(index: indexPath.row + 1, total: pictures.count, selectedImage: pictures[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
