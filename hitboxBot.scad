$fn=40;
//Panel Dimension
hitBoxLength = 228;
hitBoxWidth = 148;
hitBoxHeight = 2;
cornerRadius = 6;
wallThickness = 3;

//mounting hole
outerDiameter = 6.7;
innerDiameter = 3;
mountDiameter = 2.75;
mountOuterRadius = mountDiameter/2 + 3;
difference(){
linear_extrude(hitBoxHeight)
offset(r = cornerRadius)
translate([cornerRadius,cornerRadius,0])
square([hitBoxLength, hitBoxWidth]);

// Add mounting holes
translate([wallThickness + mountOuterRadius -3, wallThickness + mountOuterRadius + 10, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + mountOuterRadius + 10, wallThickness + mountOuterRadius - 3, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + hitBoxLength + mountOuterRadius, wallThickness + mountOuterRadius + 10, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + hitBoxLength - 10, wallThickness + 2, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + mountOuterRadius -3, wallThickness + hitBoxWidth - mountOuterRadius - 3, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + mountOuterRadius + 10, wallThickness + hitBoxWidth + mountOuterRadius, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + hitBoxLength - 10, wallThickness + hitBoxWidth + mountOuterRadius, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);

translate([wallThickness + hitBoxLength + mountOuterRadius, wallThickness + hitBoxWidth + mountOuterRadius - 10, 0])
    cylinder(h = hitBoxHeight, d1 = innerDiameter, d2 = outerDiameter);
}