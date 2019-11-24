from tkinter import *
from PIL import ImageTk, Image
import os

root = Tk()
img = ImageTk.PhotoImage(Image.open("hmif.png"))
panel = Label(root, image = img)
panel.pack(side = LEFT, fill = "both", expand = "true")
root.mainloop()