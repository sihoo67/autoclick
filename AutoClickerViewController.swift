import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    let fiveMinutes: TimeInterval = 5 * 60 // 5분
    let tenMinutes: TimeInterval = 10 * 60 // 10분
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("앱 종료", for: .normal)
        button.addTarget(self, action: #selector(exitApp), for: .touchUpInside)
        button.isHidden = true // 초기에는 숨김
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 추가
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 타이머 시작
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        elapsedTime += 1
        
        if elapsedTime >= fiveMinutes && elapsedTime < tenMinutes {
            // 5분이 지나면 버튼 표시
            exitButton.isHidden = false
        } else if elapsedTime >= tenMinutes {
            // 10분이 지나면 버튼을 눌러 앱 종료
            exitButton.setTitle("앱 종료 (10분 초과)", for: .normal)
        }
    }
    
    @objc func exitApp() {
        // 앱 종료
        exit(0)
    }
}
