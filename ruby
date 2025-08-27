#!/bin/python3
import sys,re
import json as j
user = "Joey"

appointments = []

class Appointment:
		def __init__(self, date, appType):
			self.appDate = date
			self.appType = appType

		def get_appointment(self):
			return dict(date=self.appDate, appointment_type=self.appType)

def store_appointment_v2(appointment):
	with open("appointments.json", "w") as jfile:
		j.dump(appointment, jfile)

""" def storeAppointment(appoin):
		appString = f"{appoin.appDate[1]}/{appoin.appDate[0]}, {appoin.appType}\n"	
		file = open("appointments.txt", "a")
		file.write(appString)
		file.close() """

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
		store_appointment_v2(newApp.get_appointment())
		#storeAppointment(newApp)
		
def goodmorning():
		print(f"Good morning, {user}!")
		print("today is Saturday, May 23")
		print("Today's weather is sunny with a high of 78")
		print("Expect rain tomorrow")

def remind():
		with open("appointments.txt", "r") as file:
			reg = re.compile(r'\(\d\,\s\d\)\,\s+\w+')
			for line in file:
					mo = reg.search(line)
					print(mo.group())

if __name__ == "__main__":
	if len(sys.argv) > 1 and sys.argv[1] == "new":
			createAppointment()
	if len(sys.argv) > 1 and sys.argv[1] == "remind":
		remind()
	elif len(sys.argv) > 1 and sys.argv[1] != "new":
			print("I don't understand")
	elif len(sys.argv) == 1:
			goodmorning()
