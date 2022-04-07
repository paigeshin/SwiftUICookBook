//
//  ContentView.swift
//  HelloFirebase
//
//  Created by Mohammad Azam on 10/20/20.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ContentView: View {
    
    private var db: Firestore
    @State private var title: String = ""
    @State private var tasks: [Task] = []
    
    init() {
        db = Firestore.firestore() 
    }
    
    private func saveTask(task: Task) {
        do {
            _ = try db.collection("tasks").addDocument(from: task) { err in
                if let err = err {
                    print(err.localizedDescription)
                } else {
                    print("Document has been saved!")
                    fetchAllTasks()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func fetchAllTasks() {
        
        db.collection("tasks")
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snapshot = snapshot {
                        
                        tasks = snapshot.documents.compactMap { doc in
                            var task = try? doc.data(as: Task.self)
                            if task != nil {
                                task!.id = doc.documentID
                            }
                            
                            return task
                            
                        }
                        
                    }
                }
            }
        
    }
    
    private func deleteTask(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let task = tasks[index]
            db.collection("tasks")
                .document(task.id!)
                .delete { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        fetchAllTasks()
                    }
                }
                
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter task", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                let task = Task(title: title)
                saveTask(task: task)
            }
            
            List {
                ForEach(tasks, id: \.title) { task in
                    NavigationLink(
                        destination: TaskDetailView(task: task),
                        label: {Text("Navigate")})
                }.onDelete(perform: deleteTask)
            }
            .listStyle(PlainListStyle())
            
            Spacer()
            
            .onAppear(perform: {
                    fetchAllTasks()
            })
        
        }.padding()
            .navigationTitle("Tasks")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TaskDetailView: View {
    
    let db: Firestore = Firestore.firestore()
    let task: Task
    @State private var title: String = ""
    
    
    private func updateTask() {
        db.collection("tasks")
            .document(task.id!)
            .update([
                "title": title
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Update Succesful")
                }
            }
    }
    
    var body: some View {
        VStack {
            TextField(task.title, text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                updateTask()
            }
        }
        .padding()
    }
    
}
