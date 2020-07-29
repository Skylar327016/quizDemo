//
//  ResultViewController.swift
//  quizDemo
//
//  Created by 陳家豪 on 2020/7/29.
//

import UIKit

class ResultViewController: UIViewController {
    //顯示學院結果
    @IBOutlet weak var houseName: UILabel!
    //顯示學院圖片
    @IBOutlet weak var housePicture: UIImageView!
    //儲存上個畫面傳來的值
    var selectedOptions = [Option]()
    //儲存本次學院結果，隨便設定一個初始值
    var yourHouse:House = .Gryffindor
    override func viewDidLoad() {
        super.viewDidLoad()
        yourHouse = getHouseResult()
        setViews(with: yourHouse)
    }
    
    @IBAction func testAgain(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func setViews(with yourHouse:House){
        switch yourHouse{
        case .Gryffindor:
            houseName.text = "葛萊分多"
            housePicture.image = UIImage(named: "Gryffindor")
        case .Hufflepuff:
            houseName.text = "赫夫帕夫"
            housePicture.image = UIImage(named: "Hufflepuff")
        case .Ravenclaw:
            houseName.text = "雷文克勞"
            housePicture.image = UIImage(named: "Ravenclaw")
        case .Slytherin:
            houseName.text = "史萊哲林"
            housePicture.image = UIImage(named: "Slytherin")
        }
    }
    func getHouseResult() -> House{
        var counts = [Int]()
        var maxCount = 0
        var countForGryffindor = 0
        var countForHufflepuff = 0
        var countForRavenclaw = 0
        var countForSlytherin = 0
        var finalHouses = [House]()
        for option in selectedOptions{
            switch option.belongTo{
            case .Gryffindor:
                countForGryffindor += 1
            case .Hufflepuff:
                countForHufflepuff += 1
            case .Ravenclaw:
                countForRavenclaw += 1
            case .Slytherin:
                countForSlytherin += 1
            }
        }
        counts.append(countForGryffindor)
        counts.append(countForHufflepuff)
        counts.append(countForRavenclaw)
        counts.append(countForSlytherin)
        for count in counts{
            if count > maxCount{
                maxCount = count
            }
        }
        if countForGryffindor == maxCount{
            finalHouses.append(.Gryffindor)
        }
        if countForSlytherin == maxCount{
            finalHouses.append(.Slytherin)
        }
        if countForHufflepuff == maxCount{
            finalHouses.append(.Hufflepuff)
        }
        if countForRavenclaw == maxCount{
            finalHouses.append(.Ravenclaw)
        }
        
        return finalHouses.randomElement()!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
