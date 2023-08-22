
//
//  ViewController.swift
//  scrollViewTest
//
//  Created by Kerem Demir on 18.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK : UI Elements
    private var contentView1: UIView = {
        let contentView1 = UIView()
        contentView1.translatesAutoresizingMaskIntoConstraints = false
        // clear
//        contentView1.backgroundColor = UIColor(named: "LightGreen")
        contentView1.backgroundColor = .clear
        return contentView1
    }()
    
    private var contentView2: UIView = {
        let contentView2 = UIView()
        contentView2.translatesAutoresizingMaskIntoConstraints = false
        // clear
        contentView2.backgroundColor = UIColor(named: "Green")
//        contentView2.backgroundColor = .clear
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
        let image = UIImage(named: "recordButtonBGAll")
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
        
        // set view background color
        view.backgroundColor = UIColor(named: "LightGreen")
        
        configure()
    }
    
    private func configure(){
        configureUI()
    }
    
    
    // MARK : Setup UI
    private func configureUI(){
        
        // add bigGreenTopBubbleImageView as the first subview
        //  the "content" views will have clear backgrounds,
        //  so we see the "bubble" image through them
        view.addSubview(bigGreenTopBubbleImageView)
        NSLayoutConstraint.activate([
            // BigGreenBubble constraints
            bigGreenTopBubbleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -70),
            bigGreenTopBubbleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bigGreenTopBubbleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bigGreenTopBubbleImageView.heightAnchor.constraint(equalToConstant: 466),
        ])
        
        // add the two "content" views
        view.addSubview(contentView1)
        view.addSubview(contentView2)
        NSLayoutConstraint.activate([
            
            // constrain both "content" views to fill the view
            //  contentView2 will be "overlaid on top of" contentView1
            
            contentView1.topAnchor.constraint(equalTo: view.topAnchor),
            contentView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView2.topAnchor.constraint(equalTo: view.topAnchor),
            contentView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        // add contentView1's subviews
        contentView1.addSubview(backButton)
        contentView1.addSubview(kendinYapLabel)
        contentView1.addSubview(recordButton)
        contentView1.addSubview(recorderVoicesLabel)
        NSLayoutConstraint.activate([
            // constrain subviews to contentView1, NOT to view
            // Back button constraints
            backButton.topAnchor.constraint(equalTo: contentView1.topAnchor, constant: 48),
            backButton.leadingAnchor.constraint(equalTo: contentView1.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 54),
            // KendinYapLabel constraints
            kendinYapLabel.centerXAnchor.constraint(equalTo: contentView1.centerXAnchor),
            kendinYapLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            // RecordButton constraints
            recordButton.topAnchor.constraint(equalTo: kendinYapLabel.bottomAnchor, constant: 55),
            recordButton.leadingAnchor.constraint(equalTo: contentView1.leadingAnchor, constant: 91),
            recordButton.trailingAnchor.constraint(equalTo: contentView1.trailingAnchor, constant: -91),
            recordButton.heightAnchor.constraint(equalToConstant: 77),
            // RecorderVoicesLabel constraints
            recorderVoicesLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            recorderVoicesLabel.leadingAnchor.constraint(equalTo: contentView1.leadingAnchor, constant: 43),
            recorderVoicesLabel.heightAnchor.constraint(equalToConstant: 25.5)
        ])
        
        // add contentView1's subviews
        contentView2.addSubview(recordCounterLabel)
        contentView2.addSubview(recordingStatusLabel)
        contentView2.addSubview(stopRecordButton)
        NSLayoutConstraint.activate([
            // constrain subviews to contentView2, NOT to view
            // Record counter label constraints
            recordCounterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            recordCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Recording status label constraints
            recordingStatusLabel.topAnchor.constraint(equalTo: recordCounterLabel.bottomAnchor, constant: 10),
            recordingStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Stop record button constraints
            stopRecordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -132),
            stopRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopRecordButton.widthAnchor.constraint(equalToConstant: 118),
            stopRecordButton.heightAnchor.constraint(equalToConstant: 118)
        ])

        // start with contentView2 hidden
        contentView2.isHidden = true
    }
    
    
    // MARK : Functions
    
    // MARK : Actions
    @objc func recordButtonTapped() {
        print("Record button tapped.")
        // hide contentView1, show contentView2
        contentView1.isHidden = true
        contentView2.isHidden = false
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped.")
    }
    
    @objc func stopRecordButtonTapped(){
        print("Stop record button tapped.")
        // show contentView1, hide contentView2
        contentView1.isHidden = false
        contentView2.isHidden = true
    }
}
