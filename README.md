# Desafio GX2 Rockets II 🚀
<p align="center">
  <img src="https://github.com/user-attachments/assets/3a287792-540d-488d-b5fc-91e85f348ef6" alt="Desafio Liferay II">
</p>

<p align="center">
  <img src="https://www.gx2.com.br/wp-content/uploads/2021/05/logo-gx2-branco.png" alt="Imagem Logo GX2">
</p>

## Objetivos do desafio
# Criar um Dashboard Personalizado
<p align="center">
  <img src="https://github.com/user-attachments/assets/2d15aaf1-d2d5-4d7c-889d-414e589433c8" alt="DashBoard">
</p>

Objetivo: Criar um dashboard personalizável com tipos diferentes de layouts onde os usuários possam inserir componentes desejados através de uma interface de "Drag and Drop".
4 tipos de Grid Layout: Uma grade simples onde os componentes podem ser arranjados em linhas e colunas.
Implementar temas (claro/escuro) para melhorar a experiência do usuário.

 # Criar um Componente Tarefas Pendentes
 <p align="center">
  <img src="https://github.com/user-attachments/assets/a9d6bbd1-d7da-4748-98f3-38549f7e3804" alt="Tarefas">
</p>
Objetivo: Criar uma seção de tarefas pendentes que se integre com o backend para exibir e gerenciar as tarefas do usuário.
Uma lista de tarefas com diferentes estados (pendente, em progresso, concluída).
Filtros para visualizar tarefas por status, data de vencimento, prioridade, etc.
Opção de marcar tarefas como concluídas ou editar detalhes da tarefa.
Design responsivo e intuitivo, utilizando frameworks como Bootstrap ou Material UI.
Integração com o Backend:
Utilizar a API desenvolvida pelo backend para obter, criar, atualizar e deletar tarefas.



# Componente Dados de cotação (Utilizando os Dados da API de Cotação)

 <p align="center">
  <img src="https://github.com/user-attachments/assets/5e3a2798-7bf4-4c60-8904-bdc2585de740" alt="Compoente Cotaçoes">
</p>
Objetivo: Criar um componente estilizado que exiba dados obtidos de uma API de cotação que será integrada pelos backends (ex.: cotação de moedas, ações, etc.).
Detalhes:
Obtenção de Dados:
Fazer requisições a uma API de cotação (como a API de câmbio da Open Exchange Rates ou uma API de mercado financeiro) para obter os dados em tempo real.
Implementar tratamento de erros para lidar com falhas nas requisições.
Visualização dos Dados:
Exibir os dados de maneira clara e informativa, utilizando gráficos, tabelas ou outros componentes visuais.
Implementar diferentes modos de visualização (ex.: gráfico de linha para mostrar variação ao longo do tempo, tabela para comparações entre diferentes cotações).

## Estrutura do Repositório 📂

- **Desafio Estrutura:**
  - **conteudo**
    - **formularios**
      - `Forms-202405242151.portlet.lar` - Arquivo para importar formulários para dentro do Liferay.
      - `Formulário Reembolso.xml` - Arquivo em XML para copiar o formulário.
  - **design**
    - **fragmento**
      - `home` - Este fragmento é o banner da página.
    - **modelo-de-widget**
      - `Modelo-blog.ftl` - Modelo que exibe os blogs de acordo com o tema.
      - `Modelo-categorias.ftl` - Modelo que exibe as categorias de acordo com o tema.
    - **modelo-pagina-exibição**
      - `modelo-noticia` - Modelo de página que exibe as notícias de acordo com o tema.
        - `display-page-template.json`
        - `page-definition.json`
  - **dist**
    - `gx2-desafio-rocket-theme.war` - Importando este arquivo no Liferay, o tema será aplicado automaticamente.
  - **src**
    - **WEB-INF**
    - **css** - Todos os arquivos utilizados para estilizar as páginas.
    - **images** - Imagens utilizadas na criação do site.
    - **templates** - Estrutura do Liferay como Header, Footer, Body, Login, etc.
  - **workflow**
    - `fluxoReembolso.ftl` - Importando este arquivo será criado um fluxo de reembolso no seu site.

## Obrigado pelo seu tempo 🌟

Espero que este repositório atenda às expectativas e demonstre meu comprometimento e dedicação ao desafio proposto por vocês 💚.

Aguardo ansiosamente o feedback! 🚀📚👨‍🎓
