import clips
import threading

class KBS:
    def __init__(self,angles,a1,a2,a3,a4,a5,a6,a7 = None,a8 = None,a9 = None,a10 = None,a11 = None,a12 = None):
        self.angles = angles
        if(self.angles == 3):
            self.a1  = a1
            self.a2  = a2
            self.a3  = a3
            self.d1 = a4
            self.d2 = a5
            self.d3 = a6
        if(self.angles == 4):
            self.a1  = a1
            self.a2  = a2
            self.a3  = a3
            self.a4 = a4
            self.d1 = a5
            self.d2 = a6
            self.d3 = a7
            self.d4 = a8
        if(self.angles == 5):
            self.a1  = a1
            self.a2  = a2
            self.a3  = a3
            self.a4 = a4
            self.a5 = a5
            self.d1 = a6
            self.d2 = a7
            self.d3 = a8
            self.d4 = a9
            self.d5 = a10
        if(self.angles == 6):
            self.a1  = a1
            self.a2  = a2
            self.a3  = a3
            self.a4 = a4
            self.a5 = a5
            self.a6 = a6
            self.d1 = a7
            self.d2 = a8
            self.d3 = a9
            self.d4 = a10
            self.d5 = a11
            self.d6 = a12
    def run(self):
        env = clips.Environment()
        env.load("shape.clp")
        fact = env.assert_string("(no_angle " + str(self.angles)+")")
        if (self.angles == 3):
            fact = env.assert_string("(a1 " + str(self.a1)+")")
            fact = env.assert_string("(a2 " + str(self.a2)+")")
            fact = env.assert_string("(a3 " + str(self.a3)+")")
            fact = env.assert_string("(d1 " + str(self.d1)+")")
            fact = env.assert_string("(d2 " + str(self.d2)+")")
            fact = env.assert_string("(d3 " + str(self.d3)+")")
        if (self.angles == 4):
            fact = env.assert_string("(a1 " + str(self.a1)+")")
            fact = env.assert_string("(a2 " + str(self.a2)+")")
            fact = env.assert_string("(a3 " + str(self.a3)+")")
            fact = env.assert_string("(a4 " + str(self.a4)+")")
            fact = env.assert_string("(d1 " + str(self.d1)+")")
            fact = env.assert_string("(d2 " + str(self.d2)+")")
            fact = env.assert_string("(d3 " + str(self.d3)+")")
            fact = env.assert_string("(d4 " + str(self.d4)+")")
        if (self.angles == 5):
            fact = env.assert_string("(a1 " + str(self.a1)+")")
            fact = env.assert_string("(a2 " + str(self.a2)+")")
            fact = env.assert_string("(a3 " + str(self.a3)+")")
            fact = env.assert_string("(a4 " + str(self.a4)+")")
            fact = env.assert_string("(a5 " + str(self.a5)+")")
            fact = env.assert_string("(d1 " + str(self.d1)+")")
            fact = env.assert_string("(d2 " + str(self.d2)+")")
            fact = env.assert_string("(d3 " + str(self.d3)+")")
            fact = env.assert_string("(d4 " + str(self.d4)+")")
            fact = env.assert_string("(d5 " + str(self.d5)+")")
        if (self.angles == 6):
            fact = env.assert_string("(a1 " + str(self.a1)+")")
            fact = env.assert_string("(a2 " + str(self.a2)+")")
            fact = env.assert_string("(a3 " + str(self.a3)+")")
            fact = env.assert_string("(a4 " + str(self.a4)+")")
            fact = env.assert_string("(a5 " + str(self.a5)+")")
            fact = env.assert_string("(a6 " + str(self.a6)+")")
            fact = env.assert_string("(d1 " + str(self.d1)+")")
            fact = env.assert_string("(d2 " + str(self.d2)+")")
            fact = env.assert_string("(d3 " + str(self.d3)+")")
            fact = env.assert_string("(d4 " + str(self.d4)+")")
            fact = env.assert_string("(d5 " + str(self.d5)+")")
            fact = env.assert_string("(d6 " + str(self.d6)+")")
        env.run()
        f = open("facts.txt","w")
        for fact in env.facts():
            f.write(fact.__str__() +"\n")
        f.close()
if __name__ == "__main__":   
    f2 = open("rules.txt","w")
    f2.write("")
    f2.close()
    # cara pake kelas KBS, KBS(no.angle,a1,a2,...,an,d1,d2,...,dn)
    kbs = KBS(4,90,90,90,90,5,5,5,5)
    kbs.run()
    
