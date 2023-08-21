// TO DO : BU KODLARA GORE CHATGPT ILE YAP.

//
//  ViewController.swift
//  scrollViewTest
//
//  Created by Kerem Demir on 18.08.2023.
//

import UIKit

class asdasdViewController: UIViewController {

    // MARK : UI Elements
    private var allRecordsScrollView: UIScrollView = {
        let allRecordsScrollView = UIScrollView()
        allRecordsScrollView.isPagingEnabled = true
        allRecordsScrollView.contentInsetAdjustmentBehavior = .never
        allRecordsScrollView.showsHorizontalScrollIndicator = false
        allRecordsScrollView.translatesAutoresizingMaskIntoConstraints = false
        allRecordsScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        return allRecordsScrollView
    }()

    private var contentView1: UIView = {
        let contentView1 = UIView()
        contentView1.translatesAutoresizingMaskIntoConstraints = false
        contentView1.backgroundColor = UIColor(named: "LightGreen")
        return contentView1
    }()
    
    private var contentView2: UIView = {
       let contentView2 = UIView()
        contentView2.translatesAutoresizingMaskIntoConstraints = false
        contentView2.backgroundColor = UIColor(named: "Green")
//        contentView2.isHidden = false
        return contentView2
    }()

    private let kendinYapLabel:UILabel = {
        let kendinYapLabel = UILabel()
        kendinYapLabel.translatesAutoresizingMaskIntoConstraints = false
        kendinYapLabel.font = UIFont(name: "Overpass-Bold", size: 24.0)
        kendinYapLabel.text = "KENDİN YAP"
        kendinYapLabel.textColor = .white
        return kendinYapLabel
    }()

    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.setImage(UIImage(named: "backIcon"), for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        return backButton
    }()

    private let bigGreenTopBubbleImageView: UIImageView = {
        let bigGreenTopBubbleImageView = UIImageView()
        let image = UIImage(named: "bigGreenTopBubble")
        bigGreenTopBubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        bigGreenTopBubbleImageView.image = image
        bigGreenTopBubbleImageView.contentMode = .scaleAspectFill
        return bigGreenTopBubbleImageView
    }()

    lazy var recordButton:UIButton = {
        let recordButton = UIButton()
        let image = UIImage(named: "recordButtonBGAll") // YAPILACAK -> RESMI DUZELT
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        recordButton.setImage(image, for: .normal)
        return recordButton
    }()

    private let recorderVoicesLabel:UILabel = {
        let recorderVoicesLabel = UILabel()
        recorderVoicesLabel.translatesAutoresizingMaskIntoConstraints = false
        recorderVoicesLabel.text = "KAYITLI SESLER"
        recorderVoicesLabel.font = UIFont(name: "Overpass-Bold", size: 20.0)
        recorderVoicesLabel.textColor = .white
        return recorderVoicesLabel
    }()

    public var recordCounterLabel:UILabel = {
        let recordCounterLabel = UILabel()
        recordCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        recordCounterLabel.font = UIFont(name: "Overpass-Regular", size: 100.0)
        recordCounterLabel.text = "00:00"
        recordCounterLabel.textColor = .white
        return recordCounterLabel
    }()

    public var recordingStatusLabel:UILabel = {
        let recordingStatusLabel = UILabel()
        recordingStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        recordingStatusLabel.font = UIFont(name: "Overpass-Regular", size: 20.0)
        recordingStatusLabel.text = "Ses kaydı bekleniyor."
        recordingStatusLabel.textColor = .white
        return recordingStatusLabel
    }()

    lazy var stopRecordButton:UIButton = {
        let stopRecordButton = UIButton()
        let image = UIImage(named: "recordButtonStopIcon")
        stopRecordButton.translatesAutoresizingMaskIntoConstraints = false
        stopRecordButton.addTarget(self, action: #selector(stopRecordButtonTapped), for: .touchUpInside)
        stopRecordButton.setImage(image, for: .normal)
        return stopRecordButton
    }()


    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configure()
        allRecordsScrollView.setContentOffset(CGPoint(x: allRecordsScrollView.frame.size.width / 2, y: 0), animated: false)
    }

    private func configure(){
//        setupScrollView()
        configureUI()
        allRecordsScrollView.contentOffset.x = 0
    }


    // MARK : Setup UI

