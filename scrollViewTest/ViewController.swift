// TO DO : BU KODLARA GORE CHATGPT ILE YAP.

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let showButton = UIButton()
    let backButton = UIButton()
    let secondHalfLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scrollview ayarları
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        // İleri git buton ayarları
        showButton.setTitle("Show Second Half", for: .normal)
        showButton.backgroundColor = UIColor.blue
        showButton.addTarget(self, action: #selector(showSecondHalf), for: .touchUpInside)
        view.addSubview(showButton)
        
        // Geri dön buton ayarları
        backButton.setTitle("Show First Half", for: .normal)
        backButton.backgroundColor = UIColor.red
        backButton.addTarget(self, action: #selector(showFirstHalf), for: .touchUpInside)
        backButton.isHidden = true
        view.addSubview(backButton)
        
        // İkinci yarının merkezindeki label ayarları
        secondHalfLabel.text = "2. Kısım"
        secondHalfLabel.textColor = UIColor.black
        secondHalfLabel.textAlignment = .center
        secondHalfLabel.isHidden = true
        scrollView.addSubview(secondHalfLabel)
        
        // Scrollview ve butonların konumlandırılması
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        showButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        secondHalfLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            showButton.widthAnchor.constraint(equalToConstant: 150),
            showButton.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 150),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondHalfLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: scrollView.contentSize.width / 4),
            secondHalfLabel.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            secondHalfLabel.widthAnchor.constraint(equalToConstant: 100),
            secondHalfLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // İlk yarıyı görünür hale getir
        scrollView.contentOffset.x = 0
    }
    
    @objc func showSecondHalf() {
        // İkinci yarıya animasyonlu geçiş yap
        UIView.animate(withDuration: 0.5) {
            self.scrollView.contentOffset.x = self.scrollView.contentSize.width / 2
        } completion: { _ in
            self.showButton.isHidden = true
            self.backButton.isHidden = false
            self.secondHalfLabel.isHidden = false
        }
    }
    
    @objc func showFirstHalf() {
        // İlk yarıya animasyonlu geçiş yap
        UIView.animate(withDuration: 0.5) {
            self.scrollView.contentOffset.x = 0
        } completion: { _ in
            self.showButton.isHidden = false
            self.backButton.isHidden = true
            self.secondHalfLabel.isHidden = true
        }
    }
}



