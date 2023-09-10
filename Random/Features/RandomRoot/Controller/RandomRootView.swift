//
//  RandomRootView.swift
//  Random
//
//  Created by Andrey Dorofeev on 04.09.2021.
//

import Coordinators
import Foundation
import SwiftSoup
import UIKit

// var randomNumber = 105577
var randomNumber = 563585608658299

class RandomRootView: UIView, TableViewHolder {
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var randomNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get more random", for: .normal)
        button.setTitleColor(Randomizer.randomColor(), for: .normal)
        button.backgroundColor = Randomizer.randomColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        self.addSubview(randomNumberLabel)
        self.addSubview(randomButton)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.randomNumberLabel.topAnchor),
            randomNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            randomNumberLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            randomButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            randomButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            randomButton.widthAnchor.constraint(equalToConstant: 300.5),
            randomButton.heightAnchor.constraint(equalToConstant: 48.5)
        ])
        
        moreRandomAction()
        
        randomButton.addTarget(self, action: #selector(moreRandomAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableDelegate(_ delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    @objc private func moreRandomAction() {
        
        let color = Randomizer.randomColor()
        randomNumberLabel.text = "\(Randomizer.randomRandom())"
        randomNumberLabel.textColor = color
        
        color.cgColor.components?.forEach({ it in
            print(it * 255)
        })
        // makeRequest()
          // megaRandom()
    }
    
    func megaRandom() {
        var count = 0
        while Randomizer.randomRandom() < 100 {
            count += 1
        }
        
        print("mega random number = \(count)")
    }
    
    func testChance() {
        var result = [Int: Int]()
        let count = 8000000.0
        for i in 1...Int(count) {
            if i % 1000 == 0 {
                print(i)
            }
            let random = Randomizer.randomRandom()
            result[random] = (result[random] ?? 0) + 1
        }
        let sorted = result.sorted { val1, val2 in
            val1.key < val2.key
        }
        var total = 0.0
        for sort in sorted {
            let chance = Double(sort.value) * 100.0 / count
            total += Double(sort.value)
            print("\(sort) \(chance) % total: \(total / count * 100.0) %" )
        }
    }
    
    func parseHtml(url: URL, data: String) {
        do {
            // Создаем объект документа SwiftSoup
            let doc = try SwiftSoup.parse(data)
            
            // Получаем содержимое поля title
            let title = try doc.title()
            
            print("hoba title for \(url.absoluteString) ==> \(title)") // Выводит: "Заголовок страницы"
            
        } catch Exception.Error(let type, let message) {
            print(" hoba \(type): \(message) for \(url.absoluteString)")
        } catch {
            print("hoba Ошибка for \(url.absoluteString)")
        }
    }
    
    func makeRequest() {
        var count = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            count += 1
            
            let urlString = "https://2gis.ru/biysk/geo/\(randomNumber)"
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode < 400 {
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("hoba \(dataString)")
                            self.parseHtml(url: url, data: dataString)
                        }
                    } else {
                        print("Status code: \(httpResponse.statusCode) for url \(url.absoluteString)")
                    }
                    
                }
            }.resume()
            randomNumber += 1
            if count == 1000 {
                timer.invalidate()
            }
        }
    }
}
