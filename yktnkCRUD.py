import psycopg2
from tkinter import *
import pandas as pd
import sqlalchemy

cnx = 'postgresql+psycopg2://postgres:mcdonalds@localhost:5433/cartas'
sqlalchemy.create_engine(cnx)

# os parâmetros são do meu servidor local, imagino que vá precisar mudar pra executar em outra máquina
conn = psycopg2.connect(host="localhost", dbname="cartas", user="postgres", password="mcdonalds", port=5433)

cur = conn.cursor()

janela = Tk()
janela.title("Menu")

def consulta():
    janelaconsulta = Toplevel(janela)
    janelaconsulta.title("Consulta")
    
    consulta_label = Label(janelaconsulta, text="ID: ")
    consulta_label.grid(column=0, row=0, padx=0, pady=0)
    consulta_entry = Entry(janelaconsulta)
    consulta_entry.grid(column=0, row=1, padx=10, pady=10)
       
    def consulta_confirm():
        id = consulta_entry.get()
        try:      
            # obter resultado  
            idsearch = int(id)
            query = f"select * from carta where (id_carta={idsearch})"
            df = pd.read_sql_query(query, cnx)
            
            # exibir
            result_label = Label(janelaconsulta, text= df)
            result_label.grid(column=0, row=3, padx=0, pady=0)    
        except:        
            result_label = Label(janelaconsulta, text= "Não foi possível realizar a consulta.")
            result_label.grid(column=0, row=3, padx=0, pady=0)   
        
    botaox = Button(janelaconsulta, text="Confirmar", command=consulta_confirm)
    botaox.grid(column=0, row=2, padx=10, pady=10)
    

def remover():
    janelaremover = Toplevel(janela)
    janelaremover.title("Remover")
    
    remocao_label = Label(janelaremover, text="ID: ")
    remocao_label.grid(column=0, row=0, padx=0, pady=0)
    remocao_entry = Entry(janelaremover)
    remocao_entry.grid(column=0, row=1, padx=10, pady=10)
       
    def remover_confirm():
        id = remocao_entry.get()
        try:      
            # obter resultado 
            cursor= conn.cursor() 
            idsearch = int(id)
            cursor.execute("delete from carta where (id_carta=%s)", (id)) 
            conn.commit()
                
            result_label = Label(janelaremover, text= "Tupla removida com sucesso.")
            result_label.grid(column=0, row=3, padx=0, pady=0)    
        except:        
            result_label = Label(janelaremover, text= "Não foi possível remover a tupla. ")
            result_label.grid(column=0, row=3, padx=0, pady=0) 
        finally:
            cursor.close()
        
    botaox = Button(janelaremover, text="Confirmar", command=remover_confirm)
    botaox.grid(column=0, row=2, padx=10, pady=10)
    

def incluir():
    janelaincluir = Toplevel(janela)
    janelaincluir.title("Incluir")
    
    inclusao_label0 = Label(janelaincluir, text="ID da carta: ")
    inclusao_label0.grid(column=0, row=0, padx=0, pady=0)
    inclusao_entry0 = Entry(janelaincluir)
    inclusao_entry0.grid(column=0, row=1, padx=10, pady=10)
    
    inclusao_label1 = Label(janelaincluir, text="Nome: ")
    inclusao_label1.grid(column=0, row=2, padx=0, pady=0)
    inclusao_entry1 = Entry(janelaincluir)
    inclusao_entry1.grid(column=0, row=3, padx=10, pady=10)
    
    inclusao_label2 = Label(janelaincluir, text="Quantidade produzida: ")
    inclusao_label2.grid(column=0, row=4, padx=0, pady=0)
    inclusao_entry2 = Entry(janelaincluir)
    inclusao_entry2.grid(column=0, row=5, padx=10, pady=10)
    
    inclusao_label3 = Label(janelaincluir, text="Custo da carta: ")
    inclusao_label3.grid(column=0, row=6, padx=0, pady=0)
    inclusao_entry3 = Entry(janelaincluir)
    inclusao_entry3.grid(column=0, row=7, padx=10, pady=10)
    
    inclusao_label4 = Label(janelaincluir, text="Ataque da carta: ")
    inclusao_label4.grid(column=0, row=8, padx=0, pady=0)
    inclusao_entry4 = Entry(janelaincluir)
    inclusao_entry4.grid(column=0, row=9, padx=10, pady=10)
    
    inclusao_label5 = Label(janelaincluir, text="Defesa da carta: ")
    inclusao_label5.grid(column=0, row=10, padx=0, pady=0)
    inclusao_entry5 = Entry(janelaincluir)
    inclusao_entry5.grid(column=0, row=11, padx=10, pady=10)
    
    inclusao_label6 = Label(janelaincluir, text="ID do deck da carta: ")
    inclusao_label6.grid(column=0, row=12, padx=0, pady=0)
    inclusao_entry6 = Entry(janelaincluir)
    inclusao_entry6.grid(column=0, row=13, padx=10, pady=10)
       
    def incluir_confirm():
        
        id_carta = inclusao_entry0.get()
        nome = inclusao_entry1.get()
        qnt_produzida = inclusao_entry2.get()
        custo = inclusao_entry3.get()
        ataque = inclusao_entry4.get()
        defesa = inclusao_entry5.get()
        id_deck = inclusao_entry6.get()
        
        try:      
            cursor= conn.cursor()
            cursor.execute("insert into carta(id_carta, nome, qnt_produzida, custo, ataque, defesa, id_deck) VALUES (%s, %s, %s, %s, %s, %s, %s)", (id_carta, nome, qnt_produzida, custo, ataque, defesa, id_deck))
            cursor.query
            conn.commit()
                
            inserted_label = Label(janelaincluir, text= "Tupla inserida com sucesso.")
            inserted_label.grid(column=0, row=15, padx=0, pady=0)
            
        except:        
            print("Não foi possível realizar a inserção. Verifique restrições. ")
        
    botaox = Button(janelaincluir, text="Confirmar", command=incluir_confirm)
    botaox.grid(column=0, row=14, padx=10, pady=10)
    



botao1 = Button(janela, text="CONSULTA", command=consulta)
botao1.grid(column=0, row=0, padx=10, pady=10)
botao2 = Button(janela, text="REMOVER", command=remover)
botao2.grid(column=0, row=1, padx=10, pady=10)
botao3 = Button(janela, text="INCLUIR", command=incluir)
botao3.grid(column=0, row=2, padx=10, pady=10)


janela.mainloop()

conn.commit()

cur.close()
conn.close()