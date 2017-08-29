//
//  GameViewController.swift
//  SpriteKitBackgroundMusic
//
//  Created by George Lim on 2017-08-29.
//  Copyright © 2017 George Lim. All rights reserved.
//

import SpriteKit
import AVFoundation

// MARK: - Setup GameViewController programmatically. IGNORE.

class GameViewController: UIViewController {

  override func loadView() {
    view = SKView()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func viewWillLayoutSubviews() {
    guard let view = view as? SKView else { return }
    view.ignoresSiblingOrder = true
    
    let scene = GameScene(size: view.bounds.size)
    scene.scaleMode = .aspectFill
    
    view.presentScene(scene)
  }
}

// MARK: - Setup background audio. All code is wrapped in an extension for easier visibility.

extension GameViewController {
  
  override func viewDidLoad() {
    sendAudioToBackground()
  }
  
  // Allows music to continue playing in the background. Call this function in the viewDidLoad() of your rootViewController defined in 'AppDelegate.swift'.
  private func sendAudioToBackground() {
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
      try AVAudioSession.sharedInstance().setActive(true)
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
