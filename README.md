```markdown
# TranslatorApp

**TranslatorApp** é um aplicativo web desenvolvido em Ruby on Rails que permite aos usuários traduzir textos de um idioma para outro usando uma API de tradução. O projeto foi criado para demonstrar a integração com APIs externas e a criação de uma interface de usuário interativa.

## Funcionalidades

- **Tradução de Textos**: Permite aos usuários inserir um texto, selecionar o idioma de origem e o idioma de destino para obter a tradução.
- **Armazenamento de Traduções**: As traduções são armazenadas no banco de dados e podem ser visualizadas posteriormente.
- **Interface de Usuário**: Simples e intuitiva, com formulários para inserção de dados e visualização das traduções.

## Tecnologias Utilizadas

- **Ruby on Rails**: Framework para desenvolvimento de aplicações web.
- **RestClient**: Biblioteca para fazer requisições HTTP à API de tradução.
- **API de Tradução**: Utiliza uma API de tradução (como Deepl ou Google Translate) para realizar a tradução dos textos.

## Instalação

Siga os passos abaixo para configurar e executar o projeto localmente:

1. **Clone o Repositório**:

   ```bash
   git clone https://github.com/seu-usuario/TranslatorApp.git
   cd TranslatorApp
   ```

2. **Instale as Dependências**:

   Certifique-se de ter o [Ruby](https://www.ruby-lang.org/) e o [Bundler](https://bundler.io/) instalados. Execute:

   ```bash
   bundle install
   ```

3. **Configure o Banco de Dados**:

   Crie e configure o banco de dados:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Configure as Variáveis de Ambiente**:

   Crie um arquivo `.env` na raiz do projeto e adicione sua chave da API de tradução:

   ```bash
   TRANSLATION_API_KEY=your_api_key_here
   ```

5. **Inicie o Servidor**:

   ```bash
   rails server
   ```

   O aplicativo estará disponível em `http://localhost:3000`.

## Uso

1. Acesse a página principal do aplicativo (`http://localhost:3000`).
2. Preencha o formulário com o texto a ser traduzido, o idioma de origem e o idioma de destino.
3. Clique em "Traduzir" para obter a tradução.

## Contribuição

Contribuições são bem-vindas! Se você deseja contribuir para o projeto, por favor, siga estas etapas:

1. Faça um fork do repositório.
2. Crie uma branch para a sua feature (`git checkout -b minha-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova feature'`).
4. Faça push para a branch (`git push origin minha-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Contato

Se você tiver dúvidas ou precisar de mais informações, sinta-se à vontade para entrar em contato:

- [Felipe Almeida](https://www.linkedin.com/in/felipe-almeida-2092a21b1/)
- Email: felipe.si.almeida@gmail.com
```
