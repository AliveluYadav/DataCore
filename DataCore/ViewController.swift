//
//  ViewController.swift
//  DataCore
//
//  Created by Alivelu Ravula on 4/26/18.
//  Copyright © 2018 brn. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

   var  appdel=UIApplication.shared.delegate as! AppDelegate
    
    var manObjCont:NSManagedObjectContext?
    var poliEntityRef:NSEntityDescription?
    var CricEntityRef:NSEntityDescription?
    
    
    var login:[NSManagedObject]=[]
    
    @IBOutlet weak var poliNamTF: UITextField!
    @IBOutlet weak var partyNamTF: UITextField!
    @IBOutlet weak var poliStateTF: UITextField!
    
    
    @IBOutlet weak var criNamTF: UITextField!
    @IBOutlet weak var cricStateTF: UITextField!
    @IBOutlet weak var teamNamTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.manObjCont=self.appdel.persistentContainer.viewContext
        
        self.poliEntityRef=NSEntityDescription.entity(forEntityName: "Politicians", in: manObjCont!)
        self.CricEntityRef=NSEntityDescription.entity(forEntityName: "Cricketers", in: manObjCont!)
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func savePoliBtnAction(_ sender: Any) {
        
        let poliManagedobj=NSManagedObject(entity: self.poliEntityRef!, insertInto: self.manObjCont!)
        
        poliManagedobj.setValue(self.poliNamTF.text, forKey: "poliNam")
        poliManagedobj.setValue(self.partyNamTF.text, forKey: "poliParty")
        poliManagedobj.setValue(self.poliStateTF.text, forKey: "poliState")
        
        login.append(poliManagedobj)

        do{
       try self.manObjCont?.save()
            print("saved Successfully")
            
        }
        catch{
            
            print("Error while saving")
        }
        
    }
    
    
    @IBAction func fetchPoliBtnAction(_ sender: Any) {
   
        let request = NSFetchRequest<Politicians>(entityName: "Politicians")
        request.predicate=NSPredicate(format: "poliParty=%@", "bjp" )

        
        do{
          if var  storedObj=try self.manObjCont?.fetch(request)
            
//          if let conttt = storedObj?.count
          {
            for i in 0..<storedObj.count
            {
                var stordManObjs=storedObj[i]
               print(stordManObjs.value(forKey: "poliNam"))
                print(stordManObjs.poliState)
                print(stordManObjs.poliParty)
                
        }
            }
            
        }
        catch
        {
           print("something went wrong")
        }
    
    }
    
    
    
    @IBAction func saveBtnActionForcric(_ sender: Any) {
        
        
        var criManObj=NSManagedObject(entity: CricEntityRef!, insertInto: manObjCont)
        criManObj.setValue(criNamTF.text, forKey: "cricNam")
        criManObj.setValue(cricStateTF, forKey: "cricState")
        criManObj.setValue(teamNamTF, forKey: "cricTeam")
        do{
       try self.manObjCont?.save()
            print("saved successfully")
            
            
            
        }catch{
            
            print("error while saving cricketers")
        }
        
    }
    
    @IBAction func fetchBtnActionForCric(_ sender: Any) {
    
    var fetchReq=NSFetchRequest<Cricketers>(entityName:"Cricketers")
        
        do{
            
           if var cricStordObj = try manObjCont?.fetch(fetchReq)
           {
            for i in 0..<cricStordObj.count
            {
         var stordMaObjCric=cricStordObj[0]
            }
            
        }
        }
        catch{
            
            
        }
    
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="pass"
        {
            var nvc=segue.destination as! PopulateTVC
//            nvc.
            
            
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
//{
//
//    var storedObj = manObjCont?.fetch(request)
//    print(storedObj)
//
//    for i in 0..<storedObj?.count
//    {
//
//        do {
//            var storedManagedObj=storedObj![0]
//
//            print(storedManagedObj.value(forKey: "poliNam"))
//
//        }catch{
//
//        }
//    }
//    catchdo {
//
//        print("not fetched")
//
//    }
//}

