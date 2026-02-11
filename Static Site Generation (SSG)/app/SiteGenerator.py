import requests
import os
from dotenv import load_dotenv

load_dotenv()

#f'apiKey={os.getenv('NEWSAPIKEY')}'

#função que faz a chamada de api new.org
def faz_pesquisa(assunto, idioma, api_key):
        url = (
            'https://newsapi.org/v2/everything?'
            f'q={assunto}&'
            f'language={idioma}&'
            'sortBy=publishedAt&'
            f'apiKey={api_key}'
        )
        response = requests.get(url)
        if response.status_code == 200: 
            return response.json()
        else:
            print(f'Erro na requisição: {response.status_code}')
            return None
        
#função que formata o texto para ser exibido no site, apenas titulo e descrição da primeira novicia
def formatar_texto(data):
    articles = data['articles']
    title = articles[0]['title']
    description = articles[0]['description']
    dici = {
        'Title': f'{title}',
        'Description': f'{description}'
    }
    return dici
def criar_html(dados):
    # Proteção: Se a API não retornou artigos, cria um HTML de erro amigável
    if not dados:
        titulo = "Sem notícias hoje"
        descricao = "A API não retornou dados ou o limite diário excedeu."
    else:
        titulo = dados['Title']
        descricao = dados['Description']

    # Um HTML um pouco mais bonito (CSS Inline para não precisar de arquivo extra)
    html_template = f"""
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Notícia do Dia - DevOps</title>
        <style>
            body {{ font-family: Arial, sans-serif; background-color: #f4f4f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }}
            .card {{ background: white; padding: 2rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width: 600px; }}
            h1 {{ color: #333; font-size: 1.5rem; }}
            p {{ color: #666; line-height: 1.6; }}
            .footer {{ margin-top: 20px; font-size: 0.8rem; color: #999; }}
        </style>
    </head>
    <body>
        <div class="card">
            <h1>{titulo}</h1>
            <p>{descricao}</p>
            <div class="footer">Atualizado automaticamente pelo Robô DevOps do Filipe</div>
        </div>
    </body>
    </html>
    """

    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(html_template)

data = faz_pesquisa('devops', 'pt', os.getenv('NEWSAPIKEY'))

dados = formatar_texto(data)

criar_html(dados)