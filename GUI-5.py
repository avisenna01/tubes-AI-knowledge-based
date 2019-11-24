# import tkinter and all its functions
from tkinter import * 

root = Tk() # create root window
root.title("Basic GUI Layout") # title of the GUI window
root.maxsize(1280, 1024) # specify the max size the window can expand to
root.config(bg="black") # specify background color

# Create left and right frames
left_frame = Frame(root, width=200, height=400, bg='grey')
left_frame.grid(row=0, column=0, padx=10, pady=5)

right_frame = Frame(root, width=650, height=400, bg='grey')
right_frame.grid(row=0, column=1, padx=10, pady=5)

right_frame_1 = Frame(root, width=650, height=400, bg='grey')
right_frame_1.grid(row=0, column=2, padx=10, pady=5)

# Create frames and labels in left_frame
Label(left_frame, text="Source Image").grid(row=0, column=0, padx=5, pady=5)

# load image to be "edited"
image = PhotoImage(file="graf.gif")
original_image = image.subsample(5,5) # resize image using subsample
Label(left_frame, image=original_image).grid(row=1, column=0, padx=5, pady=5)

# Display image in right_frame
Label(right_frame, image=image).grid(row=0,column=0, padx=5, pady=5)

# Display image in right_frame_1
Label(right_frame_1, image=image).grid(row=0,column=0, padx=5, pady=5)

# Create tool bar frame
tool_bar = Frame(left_frame, width=180, height=185)
tool_bar.grid(row=2, column=0, padx=5, pady=5)

# Example Buttons that could be displayed under the "Tool" menu
Button(tool_bar, text="Select").grid(row=1, column=0, padx=5, pady=5)
Button(tool_bar, text="Crop").grid(row=2, column=0, padx=5, pady=5)
Button(tool_bar, text="Rotate & Flip").grid(row=3, column=0, padx=5, pady=5)
Button(tool_bar, text="Resize").grid(row=4, column=0, padx=5, pady=5)

root.mainloop()