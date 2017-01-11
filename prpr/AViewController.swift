//
//  AViewController.swift
//  prpr
//
//  Created by 곽혜진 on 2017. 1. 11..
//  Copyright © 2017년 hyejin. All rights reserved.
//

import UIKit

class AViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet var collectionView: UICollectionView!
    var imgs : [UIImage] = [UIImage(named: "0")!, UIImage(named: "1")!, UIImage(named: "2")!]
    
    @IBOutlet var pageControl: UIPageControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
        
        configurePageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ACell", for: indexPath) as! ACollectionViewCell
        
        cell.cellImg.image = imgs[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("선택ㅋㅋㅋㅋㅋㅋㅋㅋ")
    }
    
    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = imgs.count
        self.pageControl.currentPage = 0
        
    }

    
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        // scrollView 대신 collectionView
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    

}
