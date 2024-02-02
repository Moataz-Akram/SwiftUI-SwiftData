//
//  ContentView.swift
//  SwiftUI+SwiftData
//
//  Created by Moataz Akram on 31/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var bugs: [Bug]
    
    @State private var team: String = ""
    @State private var number: String = ""
    @State private var assignee: String = ""

    var body: some View {

        NavigationSplitView {
            List {
                ForEach(bugs) { bug in
                    NavigationLink {
                        EditView(bug: bug)
                    } label: {
                        VStack {
                            Text("Team: \(bug.team)")
                            Text("number: \(bug.number)")
                            Text("Assignee: \(bug.assignee)")
                        }
                    }
                }.onDelete { indexSet in
                    for index in indexSet {
                        deleteBug(bugs[index])
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Team:     ")
                    TextField("Team", text: $team)
                }
                HStack {
                    Text("Number:  ")
                    TextField("Number", text: $number)
                }
                HStack {
                    Text("Assignee:")
                    TextField("Assignee", text: $assignee)
                }
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 25))
                    .onTapGesture {
                        let bugNumber = Int(number) ?? 0
                        let bug = Bug(team: team, number: bugNumber, assignee: assignee)
                        team = ""
                        number = ""
                        assignee = ""
                        addBug(bug)
                    }
            }
            .clipped()
            .border(.fill)
            .padding()

        } detail: {
            Text("select item")
        }
    }
    
    func addBug(_ bug: Bug) {
        context.insert(bug)
    }

    func deleteBug(_ bug: Bug) {
        context.delete(bug)
    }
}

#Preview {
    ContentView()
}

struct EditView: View {
    @Bindable var bug: Bug
    
    @State private var team: String = ""
    @State private var number: String = ""
    @State private var assignee: String = ""

    var body: some View {
        VStack {
            HStack {
                Text("Team:     ")
                TextField("\(bug.team)", text: $team)
            }
            HStack {
                Text("Number:  ")
                TextField("\(bug.number)", text: $number)
            }
            HStack {
                Text("Assignee:")
                TextField("\(bug.assignee)", text: $assignee)
            }
            Button {
                editBug()
                team = ""
                number = ""
                assignee = ""
            } label: {
                Text("Edit")
            }
        }
    }
    
    func editBug() {
        bug.team = team
        bug.number = Int(number) ?? bug.number
        bug.assignee = assignee
    }
}
