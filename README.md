SpriteKit Background Music Guide
<br>
![GitHub downloads](https://img.shields.io/github/downloads/george-lim/spritekit-bgm-guide/total.svg)
[![GitHub release](https://img.shields.io/github/release/george-lim/spritekit-bgm-guide.svg)](https://github.com/george-lim/spritekit-bgm-guide/releases)
[![GitHub issues](https://img.shields.io/github/issues/george-lim/spritekit-bgm-guide.svg)](https://github.com/george-lim/spritekit-bgm-guide/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/george-lim/spritekit-bgm-guide.svg)](https://github.com/george-lim/spritekit-bgm-guide/pulls)
[![license](https://img.shields.io/github/license/george-lim/spritekit-bgm-guide.svg)](https://github.com/george-lim/spritekit-bgm-guide/blob/master/LICENSE)
===============

While working with Apple's SpriteKit framework, I came across an annoying problem which took way too much time to solve - being unable to preserve music from an external app coming into my app, and still play sound effects. This repo contains the simple fix to the problem and an example app to clearly demonstrate the fix.

1. [The Solution](#the-solution)
1. [The Problem Explained](#the-problem-explained)

# The Solution
For those who just want the solution **(SAVAGES)**, here it is. Simply paste the following into your root view controller's `viewDidLoad()` function.

```
do {
    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
    try AVAudioSession.sharedInstance().setActive(true)
} catch let error {
    print(error.localizedDescription)
}
```

Now, you are free to use the `SKAction.playSoundFileNamed(soundFile: String, waitForCompletion: Bool)` action in all of your SKScenes to play sound effects without disturbing the music / external audio source in the background.


# The Problem Explained
For many people using SpriteKit, they may not know that you can still use SKAction's `playSoundFileNamed` function after setting the AVAudioSession category to `Ambient`. In SpriteKit, `SKAction.playSoundFileNamed(...)` is the easiest way to play a sound effect, so many people opt to use the function over AVAudioPlayer.

A few advantages to using SKAction to play sound effects instead of AVAudioPlayer include:
1. You do not need to call `prepareToPlay()` in order to play a simple sound, nor will you experience any delays in playing the sound after the action is ran.
2. You do not need to worry about managing multiple instances of AVAudioPlayer if you want to have the same sound effect played multiple times before the first sound effect finishes.
3. WAY more optimized for game sound effects than AVAudioPlayer.

I was under the (incorrect) impression that I had to use AVAudioPlayer in my app to play sound effects in order to keep my music in the background, but this turns out to be false. I tried a neat framework called [SwiftySound](https://github.com/adamcichy/SwiftySound) at one point to play sounds, but when the same sound effect is called > ten times a second for a game, the game begins lagging due to storing ten references of AVAudioPlayer.

And before I get shot for putting this simple learning experience on GitHub, here is a list of Stack Overflow questions I came across trying to solve the problem I had which **DID NOT HELP.**

1. [questions/24043904/creating-and-playing-a-sound-in-swift](https://stackoverflow.com/questions/24043904/creating-and-playing-a-sound-in-swift)
1. [questions/28996589/swift-spritekit-playing-audio-in-the-background](https://stackoverflow.com/questions/28996589/swift-spritekit-playing-audio-in-the-background)
1. [questions/32312827/in-swift-how-do-i-let-other-apps-continue-to-play-audio-when-my-app-is-open](https://stackoverflow.com/questions/32312827/in-swift-how-do-i-let-other-apps-continue-to-play-audio-when-my-app-is-open)
1. [questions/43929090/play-continuous-short-sound-without-lagging-ui-animation](https://stackoverflow.com/questions/43929090/play-continuous-short-sound-without-lagging-ui-animation)
1. [questions/25503629/avaudioplayer-produces-lag-despite-preparetoplay-in-swift](https://stackoverflow.com/questions/25503629/avaudioplayer-produces-lag-despite-preparetoplay-in-swift)
1. [questions/42462049/avaudioplayer-produces-lag-playing-sound-effect](https://stackoverflow.com/questions/42462049/avaudioplayer-produces-lag-playing-sound-effect)
1. [questions/34680007/simple-low-latency-audio-playback-in-ios-swift](https://stackoverflow.com/questions/34680007/simple-low-latency-audio-playback-in-ios-swift)
1. [questions/31792872/play-sound-effect-without-latency](https://stackoverflow.com/questions/31792872/play-sound-effect-without-latency)
1. [questions/26998764/ios-swift-play-background-music-and-sound-effects-without-delay](https://stackoverflow.com/questions/26998764/ios-swift-play-background-music-and-sound-effects-without-delay)
1. [questions/900461/slow-start-for-avaudioplayer-the-first-time-a-sound-is-played/3082176#3082176](https://stackoverflow.com/questions/900461/slow-start-for-avaudioplayer-the-first-time-a-sound-is-played/3082176#3082176)
1. [questions/5148348/avaudioplayer-lag-when-calling-play](https://stackoverflow.com/questions/5148348/avaudioplayer-lag-when-calling-play)
1. [questions/14162805/playing-sound-effect-with-no-latency-in-objective-c](https://stackoverflow.com/questions/14162805/playing-sound-effect-with-no-latency-in-objective-c)
1. [questions/36865233/get-avaudioplayer-to-play-multiple-sounds-at-a-time](https://stackoverflow.com/questions/36865233/get-avaudioplayer-to-play-multiple-sounds-at-a-time)
1. [questions/16681668/how-to-have-multiple-audio-streams-play-overlapping-in-ios](https://stackoverflow.com/questions/16681668/how-to-have-multiple-audio-streams-play-overlapping-in-ios)
1. [questions/28286767/openal-vs-avaudioplayer-vs-other-techniques-for-playing-sounds](https://stackoverflow.com/questions/28286767/openal-vs-avaudioplayer-vs-other-techniques-for-playing-sounds)
1. [questions/9970817/play-overlapping-sound-in-ios](https://stackoverflow.com/questions/9970817/play-overlapping-sound-in-ios)
1. [questions/3128283/what-is-the-best-way-to-play-sound-quickly-upon-fast-button-presses-xcode?rq=1](https://stackoverflow.com/questions/3128283/what-is-the-best-way-to-play-sound-quickly-upon-fast-button-presses-xcode?rq=1)
