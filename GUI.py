import Serial
import Tkinter
 
arduinoData = serial.Serial('com8', 9600)
 
 
    
            
def led1_on():
   arduinoData.write('2') #write(b'1')
    
def led1_off():
   arduinoData.write('3')
 
def led2_on():
   arduinoData.write('4') #write(b'2')
 
def led2_off():
   arduinoData.write('5')
 
def led3_on():
   arduinoData.write('6') #write(b'3')
 
def led3_off():
   arduinoData.write('7')
 
def led4_on():
   arduinoData.write('8') #write(b'4')
 
def led4_off():
   arduinoData.write('9')
 
def led5_on():
   arduinoData.write('A') #write(b'5')
 
def led5_off():
   arduinoData.write('B')
 
def led6_on():
   arduinoData.write('C') #write(b'6')
 
def led6_off():
   arduinoData.write('D')
 
def led7_on():
   arduinoData.write('E') #write(b'7')
 
def led7_off():
   arduinoData.write('F')
 
 
    
import sys
from Tkinter import*
from time import sleep
 
root = Tk()
frame = Frame(root)
frame.pack()
 
root.title("SIM SWAP SYSTEM")
 
num1=StringVar()
 
topframe = Frame(root)
topframe.pack(side = TOP)
txtDisplay = Button(frame, bg="green", fg="black", text="SIM SWAP BUTTON SYSTEM")
txtDisplay.pack(side = TOP)
 
button1 = Button(topframe, padx=16, bd=8, text="AIRCARD A-1 ON LINE", bg="green", fg="black", command=led1_on)
button1.pack(side = LEFT)
button2 = Button(topframe, padx=16, bd=8, text="AIRCARD A-1 UTILITY", fg="red", command=led1_off)
button2.pack(side = LEFT)
 
 
frame1 = Frame(root)
frame1.pack(side = TOP)
 
button1 = Button(frame1, padx=16, bd=8, text="AIRCARD A-2 ON LINE", fg="black", command=led2_on)
button1.pack(side = LEFT)
button2 = Button(frame1, padx=16, bd=8, text="AIRCARD A-2 UTILITY", fg="red", command=led2_off)
button2.pack(side = LEFT)
 
 
frame2 = Frame(root)
frame2.pack(side = TOP)
 
button1 = Button(frame2, padx=16, bd=8, text="AIRCARD A-3 ON LINE", fg="black", command=led3_on)
button1.pack(side = LEFT)
button2 = Button(frame2, padx=16, bd=8, text="AIRCARD A-3 UTILITY", fg="red", command=led3_off)
button2.pack(side = LEFT)
 
 
frame3 = Frame(root)
frame3.pack(side = TOP)
 
button1 = Button(frame3, padx=16, bd=8, text="AIRCARD A-4 ON LINE", fg="black", command=led4_on)
button1.pack(side = LEFT)
button2 = Button(frame3, padx=16, bd=8, text="AIRCARD A-4 UTILITY", fg="red", command=led4_off)
button2.pack(side = LEFT)
 
frame4 = Frame(root)
frame4.pack(side = TOP)
 
button1 = Button(frame4, padx=16, bd=8, text="AIRCARD A-5 ON LINE", fg="black", command=led5_on)
button1.pack(side = LEFT)
button2 = Button(frame4, padx=16, bd=8, text="AIRCARD A-5 UTILITY", fg="red", command=led5_off)
button2.pack(side = LEFT)
 
 
frame5 = Frame(root)
frame5.pack(side = TOP)
 
button1 = Button(frame5, padx=16, bd=8, text="AIRCARD A-6 ON LINE", fg="black", command=led6_on)
button1.pack(side = LEFT)
button2 = Button(frame5, padx=16, bd=8, text="AIRCARD A-6 UTILITY", fg="red", command=led6_off)
button2.pack(side = LEFT)
 
frame6 = Frame(root)
frame6.pack(side = TOP)
 
button1 = Button(frame6, padx=16, bd=8, text="AIRCARD A-7 ON LINE", fg="black", command=led7_on)
button1.pack(side = LEFT)
button2 = Button(frame6, padx=16, bd=8, text="AIRCARD A-7 UTILITY", fg="red", command=led7_off)
button2.pack(side = LEFT)
 
 
root.mainloop()