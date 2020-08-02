//
//  ViewController.swift
//  ShowMore
//
//  Created by Namrata Jain on 01/04/20.
//  Copyright © 2020 Namrata Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var showMoreButton: UIButton!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var shareButton: UIButton!
  @IBOutlet weak var subscribeButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setButtonsStyle()
    likeButton.center = CGPoint(x: showMoreButton.center.x, y: showMoreButton.center.y)
    shareButton.center = CGPoint(x: showMoreButton.center.x, y: showMoreButton.center.y)
    subscribeButton.center = CGPoint(x: showMoreButton.center.x, y: showMoreButton.center.y)

  }

  func setButtonsStyle() {
    showMoreButton.layer.cornerRadius = 32
    likeButton.layer.cornerRadius = 32
    shareButton.layer.cornerRadius = 32
    subscribeButton.layer.cornerRadius = 32

    showMoreButton.layer.borderColor = UIColor.black.cgColor
    showMoreButton.layer.borderWidth = 3
    likeButton.layer.borderColor = UIColor.black.cgColor
    likeButton.layer.borderWidth = 3
    shareButton.layer.borderColor = UIColor.black.cgColor
    shareButton.layer.borderWidth = 3
    subscribeButton.layer.borderColor = UIColor.black.cgColor
    subscribeButton.layer.borderWidth = 3

  }

  @IBAction func showMoreButtonAction(_ sender: AnyObject) {
    if showMoreButton.isSelected {
      self.hideMoreOptions()
      self.showMoreButton.isSelected = false
    } else {
      self.showMoreOptions()
      self.showMoreButton.isSelected = true
    }
  }
  
  func showMoreOptions() {
     let totalAnimationDuration = 0.5
     UIView.animateKeyframes(withDuration: TimeInterval(totalAnimationDuration), delay: 0, options: .calculationModeCubic, animations: {
       
       UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
        self.showMoreButton.transform = CGAffineTransform(rotationAngle: .pi/2)
         self.likeButton.center = self.getPoint(angle: 0)
       })
       UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
         self.shareButton.center = self.getPoint(angle: -45)
       })
       UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
         self.subscribeButton.center = self.getPoint(angle: -90)
       })

     }, completion: nil)
   }
  
  func hideMoreOptions() {
    let totalAnimationDuration = 0.3
    let point = CGPoint(x: showMoreButton.center.x, y: showMoreButton.center.y)
    UIView.animateKeyframes(withDuration: TimeInterval(totalAnimationDuration), delay: 0, options: .calculationModeCubic, animations: {
      
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
        self.showMoreButton.transform = CGAffineTransform(rotationAngle: 0)
        self.likeButton.center = point
      })
      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
        self.shareButton.center = point
      })
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
        self.subscribeButton.center = point
      })

    }, completion: nil)
    
  }
  
  func getPoint(angle: Double) -> CGPoint {
    let radians = angle * .pi/180
    let x = Double(showMoreButton.center.x) + 200 * cos(radians)
    let y = Double(showMoreButton.center.y) + 200 * sin(radians)
    
    let point = CGPoint(x: x, y: y)
    return point
  }
}

