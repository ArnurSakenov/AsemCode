//
//  NamingViewController.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 05.03.2023.
//

import UIKit
import SnapKit
import Highlightr
class NamingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setConstraints()
        // Create a UITextView and add it to the view
             
                                                                
        // Do any additional setup after loading the view.
    }
    private let taskText: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        
        
        let code = """
        // Example code
        struct Person {
            var name: String
            var age: Int
        }
        
        let person = Person(name: "Alice", age: 25)
        """
        
  
        textView.text = code
        let highlightr = Highlightr()!
        highlightr.setTheme(to: "xcode")
        let fontSize: CGFloat = 20
        highlightr.theme.codeFont = UIFont(name: "Menlo-Regular", size: fontSize)!

        // Use Highlightr to highlight the code
        if let highlightedCode = highlightr.highlight(code, as: "swift") {
            textView.attributedText = highlightedCode
        } else {
            textView.text = code
        }

        textView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textView.layer.cornerRadius = 10
        
         textView.isEditable = false
         textView.isScrollEnabled = true
        return textView
    }()
    private func setConstraints(){
        view.addSubview(taskText)
        view.addSubview(taskImage)
        view.addSubview(checkButton)
        view.addSubview(nextButton)
        view.addSubview(optionsTableView)
        view.addSubview(taskLabel)
        taskText.snp.makeConstraints { make in
            make.top.equalTo(view).offset(99)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
            make.bottom.equalTo(view).offset(-437)
        }
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(685)
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.bottom.equalTo(view).offset(-71)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(745)
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.bottom.equalTo(view).offset(-27)
        }
        optionsTableView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(745)
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.bottom.equalTo(view).offset(-27)
        }
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.left.equalTo(view).offset(23)
            make.right.equalTo(view).offset(-57)
            make.bottom.equalTo(view).offset(-708)
        }
    }

    private var taskImage = {
      let image = UIImageView()
        image.backgroundColor = .red
        //image.image = UIImage(named: "avatar")
      
        return image
    }()
    private let checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check", for: .normal)
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9995643497, green: 0.8042542338, blue: 0.3047591746, alpha: 1)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    private let optionsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .red
        return table
    }()
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Give name to class"
        label.frame = CGRect(x: 0, y: 0, width: 295, height: 51)
        
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Lato-Semibold", size: 30)
       return label
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
        button.clipsToBounds = true
        return button
    }()
}
