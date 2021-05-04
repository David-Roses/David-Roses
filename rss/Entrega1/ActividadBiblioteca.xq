(:
1. Mostrar los títulos de los libros con la etiqueta "titulo".
:)

(:
for $x in doc("Biblioteca.xml")/bookstore/book/title
return <titulo>{data($x)}</titulo>
:)

(:
2. Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la
condición en la cláusula "where" y luego en la ruta del XPath.
:)

(:
for $x in doc("books.xml")/bookstore/book
  where $x/price<=30
  order by $x/title
  return $x/title
:)

(:
3. Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.
:)

(:
for $x in doc('bookstore.xml')/bookstore/book[price<=30]
return $x/title
:)


(:
4. Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a
30.
:)

(:
for $x in doc ("Biblioteca.xml")/bookstore/book
where $x/price<=30
return $x/title/text()
:)

(:
5. Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de
ellos con "lib2005".
:)

(:
for $x in doc ("Biblioteca.xml")/bookstore/book
where $x/year=2005
return <lib2005>{data($x/author/text())}-{data($x/year/text())}</lib2005>
:)

(:
6. Mostrar los años de publicación, primero con "for" y luego con "let" para
comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".
:)

(:
for $x in doc ("Biblioteca.xml")/bookstore/book
return <publicacion>{data($x/year/text())}</publicacion>


let $x := doc("Biblioteca.xml")/bookstore/book/year
return <publicacion>{data($x)}</publicacion>
:)

(:
7. Mostrar los libros ordenados primero por "category" y luego por "title" en una
sola consulta.
:)
(:
for $x in doc ("Biblioteca.xml")/bookstore/book
order by $x/@category,$x/title
return $x
:)

(:
8. Mostrar cuántos libros hay, y etiquetarlo con "total".
:)
(:
let $x := count(doc("Biblioteca.xml")/bookstore/book) return <total>{$x}</total>


let $total := count(doc("Biblioteca.xml")/bookstore/book), 
    $titulos := (for $t in doc("Biblioteca.xml")/bookstore/book/title return <titulo>{$t/text()}</titulo>) 
return <resultado>
          {$titulos}
          <total>
              {$total}
          </total>
      </resultado>
:)
(:
9. Mostrar los títulos de los libros y al final una etiqueta con el número total de
libros.
:)
(:
<libros>{
for $libro in doc("Biblioteca.xml")/bookstore/book 
let $precioIVA := ($libro/price * 1.21)
order by $precioIVA
return <libro>
            <titulo>{$libro/title/text()}</titulo>
             <precio>{$libro/price/text()}</precio>
             <precioIVA>{$precioIVA}</precioIVA>
             </libro>
     }
</libros>
:)

(:
10.Mostrar el precio mínimo y máximo de los libros.
let $x := max(doc("Biblioteca.xml")/bookstore/book/price),
    $y := min(doc("Biblioteca.xml")/bookstore/book/price) 
return <resultado>{$x}-{$y}</resultado>
:)

(:

11.Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno
con su propia etiqueta. Ordénalos por precio con IVA.
:)

for $libro in /bookstore/book
let $precio_iva := ($libro/price * 1.21)
order by $precio_iva
return 
<libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()} €</precio>
  <precio_iva>{$precio_iva} €</precio_iva>
</libro>


(:
12.Mostrar la suma total de los precios de los libros con la etiqueta "total".

let $libros := /bookstore/book
return <total>{sum($libros/price)}</total>

13.Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.

<libros>
{
  for $libro in /bookstore/book
  return $libro/price
}
{
  let $libros := /bookstore/book
  return <total>{sum($libros/price)}</total>
}
</libros>

14.Mostrar el título y el número de autores que tiene cada título en etiquetas
diferentes.

for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <autores>{count($libro/author)}</autores>
  </libro>

15.Mostrar en la misma etiqueta el título y entre paréntesis el número de autores
que tiene ese título.

for $libro in /bookstore/book
return <libro>{$libro/title/text()} ({count($libro/author)})</libro>

16.Mostrar los libros escritos en años que terminen en "3".

for $libro in /bookstore/book
where ends-with($libro/year, "3")
return $libro

17.Mostrar los libros cuya categoría empiece por "C".

for $libro in /bookstore/book
where starts-with($libro/@category, "C")
return $libro


18.Mostrar los libros que tengan una "X" mayúscula o minúscula en el título
ordenados de manera descendente.

for $libro in /bookstore/book
where contains($libro/title, "x") or contains($libro/title, "X")
order by $libro/title descending
return $libro

19.Mostrar el título y el número de caracteres que tiene cada título, cada uno con
su propia etiqueta.

for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <length>{string-length($libro/title)}</length>
  </libro>

20.Mostrar todos los años en los que se ha publicado un libro eliminando los
repetidos. Etiquétalos con "año".

for $año in distinct-values(/bookstore/book/year)
return <año>{$año}</año>

21.Mostrar todos los autores eliminando los que se repiten y ordenados por el
número de caracteres que tiene cada autor.

for $autor in distinct-values(/bookstore/book/author)
order by string-length($autor)
return <autor>{$autor}</autor>

22.Mostrar los títulos en una tabla de HTML.

<table>
{
  for $libro in /bookstore/book
  return 
    <tr>
      <td>{$libro/title/text()}</td>
    </tr>
}
</table>

:)
