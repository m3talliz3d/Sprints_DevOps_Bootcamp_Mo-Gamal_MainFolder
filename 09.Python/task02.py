userName = input("Please type your first name: ").capitalize()

# Function
def is_leap(year=0):
    if int(year) >= 1000 and int(year) <= 4000:
        if int(year) % 4 == 0: #The year can be evenly divided by 4, is a leap year, UNLESS..
            if int(year) % 100 == 0: #The year can be evenly divided by 100, it is NOT a leap year, UNLESS..
                if int(year) % 400 == 0: #The year is also evenly divisible by 400. Then it is a leap year
                    print("{} is a leap year".format(year))
                else:
                    print("{} Not a Leap year".format(year))
            else:
                print("{} is a leap year".format(year))
        else:
            print("{} Not a Leap year".format(year))
    else:
        print("Year is out of range")



while True:
    year = input("Hello {}, Please enter a year (between 1000 - 4000): ".format(userName))
    if year == 'e':
        print("Exiting code...")
        break
    else:
        is_leap(year)
