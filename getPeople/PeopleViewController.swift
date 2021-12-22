//
//  ViewController.swift
//  getPeople
//
//  Created by Maha saad on 17/05/1443 AH.
//

import UIKit

class PeopleViewController: UITableViewController {

    var peoples : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople { data, response, error in
            do {
                let response = try JSONDecoder().decode(SWAPIPeopleResponse.self, from: data!)
                         for person in response.results{
                             self.peoples.append(person.name)
                          }
                          
                         DispatchQueue.main.async {
                            self.tableView.reloadData()
                         }
                      }catch{
                         print("Error \(error)")
                     }
                             
                   }
        }
        
        
        
     //   let url = URL(string: "https://swapi.dev/api/people/?format=json")!
        
     //   URLSession.shared.dataTask(with: url, completionHandler: {
      //      data, response, error in
     //       do{
      //          let response = try JSONDecoder().decode(SWAPIPeopleResponse.self, from: data!)
       //         for person in response.results{
       //             self.peoples.append(person.name)
       //         }
                
        //        DispatchQueue.main.async {
         //           self.tableView.reloadData()
        //        }
         //   }catch{
         //       print("Error \(error)")
      //      }
    //    }).resume()
  //  }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peoples[indexPath.row]
        return cell
    }
    


}

