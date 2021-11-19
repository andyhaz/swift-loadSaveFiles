//
//  File.swift
//  swift-loadSaveFiles
// version 0.1
//  Created by andyhaz on 11/14/21.
//
//        let fm = GRSFileManager(fileType: ".txt", localFileName: "ProjectTextFile")
//        let fileData:String = fm.open_file(fileName: "Test")
//  `     print(fileData)

import Foundation

class GRSFileManager{
    let fileType:String
    let localFileName:String
    
    init(fileType:String, localFileName:String){
        self.fileType = fileType
        self.localFileName = localFileName
    }
    
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

    func open_file(fileName:String) -> String {
        // code here
        var readString = fileName // Used to store the file contents from the function call
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(fileType)
        print("FilePath: \(fileURL.path)")//show the path
        do {
            // Read the file contents
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        print("File Text: \(readString)")
        
        /*** Read from project txt file ***/
        // File location
        let fileURLProject = Bundle.main.path(forResource: "ProjectTextFile", ofType: "txt")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
             print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }

        print("local file: \(readStringProject)")
        
        return readStringProject
    }
    
    func save_file(fileName:String) -> String{
        // Save data to file
        let fileName = "Test"
   //     let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        let writeString = "Write this text to the fileURL as text in iOS using Swift"
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        return writeString
    }
    
}
