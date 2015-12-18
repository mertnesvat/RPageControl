# RPageControl

![Presentation](https://lh3.googleusercontent.com/-MshkX-Za3Vs/VnPuucMWhPI/AAAAAAAAGGY/WGo_qjeC54w/s0/RPageControl.gif "RPageControl.gif")
Basic Custom PageControl for **Swift**

###Installation 
Download project drag & drop RPageControl.swift to your project. 

###Usage
1 - Default bullet image size is 15x15 and you need to add bullets image first. 

2 - Drag a view and set class RPageControl and than set parameters like below;


            pageControl.activeImageName = "activeImageName"
            pageControl.passiveImageName = "passiveImageName"
            pageControl.pageCount = pageNumber
           
You can also change **spacing** and **image size**

            pageControl.spacing = CGFloat(5)
            pageControl.imageSize = CGSize(width: 15, height: 15)

PS : You can add autlayout attributes to your view, like in sample project. Lastly *Hi! Dota2 Lovers!* 