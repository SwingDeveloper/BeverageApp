//
//  MenuViewController.swift
//  BeverageApp
//
//  Created by macbook_air_1 on 2022/12/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuArray = [Menu.Record]()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://api.airtable.com/v0/appfieMsUwTxzERom/Menu?sort[][field]=createdtime"
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue("Bearer keykgXb1GRqbLNtpC", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let menu = try decoder.decode(Menu.self, from: data)
                        DispatchQueue.main.async {
                            self.menuArray = menu.records
                            print(self.menuArray)
                        }
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
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
