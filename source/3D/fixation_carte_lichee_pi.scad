// Monture carte Lichee Pi


pcb_depth = 1; // 1mm
pcb_width = 47;
pcb_height = pcb_width;

module licheepi_pcb_board(margin = 0, depth = 1) {
        translate([-margin, -margin , 0])
        cube([pcb_width + 2*margin,pcb_height + 2*margin ,depth]);
}

module licheepi() {
    
    ethernet_width = 21;
    ethernet_height = 16;
    ethernet_depth = 18;
    ethernet_bottom_offset_from_top_surface = -4;
    ethernet_bottom_offset_from_left = -9;
    ethernet_bottom_offset_from_front = 2;

    licheepi_pcb_board(depth = pcb_depth);
    
    color([1,0,0])
    translate([pcb_width + ethernet_bottom_offset_from_left,
   ethernet_bottom_offset_from_front,
    ethernet_bottom_offset_from_top_surface])
    cube([ethernet_width,ethernet_height,ethernet_depth]);
    
}



module enclosing() {
    
    difference() {
        licheepi_pcb_board(margin = 3, depth = 6);
        
        union() {

            translate([0,0,1])            
            licheepi_pcb_board(margin = 0, depth = 10);
            
            translate([-4,25,0])
            cube([5, 18, 10]);
    
            translate([8,pcb_height,2])
            cube([25, 5, 10]);
            
            translate([17, -4, 4])
            cube([10, 8, 10]);
            
            translate([pcb_width - 0.01,0,0])
            cube([20,40,50]);
        }
        
    }
    
}

module bossages() {
    translate([6.5,0,-3])
    cube([2,6,3]);
    
    translate([pcb_width - 5, pcb_height - 7, -3])
    cube([5,7,3]);
    
    translate([5, pcb_height - 7, -3])
    cube([3,10,3]);
    
    
}


/*
color([0,0,1])
licheepi();
*/

translate([0,0,-4])
enclosing();
bossages();



