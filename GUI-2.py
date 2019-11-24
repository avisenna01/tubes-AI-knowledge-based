from tkinter import Tk, Text, BOTH, W, N, E, S
from tkinter.ttk import Frame, Button, Label, Style


class Example(Frame):

    def __init__(self):
        super().__init__()

        self.initUI()


    def initUI(self):

        self.master.title("Windows")
        self.pack(fill=BOTH, expand=True)

        self.columnconfigure(1)
        self.columnconfigure(3)
        self.columnconfigure(5)
        self.columnconfigure(7)
        # self.rowconfigure(3, pad=7)
        self.rowconfigure(5)
        self.rowconfigure(7, pad=5)

        lbl = Label(self, text="Source Image")
        lbl.grid(row=0, sticky=W, pady=4, padx=5)

        lbl1 = Label(self, text="Detection Image")
        lbl1.grid(row=0, sticky=W, pady=4, padx=5)

        area1 = Text(self)
        area2 = Text(self)
        area3 = Text(self)
        area4 = Text(self)
        area5 = Text(self)

        area1.grid(row=1, column=0, columnspan=1, rowspan=3,
            padx=5, sticky=E+W+S+N)

        area2.grid(row=1, column=3, columnspan=4, rowspan=3,
            padx=5, sticky=E+W+S+N)

        area3.grid(row=1, column=6, columnspan=7, rowspan=3,
            padx=5, sticky=E+W+S+N)

        area4.grid(row=4, column=0, columnspan=3, rowspan=6,
            padx=5, sticky=E+W+S+N)

        area5.grid(row=4, column=4, columnspan=5, rowspan=6,
            padx=5, sticky=E+W+S+N)

        abtn = Button(self, text="Open Image")
        abtn.grid(row=1, column=10)

        bbtn = Button(self, text="Open Rule Editor")
        bbtn.grid(row=2, column=10)

        cbtn = Button(self, text="Show Rules")
        cbtn.grid(row=3, column=10)

        dbtn = Button(self, text="Show Facts")
        dbtn.grid(row=4, column=10)

        # hbtn = Button(self, text="Help")
        # hbtn.grid(row=5, column=0, padx=5)

        # obtn = Button(self, text="OK")
        # obtn.grid(row=5, column=3)


def main():

    root = Tk()
    root.geometry("350x300+300+300")
    app = Example()
    root.mainloop()


if __name__ == '__main__':
    main()