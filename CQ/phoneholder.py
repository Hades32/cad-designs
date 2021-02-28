from cadquery import *
from math import *

result = (
	Workplane("XZ").polygon(3,100).extrude(60).rotateAboutCenter((0,1,0),180/3/2)
	.faces("<X or <Z").shell(2.4)
	.faces("<Y").workplane().polygon(6, 50).cutThruAll()
	.faces(">(1,0,1)").workplane(centerOption="CenterOfMass").polygon(6, 50).cutThruAll()
	.faces(">X and >Z").workplane().move(0,50/2).rect(50,2).extrude(10)
	.edges("|Y").fillet(0.8)
	.faces(">(1,0,1)").workplane(centerOption="CenterOfMass").rect(27, 42).cutThruAll()
)