//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Narasimha Manoj Garimella on 24/09/22.
//

import UIKit

class ViewController: UIViewController {

    /*
        Creating a view for background color and content
     */
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    /*
        Creating a button for action on click
     */
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    /*
        Default method when creating an IOS application
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 310, height: 500)
        imageView.center = view.center
        
        view.addSubview(button)
        // Calling the new function created for displaying random image in the screen.
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapPhoto), for: .touchUpInside)
    }
    
    /*
        Array of colors for background shift when on click
     */
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemBrown,
        .systemOrange,
        .systemYellow]
    
    /*
        Calling the custom function of Random photo when clicked on button
     */
    @objc func didTapPhoto() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    /*
        Adding the button to frame for proper alignment.
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-130-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 55)
    }

    /*
        Random photo function for triggering URL to the web and getting photo
     */
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

