//
//  ViewController.swift
//  pdfExpt
//
//  Created by taojiachun on 06/05/2018.
//  Copyright © 2018 jiachun tao. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController, PDFDocumentDelegate {
    
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var documentTitle: UILabel!
    
    var document: UIDocument?
    var testNote: PDFAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    @IBAction func addTextNote(_ sender: Any) {
        // Test for function
        print(pdfView.currentPage ?? "??? page")
        insertText(page: pdfView?.currentPage)
    }
    
    @IBAction func showNotes(_ sender: Any) {
        if pdfView.currentPage != nil {
//            print(pdfView.currentPage?.annotations)
//            let isShown = pdfView.currentPage!.displaysAnnotations
//            testNote?.shouldDisplay = false
            
        }
    }
    
    func loadPDF(pdf: PDFDocument, readerView: PDFView?) {
        pdf.delegate = self
        readerView?.document = pdf
    }
    
    func setTitle(pdf: PDFDocument, titleLabel: UILabel?) {
        let title: String = pdf.documentAttributes?["Title"] as? String ?? ""
        let fileName = pdf.documentURL?.pathComponents.last
        titleLabel?.text = title != "" ? title : fileName
    }
    
    func insertText(page: PDFPage?) {
        if page != nil {
            let pageBounds = page!.bounds(for: .cropBox)
            let textFieldMultilineBounds = CGRect(x: 50, y: pageBounds.size.height - 300, width: 320, height: 240)
            let textFieldMultiline = PDFAnnotation(bounds: textFieldMultilineBounds,
                                                   forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue),
                                                   withProperties: nil)
            textFieldMultiline.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.text.rawValue)
            textFieldMultiline.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
            textFieldMultiline.font = UIFont.systemFont(ofSize: 24)
            textFieldMultiline.isMultiline = true
            testNote = textFieldMultiline
            page!.addAnnotation(textFieldMultiline)
        }
    }

}

