import numpy
import cv2 as cv

# img = cv.imread('treelon.jpg', cv.IMREAD_COLOR)

# cv.imshow('treelon', img)
# cv.waitKey(0)
# cv.destroyAllWindows()
#############################################
# cam = cv.VideoCapture(0)

# while(True):
#     ret, frame = cam.read()

#     cv.imshow('video', frame)
#     if cv.waitKey(1) & 0xFF == ord('q'):
#         break

# cam.release()
# cv.destroyAllWindows()
#############################################
img = numpy.zeros((512,512,3), numpy.uint8)

cv.imshow('before', img) 
img = cv.line(img, (0,0), (511,511), (255,0,0), 5)
cv.imshow('after', img)
cv.waitKey(0)
cv.destroyAllWindows()
