import pandas as pd

df = pd.read_csv("data/clientes.csv")
df = pd.read_csv("./data/clientes.csv")


def gerar_mensagem(nome):
    return f"Olá {nome}, temos novidades exclusivas para você!"

df["mensagem"] = df["nome"].apply(gerar_mensagem)

df.to_csv("data/mensagens_geradas.csv", index=False)




