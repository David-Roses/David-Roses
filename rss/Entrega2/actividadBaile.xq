(:
Mostrar cada uno de los nombres de los bailes con la etiqueta "losbailes".
:)

for $baile in /bailes/baile
return <losbailes>{$baile/nombre/text()}</losbailes>
(:
Mostrar los nombres de los bailes seguidos con el número de plazas entre paréntesis, ambos dentro de la misma etiqueta "losbailes".
:)

for $baile in /bailes/baile
return <losbailes>{$baile/nombre/text()} ({$baile/plazas/text()})</losbailes>

(:
Mostrar los nombres de los bailes cuyo precio sea mayor de 30.
:)

for $baile in /bailes/baile
where $baile/precio > 30
return $baile/nombre
for $baile in /bailes/baile[precio > 30]
return $baile/nombre

(:
Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda "euro".
:)

for $baile in /bailes/baile
where $baile/precio > 30 and $baile/precio/@moneda = "euro"
return $baile/nombre
for $baile in /bailes/baile[precio > 30 and precio/@moneda = "euro"]
return $baile/nombre

(:
Mostrar los nombres y la fecha de comienzo de los bailes que comiencen el mes de enero (utiliza para buscarlo la cadena de texto "/1/").
:)

for $baile in /bailes/baile
where contains($baile/comienzo, "/1/")
return 
   <baile>
      {$baile/profesor}
      {$baile/comienzo}
   </baile>
(:
Mostrar los nombres de los profesores y la sala en la que dan clase, ordénalos por sala.
:)

for $baile in /bailes/baile
order by $baile/sala
return 
   <baile>
      {$baile/profesor}
      {$baile/sala}
   </baile>
(:
Mostrar los nombres de los profesores eliminando los repetidos y acampañar cada nombre con todas las salas en la que da clase, ordénalos por nombre.
:)
for $profesor in distinct-values(/bailes/baile/profesor)
let $salas := /bailes/baile[profesor=$profesor]/sala
order by $profesor
return 
   <profesores>
     <nombre>{$profesor}</nombre>
     {$salas}
   </profesores>
(:
Mostrar la media de los precios de todos los bailes.
:)

let $baile := /bailes/baile
return <media>{avg($baile/precio)}</media>
(:
Mostrar la suma de los precios de los bailes de la sala 1.
:)

let $baile := /bailes/baile[sala=1]
return <total_sala_1>{sum($baile/precio)}</total_sala_1>
(:
Mostrar cuántas plazas en total oferta el profesor "Jesus Lozano".
:)

let $baile := /bailes/baile[profesor = "Jesus Lozano"]
return <plazas>{sum($baile/plazas)}</plazas>
(:
Mostrar el dinero que ganaría la profesora "Laura Mendiola" si se completaran todas las plazas de su baile, sabiendo que sólo tiene un baile.
:)
let $baile := /bailes/baile[profesor = "Laura Mendiola"]
return $baile/plazas * $baile/precio
(:
Mostrar el dinero que ganaría el profesor "Jesus Lozano" si se completaran todas las plazas de su baile, pero mostrando el beneficio de cada baile por separado.
:)
for $baile in /bailes/baile
where $baile/profesor = "Jesus Lozano"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
(:
Mostrar el dinero que ganaría la profesora "Laura" (no conocemos su apellido) si se completaran todas las plazas de su baile.
:)
for $baile in /bailes/baile
where starts-with($baile/profesor, "Laura")
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
for $baile in /bailes/baile[starts-with(profesor, "Laura")]
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
(:
Mostrar el nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile
:)
for $baile in /bailes/baile
order by $baile/nombre
return 
   <baile>
      {$baile/nombre}
      <precio>{$baile/precio/text()}</precio>
      <fam_numerosa>{$baile/precio * 0.85}</fam_numerosa>
   </baile>
(:
Mostrar todos los datos de cada baile excepto la fecha de comienzo y de fin.
:)
for $baile in /bailes/baile
return <baile>{$baile/* except $baile/comienzo except $baile/fin}</baile>
(:
Mostrar en una tabla de HTML los nombres de los bailes y su profesor, cada uno en una fila.
:)
<table> {
  for $baile in /bailes/baile
  return <tr><td>{$baile/nombre/text()}</td><td>{$baile/profesor/text()}</td></tr>
} </table>