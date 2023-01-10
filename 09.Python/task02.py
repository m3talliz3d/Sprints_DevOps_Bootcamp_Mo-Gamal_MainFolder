userName = input("Please type your first name: ").capitalize()
year = 0
while True:
    year = input("Hello {}, Please enter a year (between 1000 - 4000): ".format(userName))
    if year == 'e':
        print("Exiting code...")
        break
    else:
        if int(year) >= 1000 and int(year) <= 4000:
            if int(year) % 4 == 0:
                if int(year) % 100 == 0:
                    if int(year) % 400 == 0:
                        print("{} is a leap year".format(year))
                    else:
                        print("{} Not a Leap year".format(year))
                else:
                    print("{} is a leap year".format(year))
            else:
                print("{} Not a Leap year".format(year))
        else:
            print("Year is out of range")