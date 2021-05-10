//
//  SecondViewController.swift
//  CApp
//
//  Created by user on 2021/5/6.
//  Copyright © 2021 JerryStdudio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var fullScreenSize :CGSize! = UIScreen.main.bounds.size
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = ["Animal1","animal2","animal3","animal4","animal5"]
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
            //iPhone直向
            return CGSize(width: CGFloat(fullScreenSize.width)/4 - 10, height: CGFloat(fullScreenSize.width)/4 - 10)
        }else{
            return CGSize(width: CGFloat(fullScreenSize.height)/4 - 10, height: CGFloat(fullScreenSize.height)/4 - 10)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
    
    func numberOfSectionsInCollectionView(
        collectionView: UICollectionView) -> Int {
        return 1    // 顯示幾個Section
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count     //顯示幾張圖片
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for:indexPath as IndexPath) as! MyCollectionViewCell
        cell.imageView.image = UIImage(named:images[indexPath.row])
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
