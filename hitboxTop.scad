$fn = 40;
//Panel Dimension
hitBoxLength = 228;
hitBoxWidth = 148;
hitBoxHeight = 12;
cornerRadius = 6;
wallThickness = 3;
//mounting hole
mountDiameter = 2.75;
mountOuterRadius = mountDiameter/2 + 3;
// micro usb port
portWidth = 11;
portHeight = 7;
// key switch mount dimensions
keyMount = 14;
keyMountThickness = 1.28;
mountDepth = 6;

//Button Diameter
smallButton = 24;
bigButton = 30;
optionButton = 22;
//Button Distance
layoutWidth = 35;
layoutHeight = 100;
startX = 15;
startY = 40;
selectX = startX + 25;
selectY = startY;
homeX = selectX + 25;
homeY = selectY;
leftToDownX= 30;
leftToDownY = 0;
leftToRightX = leftToDownX + 25.25;
leftToRightY = 18;
leftToUpX = leftToRightX + 18.5;
leftToUpY = leftToRightY + 56;
leftToSquareX = leftToRightX + 25.75;
leftToSquareY = leftToRightY -12.25;
leftToCrossX = leftToRightX + 25.75;
leftToCrossY = leftToRightY + 18;
leftToTriangleX = leftToSquareX + 25.75;
leftToTriangleY = leftToSquareY - 18;
leftToCircleX = leftToCrossX + 25.75;
leftToCircleY = leftToSquareY + 12.25;
leftToR1X = leftToTriangleX + 29.5;
leftToR1Y = leftToSquareY - 9;
leftToR2X = leftToCircleX + 29.5;
leftToR2Y = leftToCrossY - 9;
leftToL1X = leftToR1X + 29.5;
leftToL1Y = leftToR1Y + 9;
leftToL2X = leftToR2X + 29.5;
leftToL2Y = leftToCrossY;
//coordinates for the panel
coordinates = [[0,0],[hitBoxLength, 0], [0, hitBoxWidth], [hitBoxLength, hitBoxWidth]];
cut out squart mount from top panel
difference(){
    //Draw the top panel
    difference(){
        union(){
            difference(){
                translate([cornerRadius, cornerRadius, cornerRadius])
                // making spherical rectangle
                hull()
                for(i = coordinates)
                translate(i)
                sphere(cornerRadius);
                // subtracting bottom half of spherical rectangle to give rounded rectangle shape at bottom
                linear_extrude(cornerRadius)
                offset(r=cornerRadius)
                translate([cornerRadius,cornerRadius,0])
                square([hitBoxLength, hitBoxWidth]);
            }
            //Adding the bottom half of panel
            linear_extrude(cornerRadius)
            offset(r = cornerRadius)
            translate([cornerRadius,cornerRadius,0])
            square([hitBoxLength, hitBoxWidth]);
        }
        //innershell of top panel
        union(){
            difference(){
                translate([cornerRadius,cornerRadius, cornerRadius - wallThickness])
                hull()
                for(i = coordinates)
                translate(i)
                sphere(cornerRadius - wallThickness);
                linear_extrude(cornerRadius-wallThickness)
                offset(r=cornerRadius-wallThickness)
                translate([cornerRadius,cornerRadius,0])
                square([hitBoxLength, hitBoxWidth]);
            }
            linear_extrude(cornerRadius-wallThickness)
            offset(r=cornerRadius-wallThickness)
            translate([cornerRadius,cornerRadius,0])
            square([hitBoxLength, hitBoxWidth]);
        }
    }
    // Draw key mount for control layout
    translate([layoutWidth, layoutHeight, mountDepth - 1])
    linear_extrude(mountDepth + 1)
    union(){
        // start
        translate([startX - keyMount/2,startY - keyMount/2, 0]) square(keyMount);
        // select
        translate([selectX - keyMount/2, selectY - keyMount/2, 0]) square(keyMount);
        // home
        translate([homeX - keyMount/2, homeY - keyMount/2, 0]) square(keyMount);
        // left
        translate([-keyMount/2, -keyMount/2, 0]) square(keyMount);
        // down
        translate([leftToDownX - keyMount/2, leftToDownY - keyMount/2, 0]) square(keyMount);
        // right
        translate([leftToRightX - keyMount/2, -leftToRightY - keyMount/2, 0]) square(keyMount);
        // up
        translate([leftToUpX - keyMount/2, -leftToUpY - keyMount/2, 0 ]) square(keyMount);
        // square
        translate([leftToSquareX - keyMount/2, -leftToSquareY - keyMount/2, 0]) square(keyMount);
        // triangle
        translate([leftToTriangleX - keyMount/2, -leftToTriangleY - keyMount/2, 0]) square(keyMount);
        // R1
        translate([leftToR1X - keyMount/2, -leftToR1Y - keyMount/2, 0]) square(keyMount);
        // L1
        translate([leftToL1X - keyMount/2, -leftToL1Y - keyMount/2, 0]) square(keyMount);
        // cross
        translate([leftToCrossX - keyMount/2, -leftToCrossY - keyMount/2, 0]) square(keyMount);
        // circle
        translate([leftToCircleX - keyMount/2, -leftToCircleY-keyMount/2, 0]) square(keyMount);
        // R2
        translate([leftToR2X - keyMount/2, -leftToR2Y - keyMount/2, 0]) square(keyMount);
        // L2
        translate([leftToL2X - keyMount/2, -leftToL2Y - keyMount/2, 0]) square(keyMount);
    }
    //Draw circles for control layout
    translate([layoutWidth, layoutHeight, mountDepth + keyMountThickness])
    linear_extrude(mountDepth)
    union(){
        //start
        translate([startX, startY, 0]) circle(d=optionButton);
        //select
        translate([selectX, selectY, 0]) circle(d=optionButton);
        //home
        translate([homeX, homeY, 0]) circle(d=optionButton);
        //left
        circle(d=smallButton);
        //down
        translate([leftToDownX,leftToDownY,0]) circle(d=smallButton);
        //right 
        translate([leftToRightX,-leftToRightY,0]) circle(d=smallButton);
        //Up
        translate([leftToUpX, -leftToUpY, 0]) circle(d=bigButton);
        //Square
        translate([leftToSquareX, -leftToSquareY,0]) circle(d=smallButton);
        //Triangle
        translate([leftToTriangleX, -leftToTriangleY, 0]) circle(d=smallButton);
        //R1
        translate([leftToR1X, -leftToR1Y,0]) circle(d=smallButton);
        //L1
        translate([leftToL1X, - leftToL1Y, 0]) circle(d=smallButton);
        //Cross
        translate([leftToCrossX, -leftToCrossY, 0]) circle(d=smallButton);
        //Circle
        translate([leftToCircleX, -leftToCircleY,0]) circle(d=smallButton);
        //R2
        translate([leftToR2X, -leftToR2Y, 0]) circle(d=smallButton);
        //L2
        translate([leftToL2X, -leftToL2Y, 0]) circle(d=smallButton);
    }
    // cut out for micro usb
    translate([(hitBoxLength + wallThickness*2)/2, hitBoxWidth + cornerRadius + wallThickness,0])
    linear_extrude(portHeight)
    square([portWidth, wallThickness]);
}
// Add mounting holes
translate([wallThickness + mountOuterRadius -3, wallThickness + mountOuterRadius + 10, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}
translate([wallThickness + mountOuterRadius + 10, wallThickness + mountOuterRadius - 3, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}

translate([wallThickness + hitBoxLength + mountOuterRadius, wallThickness + mountOuterRadius + 10, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}
translate([wallThickness + hitBoxLength - 10, wallThickness + 2, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}

translate([wallThickness + mountOuterRadius -3, wallThickness + hitBoxWidth - mountOuterRadius - 3, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}
translate([wallThickness + mountOuterRadius + 10, wallThickness + hitBoxWidth + mountOuterRadius, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}

translate([wallThickness + hitBoxLength - 10, wallThickness + hitBoxWidth + mountOuterRadius, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}
translate([wallThickness + hitBoxLength + mountOuterRadius, wallThickness + hitBoxWidth + mountOuterRadius - 10, 0])
difference(){
    cylinder(h = mountDepth, r = mountOuterRadius);
    cylinder(h = mountDepth, d = mountDiameter);
}
