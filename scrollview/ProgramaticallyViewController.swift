//
//  ProgramaticallyViewController.swift
//  scrollview
//
//  Created by mac on 12/01/24.
//

import UIKit
import WebKit
class ProgramaticallyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //dynamic scroll view
        
        let scroll = UIScrollView()
        view.addSubview(scroll)
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let stackview = UIStackView()
        scroll.addSubview(stackview)
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        stackview.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        stackview.rightAnchor.constraint(equalTo: scroll.rightAnchor).isActive = true
        stackview.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        stackview.spacing = 10
        stackview.backgroundColor = .black
        
        let webview1 = WKWebView()
        webview1.load(URLRequest(url: URL(string: "https://google.com")!))
        stackview.addArrangedSubview(webview1)
        webview1.widthAnchor.constraint(equalTo: stackview.widthAnchor).isActive = true
        webview1.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        webview1.backgroundColor = .red
        
        
        let webview2 = WKWebView()
        webview2.load(URLRequest(url: URL(string: "https://yahoo.com")!))
        stackview.addArrangedSubview(webview2)
        webview2.widthAnchor.constraint(equalTo: stackview.widthAnchor).isActive = true
        webview2.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        webview2.backgroundColor = .red
        
        let lbl3 = UILabel()
        stackview.addArrangedSubview(lbl3)
        lbl3.widthAnchor.constraint(equalTo: stackview.widthAnchor).isActive = true
        lbl3.heightAnchor.constraint(equalToConstant: 400).isActive = true
        lbl3.backgroundColor = .blue
        
    }
    


}
