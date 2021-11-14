//
//  File.swift
//  swift-loadSaveFiles
//
//  Created by andyhaz on 11/14/21.
//

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
        var readString = "" // Used to store the file contents
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(fileType)
        print("FilePath: \(fileURL.path)")
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
