//
//  ViewController.swift
//  getPeople
//
//  Created by Maha saad on 17/05/1443 AH.
//

import UIKit



class PeopleViewController: UITableViewController {

    var peoples = [NSDictionary] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople { data, response, error in
            do {
            
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                    if let result = jsonResult["results"] as? NSArray {
                                        for person in result {
                                            
                                            let personDic = person as! NSDictionary
                                             
                                             self.peoples.append(personDic)
                                           
                                            }
                                        }
                                    }
                      
                          
          DispatchQueue.main.async {
                            self.tableView.reloadData()
                         }
                      }catch{
                         print("Error \(error)")
                     }
                             
                   }
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peoples[indexPath.row]["name"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = peoples[indexPath.row]
        
        performSegue(withIdentifier: "personShow", sender: person)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as? NSDictionary
        let decController = segue.destination as? PeopleDetailsViewController
        decController?.passedPerson = person
    }
    


}

