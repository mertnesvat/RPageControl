//
//  RPageControl.swift
//
//
//  Created by Mert Neşvat on 14/12/15.
//  Copyright © 2015 ramistanbul. All rights reserved.
//

import UIKit

struct Bullet {
    
    var index : Int = 0
    var spacing : CGFloat = 5
    var imageSize : CGSize = CGSizeMake(15, 15)
    var activeDot : UIImage = UIImage()
    var passiveDot : UIImage = UIImage()
    var imageV : UIImageView = UIImageView()
    var active : Bool = false {
        didSet {
            if active == true {
                self.imageV.image = self.activeDot
            }else{
                self.imageV.image = self.passiveDot
            }
        }
        
    }
    
    init(isActive : Bool, withIndex i : Int, position : Int, gap : CGFloat, selectedBulletImageName : String, unSelectedBulletImageName : String){
        
        self.active = isActive
        self.index = i
        self.activeDot = UIImage(named: selectedBulletImageName)!
        self.passiveDot = UIImage(named: unSelectedBulletImageName)!
        self.spacing = gap
        self.imageV  = UIImageView(frame: CGRect(x: CGFloat(position) * CGFloat(spacing+imageSize.width) , y: 0, width: imageSize.width, height: imageSize.height))
        
        
        
    }
}


class RPageControl : UIView {
    
    
    //meaurements and settings
    var spacing : CGFloat = 5
    var imageSize : CGSize = CGSizeMake(15, 15)
    var activeImageName : String = "defaultActiveBullet"
    var passiveImageName : String = "defaultPassiveBullet"
    var pageBulletArray : [Bullet] = []
    
    var currentPage : Int = 0
    var pageCount : Int = 0 {
        didSet{
            pageBulletArray.removeAll()
            
            var relativeIndex = pageCount/2
            relativeIndex = -relativeIndex
            for i in 0...pageCount{
                
                //                let bullet = Bullet(isActive: false, withIndex: i, position: relativeIndex)
                let bullet = Bullet(isActive: false, withIndex: i, position: relativeIndex, gap: spacing, selectedBulletImageName: activeImageName, unSelectedBulletImageName: passiveImageName)
                pageBulletArray.append(bullet)
                self.addSubview(bullet.imageV)
                relativeIndex++
            }
            self.updateCurrentPageDisplay(withIndex: 0)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.pageCount = 3
        
    }
    
    
    func updateCurrentPageDisplay(withIndex i: Int){
        
        for var b in self.pageBulletArray {
            if i == b.index {
                b.active = true
            }else{
                b.active = false
            }
        }
        
        
    }
    
}
