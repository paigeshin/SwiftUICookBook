//
//  SegmentedControlWithEnum.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/07.
//

import SwiftUI

enum Roles: CaseIterable {
    case student
    case staff
    case faculty
}

extension Roles {
    
    var title: String {
        switch self {
        case .student:
            return "Student"
        case .staff:
            return "Staff"
        case .faculty:
            return "Faculty"
        }
    }
    
}


struct SegmentedControlWithEnum: View {
    
    @State private var selectedRole: Roles = .student
    
    var body: some View {
        VStack {
            Picker("Select", selection: $selectedRole) {
                ForEach(Roles.allCases, id: \.self) { role in
                    Text(role.title)
                        .tag(role)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct SegmentedControlWithEnum_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlWithEnum()
    }
}
