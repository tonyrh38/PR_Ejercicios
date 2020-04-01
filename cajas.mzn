% Cajas

par int : height;
par int : width;
par int : num_boxes;

array [1..num_boxes, 1..2] of par int: box_size;

array [1..num_boxes, 1..2] of var int : sol;

constraint forall(i in 1..num_boxes)(box_size[i,1] + sol[i,1] <= width /\ box_size[i,2] + sol[i,2] <= height);

constraint forall(i in 1..num_boxes, j in 1..num_boxes where i != j)();


