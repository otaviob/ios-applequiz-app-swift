//
//  ViewController.swift
//  ios-applequiz-app-swift
//
//  Created by otavio brito on 16/12/2025.
//

import UIKit

class QuizViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var treeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Tree 7")
        return imageView
    }()
    
    private lazy var correctWordLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "_ _ _ _ _"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = "Wins: 0, Losses: 0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var keyboardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        createKeyboard()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(treeImageView)
        view.addSubview(correctWordLabel)
        view.addSubview(scoreLabel)
        view.addSubview(keyboardContainerView)
        
        NSLayoutConstraint.activate([
            // Tree Image
            treeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            treeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            treeImageView.widthAnchor.constraint(equalToConstant: 280),
            treeImageView.heightAnchor.constraint(equalToConstant: 280),
            
            // Correct Word Label
            correctWordLabel.topAnchor.constraint(equalTo: treeImageView.bottomAnchor, constant: 20),
            correctWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            correctWordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Score Label
            scoreLabel.topAnchor.constraint(equalTo: correctWordLabel.bottomAnchor, constant: 15),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Keyboard Container
            keyboardContainerView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 25),
            keyboardContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            keyboardContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            keyboardContainerView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    // MARK: - Create Keyboard

    private func createLetterButton(letter: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(letter, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func createKeyboard() {
        let letters = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
        
        for (rowIndex, row) in letters.enumerated() {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 5
            rowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            for letter in row {
                let button = createLetterButton(letter: String(letter))
                rowStackView.addArrangedSubview(button)
            }
            
            keyboardContainerView.addSubview(rowStackView)
            
            let yPosition = CGFloat(rowIndex) * 42
            
            NSLayoutConstraint.activate([
                rowStackView.centerXAnchor.constraint(equalTo: keyboardContainerView.centerXAnchor),
                rowStackView.topAnchor.constraint(equalTo: keyboardContainerView.topAnchor, constant: yPosition),
                rowStackView.heightAnchor.constraint(equalToConstant: 36)
            ])
            
            let buttonWidth: CGFloat = 32
            let spacing: CGFloat = 5
            let totalWidth = CGFloat(row.count) * buttonWidth + CGFloat(row.count - 1) * spacing
            rowStackView.widthAnchor.constraint(equalToConstant: totalWidth).isActive = true
        }
    }
    
}
