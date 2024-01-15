//
//  ViewController.swift
//  Searching
//
//  Created by Abhishek Bhardwaj on 12/01/24.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    let defaults = UserDefaults.standard
    var myFriends = [Friends]()
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == "" {
            setupData()
        }
        else {
            myFriends = myFriends.filter({ friend in
                friend.firstName.localizedCaseInsensitiveContains(searchText) ||
                friend.lastName.localizedCaseInsensitiveContains(searchText)
            })
        }
        tableView.reloadData()
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "FriendTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FriendTableViewCell")
        setupData()
        setupSearchBar()
        if let encodedFriendsData = defaults.data(forKey: "myFriendsArray"),
           let decodedFriends = try? JSONDecoder().decode([Friends].self, from: encodedFriendsData) {
            myFriends = decodedFriends
            
        }
        
        
    }
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    private func setupData() {
       myFriends  = [
              Friends(firstName: "Abhishek", lastName: "Bhardwaj"),
              Friends(firstName: "Priyag Raj", lastName: "Sharma"),
              Friends(firstName: "Rishabh", lastName: "Dagar"),
              Friends(firstName: "Akshay", lastName: "Kumar"),
              Friends(firstName: "Deepu", lastName: "Tyagi"),
              Friends(firstName: "Param", lastName: "Bhardwaj"),
              Friends(firstName: "Sourabh", lastName: "Nirwal"),
              Friends(firstName: "Divyansh", lastName: "Singh"),
              Friends(firstName: "Lakshit", lastName: "Chaudhary"),
              Friends(firstName: "Lalit", lastName: "Sephard"),
              Friends(firstName: "Pappu", lastName: "Chahal"),
              Friends(firstName: "Karan", lastName: "Veerbhan"),
              Friends(firstName: "Large", lastName: "Large"),
              Friends(firstName: "Rohit", lastName: "Raman"),
              Friends(firstName: "Ashok", lastName: "Palli"),
              Friends(firstName: "Anirudh", lastName: "Gangwar"),
              Friends(firstName: "Ansh", lastName: "Bargoti"),
              Friends(firstName: "Roshan", lastName: "Jogi"),
              Friends(firstName: "Ganesh", lastName: "Yadav"),
              Friends(firstName: "Biswaa", lastName: "Sharma"),
              Friends(firstName: "Gullu", lastName: "Sharma"),
              Friends(firstName: "Aryan", lastName: "Sharma"),
              Friends(firstName: "Sourabh", lastName: "Tyagi"),
              
          ]
    }

    @IBAction func addNewFriendButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Friend", message: "Enter Friend's name to continue", preferredStyle: .alert)
        alert.addTextField { firstNameField in
            firstNameField.placeholder = "Enter first name"
        }
        alert.addTextField { lastNameField in
            lastNameField.placeholder = "Enter last name"
        }
        let addAction = UIAlertAction(title: "Add Friend", style: .default) { _ in
            if let friendFirstName = alert.textFields?[0].text, let friendLastName = alert.textFields?[1].text {
                let newFriend = Friends(firstName: friendFirstName, lastName: friendLastName)
                self.myFriends.append(newFriend)
                let encodedFriends = try? JSONEncoder().encode(self.myFriends)
                self.defaults.set(encodedFriends, forKey: "myFriendsArray")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        let firstName = myFriends[indexPath.row].firstName
        let lastName = myFriends[indexPath.row].lastName
        cell.setup(firstName: firstName, lastName: lastName)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myFriends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            let encodedFriends = try? JSONEncoder().encode(self.myFriends)
            self.defaults.set(encodedFriends, forKey: "myFriendsArray")
        }
    }
    
    
}

extension ViewController: UISearchBarDelegate, UISearchControllerDelegate {
     
}
