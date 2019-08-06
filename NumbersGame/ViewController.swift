//
//  ViewController.swift
//  NumbersGame
//
//  Created by 津國　由莉子 on 2019/08/06.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //答えが表示されるラベル
    @IBOutlet weak var answerabel: UILabel!
    
    //答えを入力するテキストフィールド
    @IBOutlet weak var answerTextField: UITextField!
    
    //決定ボタン
    @IBOutlet weak var okbutton: UIButton!
    
   //回答履歴が書かれるところ
    @IBOutlet weak var rirekiText: UITextView!
    
    //正解の数値を定義
    var oknum: Int = 0
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //テキストビューに入力できないようにする
        rirekiText.isUserInteractionEnabled = false
        
    }


}

//ランダムに数を生成する
var lanNum = [1 ... 100]
var randomNum = lanNum.randomElement()

