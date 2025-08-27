#!/bin/python3
import sys
import json as j
user = "Joey"

class Appointment:
		def __init__(self, date, appType):
			self.appDate = date
			self.appType = appType
			self.dictionary = dict(date=self.appDate, appointment_type = self.appType)

		def get_appointment(self):
			return self.dictionary

def store_appointment_v2(appointment):
	with open("appointments.json", "a") as jfile:
		j.dump(appointment, jfile)

def createAppointment():
		print("OK. Pass me the date and type of appointment please!")
		day = int(input("The day of the appointment: "))
		month = int(input("The month: "))
		date = (day, month)
		aType = input("Now what type of appointment is it? ")
		newApp = Appointment(date, aType)
		print("Ok, I've created a new appointment for you!")
		print(f"It is a {aType} appointment on {month}/{day}")
		store_appointment_v2(newApp.get_appointment())
		#storeAppointment(newApp)
		
def goodmorning():
		print(f"Good morning, {user}!")
		print("today is Saturday, May 23")
		print("Today's weather is sunny with a high of 78")
		print("Expect rain tomorrow")

def remind_v2():
	with open("json/appointments.json", "r") as file:
		raw_app = j.load(file)
		print(f"your next {raw_app["appointment_type"]} appointment is on {raw_app["date"]}")

if __name__ == "__main__":
	if len(sys.argv) > 1 and sys.argv[1] == "new":
			createAppointment()
	if len(sys.argv) > 1 and sys.argv[1] == "remind":
		remind_v2()
	elif len(sys.argv) > 1 and sys.argv[1] != "new":
			print("I don't understand")
	elif len(sys.argv) == 1:
			goodmorning()