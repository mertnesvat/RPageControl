//
//  ViewController.swift
//  RPageControl
//
//  Created by Mert Neşvat on 16/12/15.
//  Copyright © 2015 Mert Neşvat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var pageControl: [RPageControl]!
    
    var imageList = [UIImageView]()
    let heroCount = 8
    var imageWidth : CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
        
    }
    func setupUI(){
        
        imageWidth = scrollView.frame.height * 0.75
        
        
        var co = 1
        for pageC in pageControl {
    
            pageC.passiveImageName = "\(co)_pagingUnselected"
            pageC.spacing = CGFloat(4 + co)
            pageC.imageSize = CGSize(width: 15+co, height: 15+co)
            pageC.pageCount = heroCount
            co++
        }
        
        for index in 0...heroCount-1 {
            
            let imageV = UIImageView(image: UIImage(named: "\(index+1)"))
            imageV.alpha = 0.7
            
            imageV.frame = CGRect(x: CGFloat(index) * imageWidth!, y: 0, width: imageWidth!, height: scrollView.frame.height)
            scrollView.addSubview(imageV)
            imageList.append(imageV)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(imageList.count + 1) * imageWidth!, height: 0)
        scrollView.contentOffset = CGPoint(x: 0, y:0)

        

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let a = imageWidth {
            let index : Int = Int((scrollView.contentOffset.x + (self.view.frame.width/2)) / a)
            
            for pageC in pageControl {
                pageC.updateCurrentPageDisplay(withIndex: index)
            }
            
        
            for i in 0...imageList.count-1 {
                if i == index {
                    imageList[i].alpha = 1
                }else{
                    imageList[i].alpha = 0.5
                }
            }
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

