#!/bin/python3
import sys,re

user = "Joey"

appointments = []

class Appointment:
		def __init__(self, date, appType):
			self.appDate = date
			self.appType = appType

def storeAppointment(appoin):
		appString = f"{appoin.appDate[1]}/{appoin.appDate[0]}, {appoin.appType}\n"	
		file = open("appointments.txt", "a")
		file.write(appString)
		file.close()

def createAppointment():
		print("OK. Pass me the date and type of appointment please!")
		day = int(input("The day of the appointment: "))
		month = int(input("The month: "))
		date = (day, month)
		aType = input("Now what type of appointment is it?")
		newApp = Appointment(date, aType)
		print("Ok, I've created a new appointment for you!")
		print(f"It is a {aType} appointment on {month}/{day}")
		appointments.append(newApp)
		storeAppointment(newApp)
		
def goodmorning():
		print(f"Good morning, {user}!")
		print("today is Saturday, May 23")
		print("Today's weather is sunny with a high of 78")
		print("Expect rain tomorrow")

def remind():
		file = open("appointments.txt", "r")
		reg = re.compile(r'\(\d\,\s\d\)\,\s+\w+')
		for i in file:
				mo = reg.search(i)
				print(mo.group())
		file.close()

if len(sys.argv) > 1 and sys.argv[1] == "new":
		createAppointment()
elif len(sys.argv) > 1 and sys.argv[1] != "new":
		print("I don't understand")
elif len(sys.argv) == 1:
		goodmorning()
