class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None
    
class Lista:
    def __init__(self):
        self.prim = None
        

'''
crearea unei liste din valori citite pana la 0
'''
def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista

def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod

def push(lista, new_data):
    if lista == None:
        lista = Lista()
        lista.prim = Nod(new_data)
    else:
        new_node = Nod(new_data)
        new_node.urm = lista.prim
        lista.prim = new_node
    return lista

def append_node(lista, new_node):
    if lista == None:
        lista = Lista()
        lista.prim = Nod(new_node)
    else:
        nod = Nod(new_node)
        if lista.prim != None:
            keep_head = lista.prim
            while keep_head.urm != None:
                keep_head = keep_head.urm
            keep_head.urm = nod
        else:
            lista.prim = nod
    return lista

'''
tiparirea elementelor unei liste
'''
def tipar(lista):
    tipar_rec(lista.prim)
    
def tipar_rec(nod):
    if nod != None:
        print (nod.e, end=" ")
        tipar_rec(nod.urm)


'''
program pentru test
        
def main():
    list = creareLista()
    tipar(list)
    
main() 
    
    
    
'''
    
    
