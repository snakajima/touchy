//
//  ViewController.swift
//  touchy
//
//  Created by satoshi on 8/8/18.
//  Copyright © 2018 Satoshi Nakajima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var last = CGPoint.zero

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func clear(_ sender:UIBarButtonItem) {
    for subview in view.subviews {
      subview.removeFromSuperview()
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchBegan")
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let loc = touch.location(in: view)
    let (dx, dy) = (loc.x-last.x, loc.y-last.y)
    let distance = sqrt(dx*dx + dy*dy)
    let radius:CGFloat = 400.0 / (10.0 + distance)
    let rc = CGRect(origin: loc, size: .zero).insetBy(dx: -radius, dy: -radius)
    let subview = UIView(frame: rc)
    subview.backgroundColor = UIColor.red
    subview.layer.cornerRadius = radius
    subview.layer.masksToBounds = true
    view.addSubview(subview)
    
    last = loc
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchCancelled")
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchEnded")
  }
  
}

