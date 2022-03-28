//
//  AddRemoveMove.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct AddRemoveMove: View {
    
    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    
    private func deleteTask(indexSet: IndexSet) {
        indexSet.forEach { index in
            tasks.remove(at: index)
        }
    }
    
    
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    TextField("Enter task name", text: $taskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        tasks.append(taskName)
                        taskName = ""
                    }
                }
                
                List {
                    
                    // Why Using ForEach?
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    // useful functions
                    // MARK: - DELETE
                    .onDelete(perform: deleteTask)
                    // MARK: - MOVE
                    .onMove(perform: moveTask)
                    
                }
                .listStyle(PlainListStyle())
                // MARK: - EDIT
                .toolbar {
                    EditButton()
                }
                .listRowSeparator(.hidden)
                
            }
            .padding()
        }
        .colorScheme(.light)
    }
}

struct AddRemoveMove_Previews: PreviewProvider {
    static var previews: some View {
        AddRemoveMove()
    }
}




//NavigationView {
//    VStack {
//
//        HStack {
//            TextField("Enter task name", text: $taskName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button("Add Task") {
//                tasks.append(taskName)
//                taskName = ""
//            }
//        }
//
//        List {
//
//            // Why Using ForEach?
//            ForEach(tasks, id: \.self) { task in
//                Text(task)
//            }
//            // useful functions
//            // MARK: - DELETE
//            .onDelete(perform: deleteTask)
//            // MARK: - MOVE
//            .onMove(perform: moveTask)
//            // DELETE LIST ROW
//            .listRowSeparator(.hidden)
//
//        }
//        .listStyle(PlainListStyle())
//        // MARK: - EDIT
//        .toolbar {
//            EditButton()
//        }
//
//    }
//    .padding()
//}
//.colorScheme(.light)
