//
//  GameScene.swift
//  SpriteKitBackgroundMusic
//
//  Created by George Lim on 2017-08-29.
//  Copyright © 2017 George Lim. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  let sound = SKAction.playSoundFileNamed("sound.wav", waitForCompletion: false)
  
  // From this point onward, you are free to use SKAction.playSoundFileNamed(soundFile: String, waitForCompletion: Bool) to play sound effects. Your background music will still play as desired.
  override func didMove(to view: SKView) {
    view.backgroundColor = UIColor(white: 50 / 255, alpha: 1)
    let label = SKLabelNode()
    label.text = "Tap anywhere to play a sound effect."
    label.verticalAlignmentMode = .center
    label.fontSize = UIScreen.main.bounds.width / 20
    label.fontColor = .white
    label.position = view.center
    addChild(label)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    run(sound)
  }
}
