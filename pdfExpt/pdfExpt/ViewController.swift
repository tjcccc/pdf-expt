//
//  ViewController.swift
//  pdfExpt
//
//  Created by taojiachun on 06/05/2018.
//  Copyright © 2018 jiachun tao. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filesView: UIView!
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var thumbnailView: PDFThumbnailView!
    
//    var document: PDFDocument?
    var fileUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load pdf file.
        fileUrl = Bundle.main.url(forResource: "test", withExtension: "pdf")
        if let document = PDFDocument(url: fileUrl!) {
            pdfView.document = document
            thumbnailView.pdfView = pdfView
            thumbnailView.backgroundColor = UIColor.gray
            thumbnailView.thumbnailSize = CGSize(width: 180, height: 180)
            thumbnailView.layoutMode = .vertical
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openPDF() {
        
    }


}

