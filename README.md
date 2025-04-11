# 📱 finance_pro_app

Versão mobile (Flutter) do sistema **FinancePro**, um app de controle financeiro pessoal. A proposta é permitir que usuários possam visualizar, adicionar e controlar suas **receitas e despesas** diretamente do smartphone, com interface amigável, gráficos de pizza, e sistema de autenticação.

---

## 🚀 Propósito

Este projeto tem como objetivo expandir a aplicação web FinancePro para dispositivos móveis, oferecendo as principais funcionalidades como:

- Visualização de receitas e despesas em gráficos;
- Modo visitante (sem login);
- Login com autenticação via token;
- Interface moderna com suporte a temas escuros;
- Armazenamento local do token com navegação inteligente.

---

## 📦 Dependências

As principais dependências utilizadas no projeto são:

| Pacote                     | Função                                                                 |
|---------------------------|------------------------------------------------------------------------|
| `flutter`                 | SDK principal da aplicação.                                            |
| `shared_preferences`      | Armazena dados localmente no dispositivo (ex: token de autenticação). |
| `fl_chart`                | Renderização de gráficos (gráficos de pizza neste caso).              |

Você pode instalá-las com:

```bash
flutter pub get
```

---

## 🧠 Lógica da Aplicação

A lógica básica do app está dividida em algumas partes-chave:

### 1. `StartScreen` (Tela inicial)
Responsável por verificar se existe um token salvo localmente. Redireciona o usuário automaticamente:

- Se houver token → vai para a `HomePage` com funcionalidades completas;
- Se **não houver token** → vai para a `HomePage` em modo visitante, com botão para login.

### 2. `HomePage`
Renderiza gráficos de **Receitas** e **Despesas** com `PieChart`.

- Exibe os dados simulados no momento (mock);
- Se o token for nulo, mostra um aviso e botão para login;
- Com token, mostra botões para adicionar receitas/despesas (em desenvolvimento).

### 3. `LoginPage` (em desenvolvimento)
Será responsável por autenticar o usuário e salvar o token usando `SharedPreferences`.

---

## 🗂 Estrutura de Pastas

```
lib/
├── main.dart              # Configura o MaterialApp e rotas
├── pages/
│   ├── home.dart          # Página principal com os gráficos
│   ├── login.dart         # Tela de login do usuário
│   └── start_screen.dart  # Tela que verifica o token e redireciona
```

---

## ▶️ Como Rodar

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/finance_pro_app.git
cd finance_pro_app
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Rode no emulador ou dispositivo:
```bash
flutter run
```

---

## 📌 Próximas etapas

- [ ] Consumir API para dados reais de receitas/despesas;
- [ ] Implementar cadastro de novas transações;
- [ ] Adicionar logout e perfil do usuário;
- [ ] Melhorar responsividade e animações e gráficos

---

## 📄 Licença

Este projeto é de código aberto e está sob a licença MIT.

---

## ✨ Créditos

Projeto inspirado na versão web do [FinancePro](https://finance-pro-mu.vercel.app/) e desenvolvido com Flutter para expandir a usabilidade da plataforma.

---
