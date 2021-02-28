// LetterBlock.scad - Basic usage of text() and linear_extrude()

// Module instantiation
//LetterBlock("H");

// Module definition.
// size=30 defines an optional parameter with a default value.
module LetterBlock(letter, size=30) {
        translate([0,0,size/6]) cube([size/1.8,size/2,size/3], center=true);
        translate([0,size/4-size/50,0]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(height=size/3, convexity=4)
                text(letter, 
                     size=size*16/30,
                     font="Segoe UI Emoji",
                     halign="center",
                     valign="bottom");
    }
}

module WordBlock(text, size=30) {
  for (i=[0:len(text)-1]) {
    c=text[i];
    translate([i*size/2,0,0]) LetterBlock(c);
  }
}

WordBlock("✌👍🤓");