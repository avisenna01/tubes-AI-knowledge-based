# Python program to illustrate HoughLine 
# method for line detection 
import cv2 
import numpy as np
import math

def showImage(img):
    cv2.imshow('result', img)
    cv2.waitKey(0)

def distanceOfLines(l1, l2):
    # l = l1
    # x1 = l[0][0]
    # y1 = l[0][1]
    # x2 = l[1][0]
    # y2 = l[1][1]
    # a1 = (y1 - y2)
    # b1 = (x2 - x1)
    # c1 = (y2 - y1)*x1 - (x2 - x1)*y1

    # l = l2
    # x1 = l[0][0]
    # y1 = l[0][1]
    # x2 = l[1][0]
    # y2 = l[1][1]
    # a2 = (y1 - y2)
    # b2 = (x2 - x1)
    # c2 = (y2 - y1)*x1 - (x2 - x1)*y1

    # if (a1*a2 + b1*b2) > 0 and math.sqrt(a1*a2 + b1*b2) != 0:
    #     return abs(c2 - c1)/math.sqrt(a1*a2 + b1*b2)
    # else:
    #     return abs(c2 - c1)/0.0000000001
    return abs(l1[0][0] - l2[0][0]) + abs(l1[0][1] - l2[0][1]) + abs(l1[1][0] - l2[1][0]) + abs(l1[1][1] - l2[1][1])


# Reading the required image in  
# which operations are to be done.  
# Make sure that the image is in the same  
# directory in which this python program is 
img = cv2.imread('img/triangle.jpg') 

def averageLine(l1, l2):
    # l = l1
    # x1 = l[0][0]
    # y1 = l[0][1]
    # x2 = l[1][0]
    # y2 = l[1][1]
    
    # m1 = (y2 - y1)/((x2 - x1) if (x2 - x1) != 0 else (0.000000001))
    # c1 = y1 - m1*x1

    # l = l2
    # x1 = l[0][0]
    # y1 = l[0][1]
    # x2 = l[1][0]
    # y2 = l[1][1]
    
    # m2 = (y2 - y1)/((x2 - x1) if (x2 - x1) != 0 else (0.000000001))
    # c2 = y1 - m1*x1
    
    return [[math.ceil((l1[0][0] + l2[0][0])/2), math.ceil((l1[0][1] + l2[0][1])/2)], 
    [math.ceil((l1[1][0] + l2[1][0])/2), math.ceil((l1[1][1] + l2[1][1])/2)]]

def getIntersection(l1, l2):
    xdiff = (l1[0][0] - l1[1][0], l2[0][0] - l2[1][0])
    ydiff = (l1[0][1] - l1[1][1], l2[0][1] - l2[1][1])

    def det(a, b):
        return a[0] * b[1] - a[1] * b[0]

    div = det(xdiff, ydiff)
    if div == 0:
       return False

    d = (det(*l1), det(*l2))
    x = det(d, xdiff) / div
    y = det(d, ydiff) / div
    return [math.floor(x), math.floor(y)]

def inLine(node, line):
    crossproduct = (line[1][1] - line[0][1]) * (node[0] - line[0][0]) - (line[1][0] - line[0][0]) * (node[1] - line[0][1])

    # compare versus epsilon for floating point values, or != 0 if using integers
    if abs(crossproduct) > 3000:
        return False


    # dotproduct = (line[1][0] - line[0][0]) * (node[0] - line[0][0]) + (line[1][1] - line[0][1])*(node[1] - line[0][1])
    # if dotproduct < 0:
    #     return False

    squaredlengthba = (node[0] - line[0][0])*(node[0] - line[0][0]) + (node[1] - line[0][1])*(node[1] - line[0][1])

    # if dotproduct > squaredlengthba:
    #     return False
    
    # print('ngeh')

    return True

def euclidianDistance(p1, p2):
    return math.sqrt((p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]))

