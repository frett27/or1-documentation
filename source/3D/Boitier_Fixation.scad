$fn=100;

dimension_screen = [121, 76, 4.2];

module screen() {
    translate([-dimension_screen[0]/2,0,0])
    cube(dimension_screen);
}


ypcb = 48;
xpcb = 47;
module card() {
    pcb_thick = 2;
    
    cube([xpcb,ypcb, pcb_thick]);
    
    yethernet = 16;
    translate([-12.5 , ypcb-yethernet  ,pcb_thick])
    cube([21.8,yethernet,13.2]);
    
}


module positionnement_card() {
    translate([-xpcb + dimension_screen[0]/2 - 16,ypcb - 10 /* 10: cable */ ,-3])
    rotate([180,0,0])
    card();
}

// positionnement_card();
facteur_support = 1.3;

module support() {
    
    
    difference() { // trous
    
        union() {
        difference() { // fenetre passe_cable
            difference() { // evide dessous ecran
                difference() {
                    
                    union() {
                        color("#00F000")
                        translate([-dimension_screen[0]/2*facteur_support,-(facteur_support - 1)/2 *dimension_screen[1],-2])
                        scale([facteur_support,facteur_support,2/dimension_screen[2]])
                        cube([dimension_screen[0], dimension_screen[1], 10]);
                        
                        
                         
                    };
                    
                    
                    scale(1.01)
                    screen();
                }
                
                // fenetre du dessous
                translate([0,0.1*dimension_screen[1],-10])
                scale([0.8,0.8,1000])
                screen();
            }
            
          
          translate([-60 + dimension_screen[0]/2 - 20,dimension_screen[1]-3,-10])
            cube([60,6,20]);
            
        }
        
        
     difference() {
                        
        // support carte
        color("#00F000")
        translate([-10,-10,-2])
        scale(facteur_support)
        cube([xpcb, ypcb, 3]);
             
      
        scale(1.01)
        screen();
     }
     
 }
        trous_fixation();
    
    }
}

fixation_vector =
    [
        [-dimension_screen[0]/2 * facteur_support + 5, 
        -(facteur_support - 1)/2 * dimension_screen[1]/2, 0],

        [- (-dimension_screen[0]/2 * facteur_support + 5), 
        -(facteur_support - 1)/2 * dimension_screen[1]/2, 0],

        [-dimension_screen[0]/2 * facteur_support + 5, (facteur_support - 0.25) * dimension_screen[1], 0],

        [-(-dimension_screen[0]/2 * facteur_support + 5), (facteur_support - 0.25) * dimension_screen[1], 0]
    
    ];


module trous_fixation() {
    
    // trous
        translate([0,0,-4]) {

             translate([-dimension_screen[0]/2 * facteur_support + 5, -(facteur_support - 1)/2 * dimension_screen[1]/2, 0])
             cylinder(10,3,3);
            
             mirror([1,0,0])
             translate([-dimension_screen[0]/2 * facteur_support + 5, -(facteur_support - 1)/2 * dimension_screen[1]/2, 0])
             cylinder(10,3,3);

              translate([-dimension_screen[0]/2 * facteur_support + 5, (facteur_support - 0.25) * dimension_screen[1], 0])
             cylinder(10,3,3);
             
             mirror([1,0,0])
              translate([-dimension_screen[0]/2 * facteur_support + 5, (facteur_support - 0.25) * dimension_screen[1], 0])
             cylinder(10,3,3);
            
        }
}



module coupe_pour_export() {
    
    projection(cut = true)
    translate([0,0,0])
    support();
    
}


//support();
//coupe_pour_export();
