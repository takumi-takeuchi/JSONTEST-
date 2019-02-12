//
//  ViewController.swift
//  JsonTest
//
//  Created by Takumi Takeuchi on 2019/02/09.
//  Copyright © 2019年 Takumi Takeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // JSONを受け取るための構造体
    struct GohStruct : Codable {
        let locations_code : String
        let towns_name_c   : String
        let towns_name_j   : String
        let created_at     : String
        let updated_at     : String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // JSONデータの受け取り
        guard let data = try? getJSONData() else { return }
        
        // JSONデータを構造体型にデコードする
        let gohStructData = try? JSONDecoder().decode(GohStruct.self, from: data!)
        
        // 構造体のプロパティから各変数を作成
        let locations_code:String = gohStructData!.locations_code
        let towns_name_c:String   = gohStructData!.towns_name_c
        let towns_name_j:String   = gohStructData!.towns_name_j
        let created_at:Date       = dateFromString(date: gohStructData!.created_at)
        let updated_at:Date       = dateFromString(date: gohStructData!.updated_at)
        
        // 号オブジェクトの生成
        let goh1 = Goh(locations_code: locations_code, towns_name_c: towns_name_c, towns_name_j: towns_name_j, created_at: created_at, updated_at: updated_at)
        
        // 号オブジェクトのプロパティを標準出力する
        print(goh1.getLocations_code())
        print(goh1.getTowns_name_c())
        print(goh1.getTowns_name_j())
        print(goh1.getCreated_at())
        print(goh1.getUpdated_at())

    }

    // JSONファイルからJSONを読み込み
    func getJSONData() throws -> Data? {
        guard let path = Bundle.main.path(forResource: "goh", ofType: "json") else { return nil }
        let url = URL(fileURLWithPath: path)
        return try Data(contentsOf: url)
    }
    
    // StringからDateへの日付変換処理
    func dateFromString(date:String) -> Date{
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print("dateFromString:\(date)")
        let returnValue:Date = df.date(from: date)! as Date
        return returnValue
    }
}