//
////
////  ViewController.swift
////  scrollViewTest
////
////  Created by Kerem Demir on 18.08.2023.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    // MARK : UI Elements
//    private var allRecordsScrollView: UIScrollView = {
//        let allRecordsScrollView = UIScrollView()
//        allRecordsScrollView.isPagingEnabled = true
//        allRecordsScrollView.showsHorizontalScrollIndicator = false
//        allRecordsScrollView.translatesAutoresizingMaskIntoConstraints = false
//        allRecordsScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
//        return allRecordsScrollView
//    }()
//
//    private var contentView: UIView = {
//        let contentView = UIView()
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        return contentView
//    }()
//
//    private let kendinYapLabel:UILabel = {
//        let kendinYapLabel = UILabel()
//        kendinYapLabel.translatesAutoresizingMaskIntoConstraints = false
//        kendinYapLabel.font = UIFont(name: "Overpass-Bold", size: 24.0)
//        kendinYapLabel.text = "KENDİN YAP"
//        kendinYapLabel.textColor = .white
//        return kendinYapLabel
//    }()
//
//    lazy var backButton: UIButton = {
//        let backButton = UIButton()
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        backButton.setImage(UIImage(named: "backIcon"), for: .normal)
//        backButton.setTitleColor(UIColor.white, for: .normal)
////        backButton.isHidden = true
//        return backButton
//    }()
//
//    private let bigGreenTopBubbleImageView: UIImageView = {
//        let bigGreenTopBubbleImageView = UIImageView()
//        let image = UIImage(named: "bigGreenTopBubble")
//        bigGreenTopBubbleImageView.translatesAutoresizingMaskIntoConstraints = false
//        bigGreenTopBubbleImageView.image = image
//        bigGreenTopBubbleImageView.contentMode = .scaleAspectFill
//        return bigGreenTopBubbleImageView
//    }()
//
//    lazy var recordButton:UIButton = {
//        let recordButton = UIButton()
//        let image = UIImage(named: "recordButtonBGAll") // YAPILACAK -> RESMI DUZELT
//        recordButton.translatesAutoresizingMaskIntoConstraints = false
//        recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
//        recordButton.setImage(image, for: .normal)
//        return recordButton
//    }()
//
//    private let recorderVoicesLabel:UILabel = {
//        let recorderVoicesLabel = UILabel()
//        recorderVoicesLabel.translatesAutoresizingMaskIntoConstraints = false
//        recorderVoicesLabel.text = "KAYITLI SESLER"
//        recorderVoicesLabel.font = UIFont(name: "Overpass-Bold", size: 20.0)
//        recorderVoicesLabel.textColor = .white
//        return recorderVoicesLabel
//    }()
//
//    public var recordCounterLabel:UILabel = {
//        let recordCounterLabel = UILabel()
//        recordCounterLabel.translatesAutoresizingMaskIntoConstraints = false
//        recordCounterLabel.font = UIFont(name: "Overpass-Regular", size: 100.0)
//        recordCounterLabel.text = "00:00"
//        recordCounterLabel.textColor = .white
////        recordCounterLabel.isHidden = true
//        return recordCounterLabel
//    }()
//
//    public var recordingStatusLabel:UILabel = {
//        let recordingStatusLabel = UILabel()
//        recordingStatusLabel.translatesAutoresizingMaskIntoConstraints = false
//        recordingStatusLabel.font = UIFont(name: "Overpass-Regular", size: 20.0)
//        recordingStatusLabel.text = "Ses kaydı bekleniyor."
//        recordingStatusLabel.textColor = .white
////        recordingStatusLabel.isHidden = true
//        return recordingStatusLabel
//    }()
//
//    lazy var stopRecordButton:UIButton = {
//        let stopRecordButton = UIButton()
//        let image = UIImage(named: "recordButtonStopIcon")
//        stopRecordButton.translatesAutoresizingMaskIntoConstraints = false
//        stopRecordButton.addTarget(self, action: #selector(stopRecordButtonTapped), for: .touchUpInside)
//        stopRecordButton.setImage(image, for: .normal)
////        stopRecordButton.isHidden = true
//        return stopRecordButton
//    }()
//
//
//    // MARK : Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set background color
//        if let backgroundColor = UIColor(named: "LightGreen") {
//            view.backgroundColor = backgroundColor
//        }
//        configure()
//        allRecordsScrollView.setContentOffset(CGPoint(x: allRecordsScrollView.frame.size.width / 2, y: 0), animated: false)
//    }
//
//    private func configure(){
////        setupScrollView()
//        configureUI()
//        allRecordsScrollView.contentOffset.x = 0
//    }
//
//
//    // MARK : Setup UI
//
//    private func configureUI(){
//        view.addSubview(allRecordsScrollView)
//        NSLayoutConstraint.activate([
//            allRecordsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            allRecordsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            allRecordsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
//            allRecordsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            //allRecordsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//
//        view.addSubview(kendinYapLabel)
//        view.addSubview(backButton)
//        view.addSubview(bigGreenTopBubbleImageView)
//        view.addSubview(recordButton)
//        view.addSubview(recorderVoicesLabel)
//        NSLayoutConstraint.activate([
//            // back button
//            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            backButton.widthAnchor.constraint(equalToConstant: 50),
//            backButton.heightAnchor.constraint(equalToConstant: 54),
//            // kendin yap label
//            kendinYapLabel.centerXAnchor.constraint(equalTo: allRecordsScrollView.centerXAnchor, constant: allRecordsScrollView.contentSize.width / 4),
//            kendinYapLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
//            // big green top bubble
//            bigGreenTopBubbleImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -70),
//            bigGreenTopBubbleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            bigGreenTopBubbleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: allRecordsScrollView.contentSize.width / 2),
//            bigGreenTopBubbleImageView.heightAnchor.constraint(equalToConstant: 466),
//            bigGreenTopBubbleImageView.widthAnchor.constraint(equalToConstant: self.allRecordsScrollView.contentSize.width / 4),
//            // Record button
//            recordButton.topAnchor.constraint(equalTo: self.kendinYapLabel.bottomAnchor, constant: 55),
//            recordButton.centerXAnchor.constraint(equalTo: kendinYapLabel.centerXAnchor),
//            recordButton.heightAnchor.constraint(equalToConstant: 77),
//            // Recorder voices label
//            recorderVoicesLabel.topAnchor.constraint(equalTo: self.recordButton.bottomAnchor, constant: 20),
//            recorderVoicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
//            recorderVoicesLabel.heightAnchor.constraint(equalToConstant: 25.5)
//        ])
//    }
//
//
//
//
//
//    // MARK : Functions
//
//    // MARK : Actions
//    @objc func recordButtonTapped() {
//        print("Record button tapped.")
//        // Scroll view'da geçiş yapılmasını sağlayacak kod
//        self.allRecordsScrollView.contentOffset.x = self.allRecordsScrollView.contentSize.width / 2
//    }
//
//    @objc func backButtonTapped() {
//        print("Back button tapped.")
//        // Scroll view'da ilk ekrana geri dönme işlemi
//        let targetContentOffset = CGPoint(x: 0, y: 0)
//        allRecordsScrollView.setContentOffset(targetContentOffset, animated: true)
//    }
//
//    @objc func stopRecordButtonTapped(){
//        print("Stop record button tapped.")
//        allRecordsScrollView.contentOffset.x = 0
//    }
//
//}
//
//// MARK : Extensions
