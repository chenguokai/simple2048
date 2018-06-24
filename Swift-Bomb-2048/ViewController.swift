//
//  ViewController.swift
//  Swift-Bomb-2048
//
//  Created by Xim on 2018/6/23.
//  Copyright © 2018年 chenguokai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Number11: UILabel!
    @IBOutlet weak var Number12: UILabel!
    @IBOutlet weak var Number13: UILabel!
    @IBOutlet weak var Number14: UILabel!
    @IBOutlet weak var Number21: UILabel!
    @IBOutlet weak var Number22: UILabel!
    @IBOutlet weak var Number23: UILabel!
    @IBOutlet weak var Number24: UILabel!
    @IBOutlet weak var Number31: UILabel!
    @IBOutlet weak var Number32: UILabel!
    @IBOutlet weak var Number33: UILabel!
    @IBOutlet weak var Number34: UILabel!
    @IBOutlet weak var Number41: UILabel!
    @IBOutlet weak var Number42: UILabel!
    @IBOutlet weak var Number43: UILabel!
    @IBOutlet weak var Number44: UILabel!
    
    @IBOutlet weak var Down: UIButton!
    @IBOutlet weak var Up: UIButton!
    @IBOutlet weak var Left: UIButton!
    @IBOutlet weak var Right: UIButton!
    
    var screenArray = Array2D(columns: 5, rows: 5, initialValue: -1)
    var initx = 0,inity = 0;
    func toStrings(_ num:Int) -> String {
        if num == -1 {
            return "0"
        } else {
            return String(num)
        }
    }
    func UIupdate() {
        Number11.text = toStrings(screenArray[1,1])
        Number12.text = toStrings(screenArray[1,2])
        Number13.text = toStrings(screenArray[1,3])
        Number14.text = toStrings(screenArray[1,4])
        Number21.text = toStrings(screenArray[2,1])
        Number22.text = toStrings(screenArray[2,2])
        Number23.text = toStrings(screenArray[2,3])
        Number24.text = toStrings(screenArray[2,4])
        Number31.text = toStrings(screenArray[3,1])
        Number32.text = toStrings(screenArray[3,2])
        Number33.text = toStrings(screenArray[3,3])
        Number34.text = toStrings(screenArray[3,4])
        Number41.text = toStrings(screenArray[4,1])
        Number42.text = toStrings(screenArray[4,2])
        Number43.text = toStrings(screenArray[4,3])
        Number44.text = toStrings(screenArray[4,4])
        
    }
    func MoveUp() {
        for i in 2...4 {
            for j in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = i;
                while screenArray[l-1,j] == -1 && l-1 > 0 {
                    l -= 1
                }
                if l != i {
                    screenArray[l,j] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
        var tempArray = Array2D(columns: 5, rows: 5, initialValue: -1);
        for i in 1...4 {
            for j in 1...4 {
                tempArray[i-1,j] = screenArray[i,j];
            }
        }
        for i in 1...4 {
            for j in 1...4 {
                if tempArray[i,j] == -1 || screenArray[i,j] == -1 {
                    tempArray[i,j] = -1
                } else {
                    tempArray[i,j] = screenArray[i,j] - tempArray[i,j]
                }
                if tempArray[i,j] == 0 {
                    screenArray[i,j] = screenArray[i,j] << 1
                    screenArray[i+1,j] = -1
                } else {
                    
                }
            }
        }
        for i in 2...4 {
            for j in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = i;
                while screenArray[l-1,j] == -1 && l-1 > 0 {
                    l -= 1
                }
                if l != i {
                    screenArray[l,j] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
    }
    func MoveDown() {
        for i in stride(from: 3, through: 1, by: -1) {
            for j in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = i;
                while l+1 < 5 && screenArray[l+1,j] == -1 {
                    l += 1
                }
                if l != i {
                    screenArray[l,j] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
        var tempArray = Array2D(columns: 6, rows: 6, initialValue: -1);
        for i in 1...4 {
            for j in 1...4 {
                tempArray[i+1,j] = screenArray[i,j];
            }
        }
        for i in 1...4 {
            for j in 1...4 {
                if tempArray[i,j] == -1 || screenArray[i,j] == -1 {
                    tempArray[i,j] = -1
                } else {
                    tempArray[i,j] = screenArray[i,j] - tempArray[i,j]
                }
                if tempArray[i,j] == 0 {
                    screenArray[i,j] = screenArray[i,j] << 1
                    screenArray[i-1,j] = -1
                } else {
                    
                }
            }
        }
        for i in stride(from: 3, through: 1, by: -1) {
            for j in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = i;
                while l+1 < 5 && screenArray[l+1,j] == -1 {
                    l += 1
                }
                if l != i {
                    screenArray[l,j] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
    }
    func MoveLeft() {
        for j in 2...4 {
            for i in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = j;
                while l-1 > 0 && screenArray[i,l-1] == -1 {
                    l -= 1
                }
                if l != j {
                    screenArray[i,l] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
        var tempArray = Array2D(columns: 6, rows: 6, initialValue: -1);
        for i in 1...4 {
            for j in 1...4 {
                tempArray[i,j-1] = screenArray[i,j];
            }
        }
        for i in 1...4 {
            for j in 1...4 {
                if tempArray[i,j] == -1 || screenArray[i,j] == -1 {
                    tempArray[i,j] = -1
                } else {
                    tempArray[i,j] = screenArray[i,j] - tempArray[i,j]
                }
                if tempArray[i,j] == 0 {
                    screenArray[i,j] = screenArray[i,j] << 1
                    screenArray[i,j+1] = -1
                }
            }
        }
        for j in 2...4 {
            for i in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = j;
                while l-1 > 0 && screenArray[i,l-1] == -1 {
                    l -= 1
                }
                if l != j {
                    screenArray[i,l] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
    }
    func MoveRight() {
        for j in stride(from: 3, through: 1, by: -1) {
            for i in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = j;
                while l+1 < 5 && screenArray[i,l+1] == -1 {
                    l += 1
                }
                if l != j {
                    screenArray[i,l] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
        var tempArray = Array2D(columns: 6, rows: 6, initialValue: -1);
        for i in 1...4 {
            for j in 1...4 {
                tempArray[i,j+1] = screenArray[i,j];
            }
        }
        for i in 1...4 {
            for j in 1...4 {
                if tempArray[i,j] == -1 || screenArray[i,j] == -1 {
                    tempArray[i,j] = -1
                } else {
                    tempArray[i,j] = screenArray[i,j] - tempArray[i,j]
                }
                if tempArray[i,j] == 0 {
                    screenArray[i,j] = screenArray[i,j] << 1
                    screenArray[i,j-1] = -1
                }
            }
        }
        for j in stride(from: 3, through: 1, by: -1) {
            for i in 1...4 {
                if screenArray[i,j] == -1 {
                    continue
                }
                var l = j;
                while l+1 < 5 && screenArray[i,l+1] == -1 {
                    l += 1
                }
                if l != j {
                    screenArray[i,l] = screenArray[i,j];
                    screenArray[i,j] = -1;
                }
            }
        }
    }
    func newGen() {
        var x = RandomCustom(1, 4)
        var y = RandomCustom(1, 4)
        while (screenArray[x,y] != -1) {
            x = RandomCustom(1, 4)
            y = RandomCustom(1, 4)
        }
        screenArray[x,y] = RandomNumber()
    }
    func Have2048() -> Bool {
        for i in 1...4 {
            for j in 1...4 {
                if screenArray[i,j] == 2048 {
                    return true;
                }
            }
        }
        return false
    }
    func Alert2048() {
        let alertcontroller = UIAlertController(title:"你获胜了",message:"得到2048",preferredStyle: .alert)
        let alertaction1 = UIAlertAction(title:"确定", style: .default, handler: nil)
        let alertaction2 = UIAlertAction(title:"取消", style: .default, handler: nil)
        alertcontroller.addAction(alertaction1);
        alertcontroller.addAction(alertaction2);
        self.present(alertcontroller,animated: true,completion: nil)
    }
    @IBAction func DownButton(_ sender: Any) {
        MoveDown()
        newGen()
        UIupdate()
        if Have2048() {
            Alert2048()
        }
    }
    @IBAction func UpButton(_ sender: Any) {
        MoveUp()
        newGen()
        UIupdate()
        if Have2048() {
            Alert2048()
        }
    }
    @IBAction func LeftButton(_ sender: Any) {
        MoveLeft()
        newGen()
        UIupdate()
        if Have2048() {
            Alert2048()
        }
    }
    @IBAction func RightButton(_ sender: Any) {
        MoveRight()
        newGen()
        UIupdate()
        if Have2048() {
            Alert2048()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screenArray[0,0] = 1;
        while (screenArray[initx,inity] != -1) {
            initx = RandomCustom(1,4);
            inity = RandomCustom(1,4);
        }
        screenArray[initx,inity] = RandomNumber()
        UIupdate();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

