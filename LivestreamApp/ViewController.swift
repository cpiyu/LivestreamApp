////
////  ViewController.swift
////  LivestreamApp
////
////  Created by Priya Chaurasiya on 17/03/24.
////
//
//import UIKit
//import AgoraRtcKit
//
//class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    var channelName = "default"
//    var remoteUserIDs: [UInt] = []
//    
//    let appID = "c072975f171945f8a3e7d0fb52caa734"
//    var agoraKit: AgoraRtcEngineKit?
//    let tempToken: String? = nil //If you have a token, put it here.
//    var userID: UInt = 0 //This tells Agora to generate an id for you. If you have unique user IDs already, you can use those.
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var localVideoView: UIView!
//    @IBOutlet weak var muteButton: UIButton!
//    @IBOutlet weak var hangUpButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//    
//    private func getAgoraEngine() -> AgoraRtcEngineKit {
//        if agoraKit == nil {
//            agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: appID, delegate: self)
//        }
//        return agoraKit!
//    }
//    
//    
//    func setUpVideo() {
//        getAgoraEngine().enableVideo()
//
//        let videoCanvas = AgoraRtcVideoCanvas()
//        videoCanvas.uid = userID
//        videoCanvas.view = localVideoView
//        videoCanvas.renderMode = .fit
//        getAgoraEngine().setupLocalVideo(videoCanvas)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return remoteUserIDs.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath)
//
//        let remoteID = remoteUserIDs[indexPath.row]
//        if let videoCell = cell as? VideoCollectionViewCell {
//            let videoCanvas = AgoraRtcVideoCanvas()
//            videoCanvas.uid = remoteID
//            videoCanvas.view = videoCell.videoView
//            videoCanvas.renderMode = .fit
//            getAgoraEngine().setupRemoteVideo(videoCanvas)
//        }
//
//        return cell
//    }
//    
//    
//    var muted = false {
//        didSet {
//            if muted {
//                muteButton.setTitle("Unmute", for: .normal)
//            } else {
//                muteButton.setTitle("Mute", for: .normal)
//            }
//        }
//    }
//
//    @IBAction func didToggleMute(_ sender: Any) {
//        if muted {
//            getAgoraEngine().muteLocalAudioStream(false)
//        } else {
//            getAgoraEngine().muteLocalAudioStream(true)
//        }
//        muted = !muted
//    }
//    
//    @IBAction func didTapHangUp(_ sender: Any) {
//        leaveChannel()
//    }
//
//    func leaveChannel() {
//        getAgoraEngine().leaveChannel(nil)
//        localVideoView.isHidden = true
//        remoteUserIDs.removeAll()
//        collectionView.reloadData()
//    }
//    
//    
//    func joinChannel() {
//        localVideoView.isHidden = false
//        
//        getAgoraEngine().joinChannel(byToken: tempToken, channelId: channelName, info: nil, uid: userID) { [weak self] (sid, uid, elapsed) in
//            self?.userID = uid
//        }
//    }
//
//
//}
//
//
//
//
//
//extension ViewController: AgoraRtcEngineDelegate {
//    
//    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
//           remoteUserIDs.append(uid)
//           collectionView.reloadData()
//       }
//
//       func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
//           if let index = remoteUserIDs.firstIndex(where: { $0 == uid }) {
//               remoteUserIDs.remove(at: index)
//               collectionView.reloadData()
//           }
//       }
//
//}
//
