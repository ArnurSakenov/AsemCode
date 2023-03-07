//
//  NamingOptionsTableViewCell.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 07.03.2023.
//

import UIKit
import SnapKit
class NamingOptionsTableViewCell: UITableViewCell {
    var view: UILabel = {
        let view = UILabel()
        view.text = "Person"
        view.backgroundColor = .white
        return view 
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        var shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 8)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 0
        layer0.shadowOffset = CGSize(width: 2, height: 2)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        var shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)

        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)

        shapes.layer.cornerRadius = 8
        shapes.layer.borderWidth = 0.5
        shapes.layer.borderColor = UIColor(red: 0.906, green: 0.906, blue: 0.906, alpha: 1).cgColor
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalTo(contentView).offset(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setContstraints(){
        
    }
}
    
