import csv
import datetime

# initialize an empty list to store phonebook entries
phonebook = []

# function to add new entry to phonebook
def add_entry():
    name = input("Enter name: ")
    phone = input("Enter phone number: ")
    email = input("Enter email: ")
    address = input("Enter address: ")
    entry = {"name": name, "phone": phone, "email": email, "address": address}
    phonebook.append(entry)
    print("Entry added.")
    export_csv()


# function to update existing entry in phonebook
def update_entry():
    name = input("Enter name of entry to update: ")
    for entry in phonebook:
        if entry["name"] == name:
            entry["phone"] = input("Enter new phone number: ")
            entry["email"] = input("Enter new email: ")
            entry["address"] = input("Enter new address: ")
            print("Entry updated.")
            export_csv()
            return
    print("Entry not found.")


# function to delete existing entry in phonebook
def delete_entry():
    name = input("Enter name of entry to delete: ")
    for entry in phonebook:
        if entry["name"] == name:
            phonebook.remove(entry)
            print("Entry deleted.")
            export_csv()
            return
    print("Entry not found.")

# function to export phonebook to CSV file
def export_csv():
    date = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = f"phonebook_{date}.csv"
    with open(filename, "w") as file:
        writer = csv.DictWriter(file, fieldnames=["name", "phone", "email", "address"])
        writer.writeheader()
        for entry in phonebook:
            writer.writerow(entry)
    print(f"Phonebook exported to {filename}.")


# main loop
while True:
    print("1. Add entry")
    print("2. Update entry")
    print("3. Delete entry")
    print("5. Exit")
    choice = input("Enter choice: ")
    if choice == "1":
        add_entry()
    elif choice == "2":
        update_entry()
    elif choice == "3":
        delete_entry()
    elif choice == "5":
        break
    else:
        print("Invalid choice.")
