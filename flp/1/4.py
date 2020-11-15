from lista import creareLista, tipar, append_node, Lista, Nod, push
'''
4. a. Determine if a list has even number of elements, without computing the length of the list.

even_length(l1l2...ln)=
    true, if {}
    false, if n == 1
    even_length(l3l4..ln), otherwise
'''

'''
def even_length(lista, first_element):
    if lista.prim == None:
        lista.prim = first_element 
        return True
    if lista.prim != None and lista.prim.urm == None:
        lista.prim = first_element
        return False
    lista.prim = lista.prim.urm.urm 
    return even_length(lista, first_element)

lista = creareLista()
first_element = lista.prim
if even_length(lista, first_element):
    print("EVEN")
else:
    print("ODD")
tipar(lista)

'''
'''
b. Delete all occurrences of an element e from a list

delete_occurences(l1l2...ln, e)=
    {}, if {}
    l1 U delete_occurences(l2l3..ln, e), if l1 != e
    delete_occurences(l2l3...ln, e), otherwise
'''

def delete_occurences(lista, e):
    #print(lista.prim.e)
    if lista == None:
        lista = Lista()
        return lista
    elif lista.prim == None:
        return lista
    elif lista.prim.e != e:
        keep_element = lista.prim.e
        lista.prim = lista.prim.urm
        return push(delete_occurences(lista,e), keep_element)
    else:
        lista.prim = lista.prim.urm
        return delete_occurences(lista, e)

lista = creareLista()
delete_occurences(lista, 3)
tipar(lista)
