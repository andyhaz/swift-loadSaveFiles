//
//  ViewController.swift
//  swift-loadSaveFiles
//
//  Created by andyhaz on 11/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = GRSFileManager(fileType: ".txt", localFileName: "ProjectTextFile")
        let fileData:String = fm.open_file(fileName: "Test")
        print(fileData)
    }
}
