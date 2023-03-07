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
    var selectedIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setConstraints()
        
    }
    
    private let buttonBack: UIButton = {
            let button = UIButton()
        
        button.backgroundColor = .red
            //button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            return button
        }()
    @objc private func backButtonTapped() {
        print("hello")
        navigationController?.popViewController(animated: true)
    }
    private let taskText: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let code = """
        // Example code
        struct _____ {
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

       // textView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 10
        
         textView.isEditable = false
         textView.isScrollEnabled = true
        return textView
    }()
  
    private func setConstraints(){
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        view.addSubview(taskBackground)
        taskBackground.addSubview(taskText)
        taskBackground.addSubview(buttonBack)
        view.addSubview(checkButton)
        view.addSubview(nextButton)
        view.addSubview(optionsTableView)
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(view).offset(16)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        taskBackground.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view).offset(-405)
        }
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
            make.top.equalTo(view).offset(424)
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.bottom.equalTo(view).offset(-130)
        }
    }

    private var taskBackground = {
      let image = UIImageView()
        image.image = UIImage(named: "backgroundTask")
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
        table.register(NamingOptionsTableViewCell.self, forCellReuseIdentifier: "cell")
        table.isScrollEnabled = false
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
//        button.addTarget(self, action:, action: , action: , for: .touchUpInside )
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = .white
        return button
    }()
}
extension NamingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NamingOptionsTableViewCell
        cell.view.text = namingOptions[indexPath.row].optionText
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! NamingOptionsTableViewCell
        selectedCell.view.backgroundColor = UIColor.green
        if let selectedIndexPath = selectedIndexPath, selectedIndexPath != indexPath {
            let previousCell = tableView.cellForRow(at: selectedIndexPath) as! NamingOptionsTableViewCell
            previousCell.view.backgroundColor = UIColor.clear
        }
        selectedIndexPath = indexPath
    }

}
