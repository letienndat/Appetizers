//
//  AccountView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct AccountView: View {
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    @StateObject private var accountViewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    var body: some View {
        NavigationView {
            List {
                Section("PERSONAL INFO") {
                    TextField("First name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)

                    TextField("Last name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)

                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)

                    DatePicker(
                        "Birthday",
                        selection: $accountViewModel.user.birthDate,
                        in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date
                    )

                    Button {
                        self.accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }

                Section("ADDITIONAL PREFRENCES") {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Additional Cutlery", isOn: $accountViewModel.user.frequentRefills)
                }
            }
            .navigationTitle("🙆🏻‍♀️ Account")
        }
        .navigationViewStyle(.stack)
        .tabItem {
            Label("Account", systemImage: "person")
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
        .onAppear {
            self.accountViewModel.loadUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