def getNodes(img, lines):
    height, width, channels = img.shape
    nodes = []
    for l1 in lines:
        for l2  in lines:
            node = getIntersection(l1, l2)
            if (node and node[0] >= 0 and node[0] <= width and node[1] >= 0 and node[1] <= height):
                if node not in nodes:
                    nodes.append(node)

    changed = []
    for i in range(0, len(lines)*2):
        changed.append(False)

    # Trimming nodes
    for node in nodes:
        k = 0
        for line in lines:
            if inLine(node, line):
                # print('ngok')
                if (euclidianDistance(line[0], node) > euclidianDistance(line[1], node)
                    and changed[k] == False):
                    line[0] = node
                    changed[k] = True
                else:
                    line[1] = node
                    changed[k+1] = True
            k += 2

    for node in nodes:
        sisi = []
        for line in lines:
            if inLine(node, line):
                sisi.append(line)
        node.append(
            math.degrees(math.atan((euclidianDistance(sisi[0][0], sisi[0][1]))/(euclidianDistance(sisi[1][0], sisi[1][1]))))
        )

    return (nodes, lines)

def getLines(img):
    # Convert the img to grayscale 
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)   
    gray = cv2.blur(gray, (3,3))

    # Apply edge detection method on the image 
    edges = cv2.Canny(gray,50,150,apertureSize = 3)    

    # This returns an array of r and theta values 
    lines = cv2.HoughLines(edges,1,np.pi/180, 110) 

    # The below for loop runs till r and theta values  
    # are in the range of the 2d array 
    lineList = []
    for line in lines:
        for r,theta in line: 
            # Stores the value of cos(theta) in a 
            a = np.cos(theta) 
        
            # Stores the value of sin(theta) in b 
            b = np.sin(theta) 
            
            # x0 stores the value rcos(theta) 
            x0 = a*r 
            
            # y0 stores the value rsin(theta) 
            y0 = b*r 
            
            # x1 stores the rounded off value of (rcos(theta)-1000sin(theta)) 
            x1 = int(x0 + 1000*(-b)) 
            
            # y1 stores the rounded off value of (rsin(theta)+1000cos(theta)) 
            y1 = int(y0 + 1000*(a)) 
        
            # x2 stores the rounded off value of (rcos(theta)+1000sin(theta)) 
            x2 = int(x0 - 1000*(-b)) 
            
            # y2 stores the rounded off value of (rsin(theta)-1000cos(theta)) 
            y2 = int(y0 - 1000*(a)) 

            lineList.append([[x1, y1], [x2, y2]])     


    # Averaging
    newList = []
    appendList = []
    
    k = 0
    for i in lineList:
        appendList.append([])                  
        for j in lineList:
            if (distanceOfLines(i, j) < 50 and distanceOfLines(i, j) > 0):
                appendList[k].append(j)                 
                lineList.remove(j)
        appendList[k].append(i)                 
        # lineList.remove(i)
        k += 1
    
    for lineSet in appendList:
        if (len(lineSet) != 0):
            currLine = lineSet[0]
            for line in lineSet:
                currLine = averageLine(currLine, line)
            newList.append(currLine)

    lineList = newList

    newList = []
    appendList = []
    
    k = 0
    for i in lineList:
        appendList.append([])                  
        for j in lineList:
            if (distanceOfLines(i, j) < 50 and distanceOfLines(i, j) > 0):
                appendList[k].append(j)                 
                lineList.remove(j)
        appendList[k].append(i)                 
        # lineList.remove(i)
        k += 1
    
    for lineSet in appendList:
        if (len(lineSet) != 0):
            currLine = lineSet[0]
            for line in lineSet:
                currLine = averageLine(currLine, line)
            newList.append(currLine)

    lineList = newList

    # print(len(appendList), appendList)
    # print(len(newList), newList)

    return lineList

def drawLines(img, lines, nodes):
    for line in lines:
        # cv2.line draws a line in img from the point(x1,y1) to (x2,y2). 
        # (0,0,255) denotes the colour of the line to be  
        #drawn. In this case, it is red.  
        cv2.line(img,(line[0][0],line[0][1]), (line[1][0],line[1][1]), (0,0,255),2) 
    
    for node in nodes:
        cv2.circle(img, (node[0], node[1]), 5, (255, 0, 0), -1)
    
    return img

lines = getLines(img)
nodes, lines = getNodes(img, lines)
lined = drawLines(img, lines, nodes)

# x, y, degrees
print(len(nodes), nodes)

showImage(lined)