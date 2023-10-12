# Aplicativo de Personagens da Marvel

Este é um aplicativo multiplataforma desenvolvido em Flutter que permite aos usuários visualizar informações sobre personagens da Marvel a partir de sua API pública. O aplicativo inclui as seguintes funcionalidades:

1. **Lista de Personagens**:
    - Nomes e fotos dos personagens da Marvel.
    - Paginação infinita para carregar mais personagens.
    - Clique em um personagem para ver mais detalhes.

2. **Detalhes do Personagem**:
    - Foto, nome e descrição do personagem.
    - Lista de quadrinhos em que o personagem apareceu.

## Capturas de Tela

![Página 1](https://github.com/danielmaques/marvel_desafio_tecnico/assets/76397634/da6b0d3e-2372-461c-86f6-c238ecf30e31)
![Página 2](https://github.com/danielmaques/marvel_desafio_tecnico/assets/76397634/ded87bf6-f4f4-409e-8f16-fa439afa3310)

## Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/downloads)

## Configuração

1. Clone o repositório:

    ```bash
    git clone https://github.com/seu-usuario/seu-repositorio.git
    ```

2. Navegue até o diretório do projeto:

    ```bash
    cd seu-repositorio
    ```

3. Obtenha as dependências do projeto:

    ```bash
    flutter pub get
    ```

4. Execute o aplicativo em um emulador ou dispositivo:

    ```bash
    flutter run
    ```

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) - Framework para desenvolvimento de aplicativos móveis.
- [Dio](https://pub.dev/packages/dio) - Cliente HTTP para consumir a API da Marvel.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) - Gerenciamento de estado no aplicativo.
- [Flutter Modular](https://pub.dev/packages/flutter_modular) - Roteamento e injeção de dependências.

## Estrutura do Projeto

- `lib/` - Contém o código-fonte principal do aplicativo.
  - `core/` - Classes e funcionalidades centrais do aplicativo.
  - `module/` - Módulos de recursos do aplicativo.
- `test/` - Contém testes unitários do aplicativo.

## Testes Unitários

O aplicativo inclui testes unitários para verificar a funcionalidade de suas partes principais. Para executar os testes, você pode usar o seguinte comando:

```bash
flutter test
