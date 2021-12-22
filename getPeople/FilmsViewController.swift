//
//  FilmsViewController.swift
//  getPeople
//
//  Created by Maha saad on 17/05/1443 AH.
//

import UIKit

class FilmsViewController: UITableViewController {

    var films = [NSDictionary] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllfilms { data, response, error in
            do{
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                    if let result = jsonResult["results"] as? NSArray {
                                        for film in result {
                                            
                                            let filmDic = film as! NSDictionary
                                             
                                             self.films.append(filmDic)
               // let response = try JSONDecoder().decode(SWAPIFilmsResponse.self, from: data!)
             //   for film in response.results{
               //     self.films.append(film.title)
                    
                                        }     }
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print("Error \(error)")
            }
        }
        
     //   let url = URL(string: "https://swapi.dev/api/films/?format=json")!
        
     //   URLSession.shared.dataTask(with: url, completionHandler: {
     //       data, response, error in
      //      do{
      //          let response = try JSONDecoder().decode(SWAPIFilmsResponse.self, from: data!)
       //         for film in response.results{
       //             self.films.append(film.title)
       //         }
                
       //         DispatchQueue.main.async {
      //              self.tableView.reloadData()
      //          }
                
      //      }catch{
      //          print("Error \(error)")
      //      }
            
    //    }).resume()
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = films[indexPath.row]["title"] as? String

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = films[indexPath.row]
        
        performSegue(withIdentifier: "showSegue", sender: film)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let film = sender as? NSDictionary
        let decController = segue.destination as? FilmDetailsViewController
        decController?.passedFilm = film
    }

}
