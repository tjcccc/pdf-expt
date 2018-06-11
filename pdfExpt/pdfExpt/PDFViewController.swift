//
//  ViewController.swift
//  pdfExpt
//
//  Created by taojiachun on 06/05/2018.
//  Copyright © 2018 jiachun tao. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var documentTitle: UILabel!
    
    var document: UIDocument?
//    var pdfDocument: PDFDocument?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set thumbnail view.
//        thumbnailView.pdfView = pdfView
//        thumbnailView.backgroundColor = UIColor.gray
//        thumbnailView.thumbnailSize = CGSize(width: 180, height: 180)
//        thumbnailView.layoutMode = .vertical
        
        // Load pdf file.
        guard document != nil else {
            return
        }
        if let pdfDocument = PDFDocument(url: (document?.fileURL)!) {
            loadPDF(pdf: pdfDocument, readerView: pdfView)
            setTitle(pdf: pdfDocument, titleLabel: documentTitle)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openDocumentBrowser(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let documentBrowserViewController = storyBoard.instantiateViewController(withIdentifier: "DocumentBrowserViewController") as! DocumentBrowserViewController
        present(documentBrowserViewController, animated: true, completion: nil)
    }
    
    func loadPDF(pdf: PDFDocument, readerView: PDFView?) {
        readerView?.document = pdf
    }
    
    func setTitle(pdf: PDFDocument, titleLabel: UILabel?) {
        let title: String = pdf.documentAttributes?["Title"] as? String ?? ""
        let fileName = pdf.documentURL?.pathComponents.last
        titleLabel?.text = title != "" ? title : fileName
    }


}

