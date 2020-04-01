% Luces de Navidad

par int : longitud;
par int : num_colores;
par int : max_consumo;

array [1..num_colores] of par int : consumo_bombilla;
array [1..num_colores] of par int : max_bombilla;

array [1..longitud] of var 1..num_colores : resultado;

constraint forall(i in 1..longitud - 2)(resultado[i] == resultado[i + 1] -> resultado[i] != resultado[i + 2]);
constraint forall(i in 1..num_colores)(forall(j in 1..longitud)( 2 * sum(k in 1..j where resultado[k] == i)(1) <= j + 1));
constraint sum(i in 1..longitud)(consumo_bombilla[resultado[i]]) <= max_consumo;
constraint forall(i in 1..num_colores)(sum(j in 1..longitud where resultado[j] == i)(1) <= max_bombilla[i]);

solve satisfy;

output[show(resultado)];