    private func configureUI(){
        view.addSubview(allRecordsScrollView)
        NSLayoutConstraint.activate([
            allRecordsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            allRecordsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allRecordsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
            allRecordsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        // ContentViews constraints for allRecordsScrollView
        allRecordsScrollView.addSubview(contentView1)
        allRecordsScrollView.addSubview(contentView2)
        NSLayoutConstraint.activate([
            // contentview1 constraints for scrollView
            contentView1.topAnchor.constraint(equalTo: allRecordsScrollView.topAnchor),
            contentView1.bottomAnchor.constraint(equalTo: allRecordsScrollView.bottomAnchor),
            contentView1.leadingAnchor.constraint(equalTo: allRecordsScrollView.leadingAnchor, constant: 0),
//            contentView1.trailingAnchor.constraint(equalTo: allRecordsScrollView.trailingAnchor, constant: -allRecordsScrollView.frame.size.width),
            contentView1.widthAnchor.constraint(equalTo: allRecordsScrollView.widthAnchor, multiplier: 0.5),
            contentView1.heightAnchor.constraint(equalTo: allRecordsScrollView.heightAnchor),
            
            // contentview2 constraints for scrollview
            contentView2.topAnchor.constraint(equalTo: allRecordsScrollView.topAnchor),
            contentView2.bottomAnchor.constraint(equalTo: allRecordsScrollView.bottomAnchor),
            contentView2.leadingAnchor.constraint(equalTo: allRecordsScrollView.leadingAnchor, constant: allRecordsScrollView.frame.size.width),
            
            contentView2.widthAnchor.constraint(equalTo: allRecordsScrollView.widthAnchor, multiplier: 0.5),
            contentView2.heightAnchor.constraint(equalTo: allRecordsScrollView.heightAnchor)
        ])

        contentView1.addSubview(backButton)
        contentView1.addSubview(kendinYapLabel)
        contentView1.addSubview(bigGreenTopBubbleImageView)
        contentView1.addSubview(recordButton)
        contentView1.addSubview(recorderVoicesLabel)
        NSLayoutConstraint.activate([
            // Back button constraints
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 54),
            // KendinYapLabel constraints
            kendinYapLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kendinYapLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            // BigGreenBubble constraints
            bigGreenTopBubbleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -70),
            bigGreenTopBubbleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bigGreenTopBubbleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bigGreenTopBubbleImageView.heightAnchor.constraint(equalToConstant: 466),
            // RecordButton constraints
            recordButton.topAnchor.constraint(equalTo: kendinYapLabel.bottomAnchor, constant: 55),
            recordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 91),
            recordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -91),
            recordButton.heightAnchor.constraint(equalToConstant: 77),
            // RecorderVoicesLabel constraints
            recorderVoicesLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            recorderVoicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            recorderVoicesLabel.heightAnchor.constraint(equalToConstant: 25.5)
        ])
        
//        contentView2.addSubview(recordCounterLabel)
//        contentView2.addSubview(recordingStatusLabel)
//        contentView2.addSubview(stopRecordButton)
//        NSLayoutConstraint.activate([
//            // Record counter label constraints
//            recordCounterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            recordCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            // Recording status label constraints
//            recordingStatusLabel.topAnchor.constraint(equalTo: recordCounterLabel.bottomAnchor, constant: 10),
//            recordingStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            // Stop record button constraints
//            stopRecordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -132),
//            stopRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stopRecordButton.widthAnchor.constraint(equalToConstant: 118),
//            stopRecordButton.heightAnchor.constraint(equalToConstant: 118)
//        ])
    }

    // MARK : Functions

    // MARK : Actions
    @objc func recordButtonTapped() {
        print("Record button tapped.")
//        contentView1.isHidden = true
//        contentView2.isHidden = false
        let xOffset = allRecordsScrollView.frame.width // Kaydırma mesafesi, scrollView'ın genişliği kadar olmalıdır
        allRecordsScrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }

    @objc func backButtonTapped() {
        print("Back button tapped.")
        
        let targetContentOffset = CGPoint(x: 0, y: 0)
        allRecordsScrollView.setContentOffset(targetContentOffset, animated: true)
    }

    @objc func stopRecordButtonTapped(){
        print("Stop record button tapped.")
//        contentView2.isHidden = true
//        contentView1.isHidden = false
        allRecordsScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
}

// MARK : Extensions

